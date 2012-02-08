;;; campfire.el -- an interface to campfire

;; Copyright (C) 2010 Tim Harper <http://tim.theenchanter.com> 
;; Authors: Tim Harper
;; URL: http://github.com/timcharper/campfire.el
;; Created: 2010
;; Version: 0.1
;; Keywords: campfire chat

;;; Commentary:
;;
;; This file is NOT part of GNU Emacs.
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; See <http://www.gnu.org/licenses/> for a copy of the GNU General
;; Public License.

;;; Documentation:
;;

;;; Code:

(require 'url)
(require 'tls)
(require 'url-http)
(require 'json)
(require 'button)

(defgroup campfire nil "campfire client for Emacs"
  :group 'applications)

(defvar campfire-domains nil
  "An alist of domains that you can connect to. If set, you will be prompted for a domain when you try to to connect.

Variable should look like this:

(defvar campfire-domains
      \'(((domain . \"my-domain.campfirenow.com\")
         (token . \"your-token-here\")
         (ssl . nil))
        ((domain . \"my-other-domain.campfirenow.com\")
         (token . \"your-other-token-here\")
         (ssl . t))))")

(defcustom campfire-domain nil "The domain to connect to"
  :group 'campfire
  :type 'string)
(defcustom campfire-ssl nil "Use SSL"
  :group 'campfire
  :type 'string)
(defcustom campfire-token nil "Your campfire token (check your profile settings to find it)"
  :group 'campfire
  :type 'string)
(defcustom campfire-debug nil "enable debug mode (leave tons of buffers and other garbage around)"
  :group 'campfire
  :type 'boolean)

(defcustom campfire-timezoneoffset -7 "time zone. I couldn't figure out how to extract this from Emacs, so I had to hardcode it for now." :group 'campfire)

(defvar campfire-last-user-text nil)

(defvar campfire-message-received-hook nil
  "Hook called whenever there is a new message.
Listeners should receive args (name body message). Name and body are strings, and message is an alist with the rest of the details just in case you want them.

Called with the campfire room bufer, so variables such as campfire-room-name are available. ")

(defvar campfire-transcript-updated-hook nil "Hook called whenever the transcript is updated")

(defvar campfire-user-cell-width 20 "the width of the user cell")
(defvar campfire-last-heartbeat nil "last time we saw a message (event be it the scondly ping) from campfire.")

(defgroup campfire-faces nil "Faces for campfire-mode"
  :group 'campfire)

(defface campfire-message-face
  '((t ()))
  "face used for message input area"
  :group 'campfire-faces)

(defface campfire-timestamp-face
  '((t (:foreground "green")))
  "timestamp"
  :group 'campfire-faces)

(defface campfire-action-face
  '((t (:foreground "blue")))
  "action face"
  :group 'campfire-faces)

(defface campfire-other-user-face
  '((t ()))
  "other user face"
  :group 'campfire-faces)

(defface campfire-other-message-face
  '((t ()))
  "other message face "
  :group 'campfire-faces)

(defface campfire-my-user-face
  '((t (:background "grey")))
  "my message face"
  :group 'campfire-faces)

(defface campfire-my-message-face
  '((t (:background "grey")))
  "my transcript face"
  :group 'campfire-faces)


(defface campfire-paste-face
  '((t (:foreground "grey")))
  "my transcript face"
  :group 'campfire-faces)

(defun alist-value (key alist) (let ((a (assoc key alist))) (and a (cdr a))))

(defun campfire-response (buffer)
  "Process the XML response from campfire which resides in BUFFER."
  (unwind-protect
      (with-current-buffer buffer
        (save-excursion
          (url-http-parse-response)
          (url-http-parse-headers)
          (goto-char url-http-end-of-headers)
          (if (and (>= url-http-response-status 200)
                   (< url-http-response-status 300))
              (if (looking-at "\n*{")
                  (let ((response (json-read)))
                    (campfire-check-error response)
                    response)
                nil)
            (signal 'campfire-error
                    (list (format "Response code %d"
                                  url-http-response-status))))))
    (unless campfire-debug
      (kill-buffer buffer))))


(defun campfire-api-url (&optional format-string &rest args)
  (let ((base (concat (if campfire-ssl "https://" "http://") campfire-domain (if campfire-ssl ":443" ":80"))))
    (cond (format-string (concat base "/" (apply 'format format-string args)))
          (t base))))

(defun fetch-campfire-rooms ()
  (let ((response (campfire-url-retrieve-synchronously (campfire-api-url "rooms.json"))))
    (cdar response)))

(defun campfire-fetch-room-details (campfire-room-id)
  "Fetches room details"
  (cdar (campfire-url-retrieve-synchronously (campfire-api-url "room/%s.json" campfire-room-id))))

(defun campfire-room-id-for-name (campfire-rooms name)
  (let ((room (find-if (lambda (room) (equal (cdr (assoc 'name room)) name)) campfire-rooms)))
    (and room (cdr (assoc 'id room)))))

(defun campfire-room-names (campfire-rooms)
  (map 'list (lambda (room-details) (cdr (assoc 'name room-details))) campfire-rooms))


(defun campfire-completing-read (prompt choices  &optional predicate require-match
                                        initial-input hist def)
  "use ido if available"
  (if (functionp 'ido-completing-read)
      (ido-completing-read prompt choices predicate require-match
                         initial-input hist def)
    (completing-read prompt collection predicate require-match initial-input hist def inherit-input-method)))

(defun campfire-select-domain ()
  (let ((domain-name (campfire-completing-read
                      "Domain: "
                      (map 'list (lambda (domain) (alist-value 'domain domain)) campfire-domains)
                      nil
                      t)))
    (or (find-if (lambda (domain) (message (alist-value 'domain domain)) (equal (alist-value 'domain domain) domain-name)) campfire-domains)
        (error 'no-such-domain))))

(defun campfire ()
  "connect to campfire"
  (interactive)
  (if campfire-domains
      (let ((domain (campfire-select-domain)))
        (setq campfire-domain (alist-value 'domain domain)
              campfire-ssl (alist-value 'ssl domain)
              campfire-token (alist-value 'token domain)
              campfire-rooms (fetch-campfire-rooms)
              campfire-room-name (campfire-completing-read "Campfire room: " (campfire-room-names campfire-rooms) nil t)
              campfire-room-id (campfire-room-id-for-name campfire-rooms campfire-room-name))))

  (campfire-join))

(defun campfire-join ()
  (let ((buf (get-buffer-create (concat "*Campfire: " campfire-room-name "*"))))
    (switch-to-buffer buf)
    (kill-all-local-variables)
    (campfire-fetch-my-user-id)
    (campfire-room-mode)
    (campfire-open-stream)
    (campfire-display-transcript)))

;; (campfire-start)

(define-derived-mode campfire-room-mode text-mode "Campfire room mode"
  "Major mode for campfire rooms"
  (make-local-variable 'campfire-room-id)
  (make-local-variable 'campfire-my-user-id)
  (make-local-variable 'campfire-last-user-text)
  (make-local-variable 'campfire-token)
  (make-local-variable 'campfire-ssl)
  (make-local-variable 'campfire-domain)
  (make-local-variable 'campfire-room-name)
  (make-local-variable 'campfire-users) ;; alist containing the current users
  (make-local-variable 'campfire-room-details)

  (make-local-variable 'campfire-transcript-overlay)
  (make-local-variable 'campfire-message-overlay)
  (make-local-variable 'campfire-banner-overlay)
  (make-local-variable 'campfire-last-heartbeat)

  (make-local-variable 'campfire-streaming-buffer)
  (make-local-variable 'campfire-stream)

  (campfire-refresh-room-details)
  (campfire-initialize-display)
  (define-key campfire-room-mode-map (kbd "C-c C-c") 'campfire-speak-textmessage)
  (define-key campfire-room-mode-map (kbd "C-c C-p") 'campfire-speak-paste))

(defun campfire-refresh-room-details ()
  "load room details"
  (setq campfire-room-details (campfire-fetch-room-details campfire-room-id))
  (setq campfire-users (append (cdr (assoc 'users campfire-room-details)) nil)))

(defun campfire-speak-string (string kind)
  "Speak a message into the current room"
  (let ((url-request-data (json-encode (list (cons 'message
                                                   (list
                                                    (cons 'body string)
                                                    (cons 'type kind)))))))

    (campfire-url-retrieve
     (campfire-api-url "room/%s/speak.json"  campfire-room-id)
     'campfire-speak-reponse-received
     "POST"
     '(("Content-Type" . "application/json")))))

(defun campfire-speak-textmessage ()
  "speaks the text in the input section of the buffer as a text message"
  (interactive)
  (campfire-speak-string (filter-buffer-substring (overlay-start campfire-message-overlay) (overlay-end campfire-message-overlay) t) "TextMessage"))

(defun campfire-speak-paste ()
  "speaks the text in the input section of the buffer as a text message"
  (interactive)
  (campfire-speak-string (filter-buffer-substring (overlay-start campfire-message-overlay) (overlay-end campfire-message-overlay) t) "PasteMessage"))

(defun campfire-basic-authorization-string ()
  "returns a base 64 encoded authorization string"
  (concat "Basic " (base64-encode-string (concat campfire-token ":x"))))

(defmacro campfire-with-request-headers (request-method other-headers &rest body)
  `(let ((url-request-extra-headers
          (append `(("Authorization" . ,(campfire-basic-authorization-string)))
                  ,other-headers
                  ))
         (url-request-method (or ,request-method "GET")))
    ,@body))

(defun campfire-url-retrieve-synchronously (url &optional request-method other-headers)
  (campfire-with-request-headers request-method
                                 other-headers
                                 (message (format "requesting with %s" url-request-extra-headers))
                                 (campfire-response (url-retrieve-synchronously url))))

(defun campfire-url-retrieve (url my-callback &optional request-method other-headers)
  (let ((campfire-url-retrieve-parent-buffer (current-buffer)))
    (campfire-with-request-headers request-method other-headers
                                   (url-retrieve url `(lambda (status &rest args)
                                                        (let ((response (campfire-response (current-buffer))))
                                                          (set-buffer ,campfire-url-retrieve-parent-buffer)
                                                          (,my-callback response)))))))

(defun campfire-join-room ()
  (campfire-url-retrieve-synchronously (campfire-api-url "room/%s/join.json" campfire-room-id) "POST" nil))

(defun campfire-check-stream ()
  "Check the status of the streaming network process"
  (interactive)
  (process-status campfire-stream))

(defun campfire-open-stream ()
  (campfire-join-room)
  (let ((campfire-streaming-domain "streaming.campfirenow.com"))
    (setq campfire-streaming-buffer
          (get-buffer-create (concat " *campfire-" campfire-room-name "-stream*")))
    (setq campfire-stream
          ;; (if campfire-ssl
          ;;     (open-ssl-stream  (concat "stream-" campfire-room-name) campfire-streaming-buffer campfire-streaming-domain 443))
          (open-network-stream (concat "stream-" campfire-room-name) campfire-streaming-buffer campfire-streaming-domain 80))
    (let ((room-buffer (current-buffer))
          (room-campfire-stream campfire-stream))
      (with-current-buffer campfire-streaming-buffer
        (set (make-local-variable 'response-received) nil)
        (set (make-local-variable 'room-buffer) room-buffer)
        (set (make-local-variable 'room-campfire-stream) room-campfire-stream)
        ;; (make-variable-buffer-local 'room-buffer)
        ;; (setq room-buffer room-buffer)
        (filter-buffer-substring (point-min) (point-max) t)))

    (process-send-string campfire-stream (format "GET /room/%s/live.json HTTP/1.1
Host: %s
Authorization: %s
Accept: application/json
Connection: close\n\n"
                                                 campfire-room-id
                                                 campfire-streaming-domain
                                                 (campfire-basic-authorization-string)))
    (set-process-filter campfire-stream 'campfire-stream-data-received)
    (set-process-sentinel campfire-stream 'campfire-stream-process-sentinal)
    (campfire-system-message "Connected")
    (campfire-check-heartbeat (current-buffer))))

(defun campfire-check-heartbeat (buffer)
  (if (and campfire-last-heartbeat (buffer-live-p buffer))
      (with-current-buffer buffer
        (if (> (- (time-to-seconds (current-time)) (time-to-seconds campfire-last-heartbeat)) 20)
            (progn
              (message (format "Connection lost in %s!" campfire-room-name))
              (campfire-display-message '((id) (user_id) (body . "Connection lost") (type . "SystemMessage"))))
          (run-at-time "20 seconds" nil `(lambda () (campfire-check-heartbeat ,(current-buffer))))))))

(defun campfire-stream-terminate ()
  "run from stream buffer, terminate and clean up"
  (set-process-sentinel room-campfire-stream nil)
  (delete-process room-campfire-stream)
  (kill-buffer (current-buffer)))

(defun campfire-stream-process-sentinal (process event)
  "auto restart the streaming process"
  (if (buffer-live-p (process-buffer process))
      (unless (equal 'open (process-status process))
        (with-current-buffer (with-current-buffer (process-buffer process) room-buffer)
          (campfire-system-message "Connection lost. Reconnecting...")
          (set-process-sentinel process nil)
          (campfire-open-stream))))) 

(defun campfire-stream-data-received (process output)
  (if (buffer-live-p (process-buffer process))
      (with-current-buffer (process-buffer process)
        (goto-char (point-max))
        (insert output)
        (if (buffer-live-p room-buffer)
            (campfire-stream-process-data-received)
          (campfire-stream-terminate)))
    (delete-process process)))


(defun campfire-stream-process-data-received-process-response ()
  "Called from within the streaming buffer. Parses the initial HTTP response. "
  (save-excursion
    (goto-char (point-min))
    (if (looking-at "HTTP\/\\([0-9]+\.[0-9]\\)+ \\([0-9]+\\) \\([A-Z]+\\)")
        (progn
          (unless (equal (match-string 2) "200")
            (signal 'campfire-error (list (format "unexpected HTTP response: %s" (match-string 0)))))
          (search-forward "\\n\\n" nil t)
          (filter-buffer-substring (point-min) (point) t)
          (setq response-received t)))))

(defun campfire-stream-process-data-received ()
  "Called from within the streaming buffer. Parses the stream, if JSON data is available"
  (save-excursion
	  ;; (set-buffer campfire-streaming-buffer)
    (unless response-received (campfire-stream-process-data-received-process-response))
    (goto-char (point-min))
    (while (search-forward "\" nil t)
        (let ((message-size (string-to-number (filter-buffer-substring (point-min) (- (point) 1)) 16)))
          (if (> (point-max) (+ (point) message-size))
              (progn
                (with-current-buffer room-buffer (setq campfire-last-heartbeat (current-time)))
                (filter-buffer-substring (point-min) (+ (point) 1) t)
                (while (looking-at "{")
                  (let* ((original-point (point))
                         (message (json-read-object))
                         (text (filter-buffer-substring original-point (+ (point) 1) t)))
                  
                    (campfire-log (format "%s\n%s" text message))
                    (with-current-buffer room-buffer (campfire-display-message message))))))))))

(defun campfire-display-transcript ()
  (let ((response (campfire-url-retrieve-synchronously (campfire-api-url "room/%s/transcript.json" campfire-room-id))))
    (map 'list
     (lambda (message) (campfire-display-message message t))
     (alist-value 'messages response))))

(defun campfire-speak-reponse-received (response)
  (setq campfire-my-user-id (cdr (assoc 'user_id (cdr (assoc 'message response)))))
  (save-excursion
    (goto-char (overlay-end campfire-transcript-overlay))
    (insert "...\n")
    (run-hook-with-args 'campfire-transcript-updated-hook)))

(defun campfire-find-user-by-id (id &rest no-reload-users-on-miss)
  (or
   (find-if (lambda (user) (= (cdr (assoc 'id user)) id)) campfire-users)
   (and (not no-reload-users-on-miss)
        (let ((fetched-user (alist-value 'user (campfire-url-retrieve-synchronously (campfire-api-url "/users/%s.json" id)))))
          (if fetched-user (setq campfire-users (cons fetched-user campfire-users)))
          fetched-user))))

(defun campfire-user-get-name (user)
  (alist-value 'name user))

(defun campfire-fetch-my-user-id ()
  (setq campfire-my-user-id
        (alist-value
         'id 
         (alist-value
          'user
          (campfire-url-retrieve-synchronously (campfire-api-url "users/me.json"))))))

(defun campfire-get-user-name-from-message (message)
  (let ((user-id (alist-value 'user_id message)))
    (and user-id
         (alist-value 'name (campfire-find-user-by-id user-id)))))


(defun campfire-extract-day-from-timestamp (timestamp)
  (replace-regexp-in-string " .+$" "" timestamp))

(defun campfire-extract-hour-minute-from-timestamp (timestamp)
  (let* ((parsed (parse-time-string (replace-regexp-in-string "/" "-" timestamp)))
         (minute (cadr parsed))
         (hour (caddr parsed)))
    (format "%d:%02d" (% (+ (+ hour campfire-timezoneoffset) 24) 24) minute)))

;; (campfire-extract-hour-minute-from-timestamp "2009/01/01 04:45:00")


(defun campfire-insert-user-cell (text &optional face)
  "displays text for the user cell"
  (let ((begin (point))
        (fill-column (- campfire-user-cell-width 1)))
    (insert (concat text ":"))
    (fill-region begin (point) 'right)
    (goto-char (- (point) 1))
    (set-text-properties begin (point) `(face ,face))
    (setq campfire-last-user-text text)))

(defun campfire-insert-message-cell (text &optional face &rest options)
  "displays text for the user cell"
  (newline)
  (let ((begin (point))
        (fill-column (- 80 campfire-user-cell-width)))
    (insert (concat text))
    (newline)
    (unless (alist-value 'no-wrap options)
      (fill-region begin (point)))
    (indent-rigidly begin (point) campfire-user-cell-width)
    (if face (set-text-properties (- begin 1) (- (point) 1) `(face ,face)))

    (goto-char begin)
    (join-line)))

(defun campfire-system-message (message)
  "insert a system message"
  (save-excursion
    (goto-char (overlay-end campfire-transcript-overlay))
    (campfire-insert-user-cell "(system)")
    (campfire-insert-message-cell message)))


(defun campfire-click-paste-button (button)
  (let* ((message (overlay-get button 'message))
         (message-body (alist-value 'body message))
         (pasted-buffer (get-buffer-create (format "CampfirePaste-%s-%s" (overlay-get button 'name) (alist-value 'id message)))))
    (switch-to-buffer pasted-buffer)
    (insert message-body)))

(defun campfire-display-message (message &optional old)
  (save-excursion
    (goto-char (overlay-end campfire-transcript-overlay))
    (let* ((type (alist-value 'type message))
           (body (alist-value 'body message))
           (user_id (alist-value 'user_id message))
           (name (campfire-get-user-name-from-message message))
           (self? (equal campfire-my-user-id user_id)))
      (cond ((equal type "TimestampMessage")
             (let ((time (alist-value 'created_at message)))
               (campfire-insert-user-cell (campfire-extract-day-from-timestamp time) 'campfire-timestamp-face)
               (campfire-insert-message-cell (campfire-extract-hour-minute-from-timestamp time) 'campfire-timestamp-face)))
             
            ((equal type "TopicChangeMessage")
             (campfire-insert-user-cell "New Topic:" 'campfire-action-face)
             (campfire-insert-message-cell body 'campfire-action-face))
             
            ((equal type "TextMessage")
             (campfire-insert-user-cell name
                                        (if self? 'campfire-my-user-face 'campfire-other-user-face))
             (campfire-insert-message-cell body
                                           (if self? 'campfire-my-message-face 'campfire-other-message-face)))
             
            ((equal type "PasteMessage")
             (campfire-insert-user-cell name
                                        (if self? 'campfire-my-user-face 'campfire-other-user-face))
             (let ((start (+ (point) 1))
                   (preview (substring body 0 (min 300 (length body)))))
               (set-text-properties 0 (length preview) '(face campfire-paste-face) preview)
               (campfire-insert-message-cell
                (concat "View Paste:\n-------------------\n"
                        preview
                        (if (>= (length body) 300) (format "\n... (%d more bytes)" (- (length body) 300)))
                        "\n")
                nil
                '(no-wrap t))
               (make-button start (+ start 11)
                            'action 'campfire-click-paste-button
                            'room-buffer (current-buffer)
                            'follow-link t
                            'message message
                            'name name)))
             
            ((equal type "KickMessage")
             (campfire-insert-user-cell name 'campfire-action-face)
             (campfire-insert-message-cell "has left the room" 'campfire-action-face))

            ((equal type "EnterMessage")
             (campfire-insert-user-cell name 'campfire-action-face)
             (campfire-insert-message-cell "has entered the room" 'campfire-action-face))
             
            ((equal type "UploadMessage")
             (campfire-insert-user-cell name 'campfire-action-face)
             (campfire-insert-message-cell (concat
                                            "uploaded a file: "
                                            body
                                            " - "
                                            (campfire-api-url "room/%s"
                                                              campfire-room-id))
                                           'campfire-action-face))
            ((equal type "SystemMessage")
             (campfire-insert-user-cell "System" 'campfire-action-face)
             (campfire-insert-message-cell body 'campfire-action-face))
            (t
             (campfire-insert-user-cell "" 'campfire-user-face)
             (campfire-insert-message-cell (format "%s" message) 'campfire-action-face)))
      (campfire-delete-last-indicator)
      (unless (or old self? (null name)) (run-hook-with-args
                                          'campfire-message-received-hook
                                          name
                                          body
                                          message))
      (run-hook-with-args 'campfire-transcript-updated-hook))))

(defun campfire-delete-last-indicator ()
  "run from within the chat room. Delete the last indicator."
  (save-excursion
    (goto-char (overlay-end campfire-transcript-overlay))
    (if (re-search-backward "\n...\n" nil t)
        (let ((length 4)) (delete-char length)))))

(defun campfire-log (message)
  (with-current-buffer (get-buffer-create " *campfire-log*")
    (goto-char (point-max))
    (insert message)
    (newline)))

(defun campfire-initialize-display ()
  "initializes the buffer with the decoration"
  
  (filter-buffer-substring (point-min) (point-max) t)
  (remove-overlays)
  (let (banner-start banner-end)
       (goto-char (point-min))
       (insert "\n\n")
       (setq banner-start (point))
       (insert "=====================================\n") ;; a banner
       (setq banner-end (point))
       (setq campfire-transcript-overlay (make-overlay (point-min) banner-start nil nil t))
       (setq campfire-banner-overlay (make-overlay banner-start banner-end nil t))
       (setq campfire-message-overlay (make-overlay banner-end (point-max) nil nil t))
              
       (overlay-put campfire-transcript-overlay 'read-only "transcript is read-only")
       (overlay-put campfire-banner-overlay 'intangible t)
       (overlay-put campfire-banner-overlay 'read-only t)
       (overlay-put campfire-message-overlay 'font-lock-face 'campfire-message-face)      
       ))

(defun campfire-check-error (response)
  nil)

(if (functionp 'goto-address)
    (add-hook 'campfire-transcript-updated-hook 'goto-address))
(provide 'campfire)
;; (setq stack-trace-on-error nil)
