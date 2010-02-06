source package.sh

git submodule init
echoWithBars "submodules inited"
git submodule update
echoWithBars "submodules updated"

sed -e 's/^CEDET.*$/CEDET=\~\/\.emacs\.d\/packages\/cedet/' packages/ecb/Makefile > packages/ecb/MakefileMod

makeProjects
