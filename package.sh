
function echobar(){
        echo \"=====================================================================================================================\"
}
function echoWithBars() {
	echobar
	echo  $1
	echobar	
}

function emacsMake() {
	if [ `ls $1 | grep MakefileMod | wc -l` -ne 0 ]
	then
		make -s -C $1 -f $1/MakefileMod
	elif [ `ls $1 | grep Makefile | wc -l` -ne 0 ]
	then
		make -s -C $1
	elif [ `ls $1 | grep configure.ac | wc -l` -ne 0 ]
	then
		cd $1;autoconf && ./configure;cd -
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
