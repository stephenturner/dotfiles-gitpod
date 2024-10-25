syntax enable           " enable syntax highlighting
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" esc is really far away. jk is escape in edit mode
inoremap jk <esc>

set backspace=indent,eol,start
set visualbell
set autoindent
set history=50
set ruler
set title

" For .py files
autocmd Filetype python setlocal smarttab expandtab tabstop=4 shiftwidth=4

" Key mappings
set pastetoggle=<F3>

" Don't use Ex mode, use Q for formatting
map Q gq

" ENABLE MOUSE
if has('mouse')
  set mouse=a
endif
