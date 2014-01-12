FILES=${HOME}/.vimrc ${HOME}/.gvimrc

all: ${FILES} bundle

${HOME}/.vimrc:
	ln -s ${PWD}/vimrc ${HOME}/.vimrc

${HOME}/.gvimrc:
	ln -s ${PWD}/gvimrc ${HOME}/.gvimrc

bundle: .gitmodules
	git submodule sync
	git submodule update --init
