set nocompatible                           " We're running Vim, not Vi!
syntax on                                  " Enable syntax highlighting
filetype plugin indent on                  " Enable filetype-specific indenting and plugins

set showmatch "show matching surround
"set hidden    "allow hiding buffers without save

colorscheme desert

"hide toolbar
set guioptions-=T

"gui font
set gfn=Monospace\ 17

" don't leave backup files scattered about.
set updatecount=0
set nobackup
set nowritebackup

"window resizing
noremap <leader>= :resize +5<CR>
noremap <leader>- :resize -5<CR>

noremap <leader>p :lcd %:p:h

"ignore case when searching
set smartcase
set ignorecase
set incsearch

"use normal commands for system clipboard
vmap <C-c> "+y
imap <C-v> <esc>pa

"easier saves
noremap <leader>w :w<CR>

"command-t
inoremap <leader>t :CommandT<CR>
noremap <leader>t :CommandT<CR>

"jump out of insert mode with jj
inoremap jj <Esc>

"backspace enters insert mode
noremap <BS> i<BS>

"kill and copy end of lines faster
noremap D d$
noremap Y y$

set nowrap            "no text wrapping
set selectmode=key    "shifted arrows for selection
set number              "show line numbers (nonumber for hide)
set tabstop=2
set shiftwidth=2
set softtabstop=2
set ai                "auto indent
set expandtab
set smarttab
set ww=<,>,[,],h,l    "wrap on movement keys
let mapleader = ","

" highlight searches, clear with spacebar
set hlsearch
set hl=l:Visual
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" reload vimrc
nmap ,s :source ~/.vimrc<CR>   

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Always show status line
set laststatus=2
" Custom Status Line
set statusline=%t%m\ cwd:\ %r%{CurDir()}%h%=col:%3v\ line:%4l\ of\ %L\ %p%%

function! CurDir()
  let curdir = substitute(getcwd(), '/home/(kyle|kpf|kf)/', "~/", "g")
  return curdir
endfunction

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" highlight cursor line in INSERT mode.
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

"tell the term has 256 colors
set t_Co=256

" grep options
set grepprg=ack
set grepformat=%f:%l:%m

" assume the /g flag on :s substitutions to replace all matches in a line
set gdefault

" keep 3 lines visible at top and bottom
set scrolloff=3

" NerdTree
let NERDTreeShowBookmarks=1
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" BufExplorer
"let g:bufExplorerSortBy='number'

" Command-T (supercedes FuzzyFinderTextMate)
"let g:CommandTMaxHeight=20
"let g:CommandTScanDotDirectories=0
set wildignore+=*.log,*.o,*.sassc,*.png,*.jpg,*.db,*.gif,*.jpeg,*.swf,*.class,*.scssc,*.pdf,public/richter_data/*.xml
set wildignore+=**/generated/**,*.cache,bin-debug/**,deploy/**,*.swc,public/system/**
map <C-t> :CommandT<CR>
"map <leader>f :CommandTFlush<CR>

" Tab and Shift-Tab indent and unindent
inoremap <S-Tab> <esc>mp<<2h`pa
noremap <Tab> >>
noremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Buffer nav with C-n C-p
inoremap <C-h> <esc><C-w><C-h>
inoremap <C-j> <esc><C-w><C-j>
inoremap <C-k> <esc><C-w><C-k>
inoremap <C-l> <esc><C-w><C-l>
noremap <C-h> <C-w><C-h>
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-l> <C-w><C-l>

" Copy paste using system clipboard
vmap <C-y> "+y
vmap <C-x> "+x
"vmap <C-u> "+p
"nmap <C-b> "+p
"imap <C-v> <esc>"+p
"imap <C-u> <esc>pa
" shift paste=paste
vmap <C-Y> "+y
vmap <C-X> "+x
"vmap <C-V> "+p
"nmap <C-V> "+p
"imap <C-V> <esc>"+p

" Home/end like emacs and bash
nmap <C-e> $
imap <C-e> <End>
nmap <C-a> ^
imap <C-a> <Home>
noremap <C-e> <End>
noremap <C-a> <Home>

" CTRL-S is Save
noremap <C-s> :w<CR>
inoremap <C-s> <esc>:w<CR>

" ,bd to close buffer without changing window layout.
noremap <leader>q :bd<CR>
nmap <leader>bd :Bclose<CR>
imap <C-b>d <esc>:Bclose<CR>
" select current definition
nmap <leader>vm <esc>[mmd]MV'd

" toggle numbers
nmap <leader>n :set nonu!<CR>

" Clear all comment markers (one rule for all languages)
map <leader>_ :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" json is javascript
autocmd BufNewFile,BufReadPost,BufEnter *.json set filetype=javascript

" god is ruby (hm.. that's a little bit of an over statement)
autocmd BufNewFile,BufReadPost,BufEnter *.god set filetype=ruby

" lcd to current rails project root
map <silent> <leader>r :if exists("b:rails_root")<CR>:Rlcd<CR>:endif<CR>

" lcd to current file path
map <silent> <leader>R :lcd %:p:h<CR>

