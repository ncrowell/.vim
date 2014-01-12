all: bundle .check_vim_version

bundle: .gitmodules bundle/*
	git submodule sync
	git submodule update --init
	touch bundle

.check_vim_version:
	python handle_old_vim.py
