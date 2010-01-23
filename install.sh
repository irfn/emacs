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


sed -e 's/^CEDET.*$/CEDET=\~\/\.emacs\.d\/packages\/cedit/' packages/ecb/Makefile > packages/ecb/MakefileMod


function emacsMake() {
	if [ `ls $1 | grep MakefileMod | wc -l` -ne 0 ]
	then
		make -s -C $1 -f $1/MakefileMod
	elif [ `ls $1 | grep Makefile | wc -l` -ne 0 ]
	then
		make -s -C $1
	else
		emacs -batch -f batch-byte-compile $1/*.el
	fi		
	echoWithBars  $1 + "completed "
}

function emacsMakeProjects() {
	echo `git submodule | awk '{print $2}'`
}

function headOf() {
	echo $1 | awk -F" " '{print $1}'
}

function tailOf() {
	echo $1 | awk -F" " '{print $1}'
}

function makeProjects() {	
	projects=`emacsMakeProjects`
	while [ `echo $projects| wc -w` -ne 0 ]
	do
		project=`headOf $projects`
		emacsMake $project
		projects=`echo $projects | sed "s,$project,,"`
	done
}  

makeProjects
