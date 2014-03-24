" Haskell
let g:haddock_browser = "/usr/bin/open"
let g:haddock_browser_callformat = "%s %s"
"Bundle 'bitc/vim-hdevtools'
Bundle 'dag/vim2hs'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'eagletmt/neco-ghc'
Bundle 'lukerandall/haskellmode-vim'

setlocal omnifunc=necoghc#omnifunc
" Configure browser for haskell_doc.vim
