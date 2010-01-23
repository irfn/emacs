alias echobar="echo \"=====================================================================================================================\""

function echoWithBars() {
	echobar
	echo  $1
	echobar	
}

git submodule init
echoWithBars "submodules inited"
git submodule update
echoWithBars "submodules updated"


# make-cedit : 
make -s -C packages/cedit
echoWithBars "cedit completed"

# make-ecb : 
sed -e 's/^CEDET.*$/CEDET=\~\/\.emacs\.d\/packages\/cedit/' packages/ecb/Makefile > packages/ecb/MakefileMod
make -s -C packages/ecb -f MakefileMod


echoWithBars "ecb completed"

make -s -C packages/distel

echoWithBars "distel completed"
