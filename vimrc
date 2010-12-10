set nocompatible                           " We're running Vim, not Vi!
syntax on                                  " Enable syntax highlighting
"call pathogen#runtime_append_all_bundles() " autoload .vim/bundle
filetype plugin indent on                  " Enable filetype-specific indenting and plugins

set showmatch "show matching surround
set hidden    "allow hiding buffers without save

colorscheme desert

" don't leave backup files scattered about.
set updatecount=0
set nobackup
set nowritebackup
set guioptions-=T  "remove toolbar

"System paste
map <C-V>   	"+gP
vnoremap <C-C> "+y
vnoremap <C-X> "+x

set nowrap            "no text wrapping
set selectmode=key    "shifted arrows for selection
set number              "show line numbers (nonumber for hide)
set foldcolumn=0      "little space on the left.
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

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Always show status line
set laststatus=2
" Custom Status Line
"set statusline=%t%m\ cwd:\ %r%{CurDir()}%h%=col:%3v\ line:%4l\ of\ %L\ %p%%

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

" highlight cursor line in INSERT mode.
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

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

"buffers in Vim = tabs for everyone else
map <C-tab> :tabn<CR>
map <S-C-tab> :tabp<CR>
map <C-w> :x<CR> 

"not saved!!

" Tag List
map <leader>t :TlistToggle<CR>

" BufExplorer
let g:bufExplorerSortBy='number'

" Command-T (supercedes FuzzyFinderTextMate)
let g:CommandTMaxHeight=20
let g:CommandTScanDotDirectories=0
set wildignore+=*.log,*.o,*.sassc,*.png,*.jpg,*.db,*.gif,*.jpeg,*.swf,*.class,*.scssc,*.pdf,public/richter_data/*.xml
set wildignore+=**/generated/**,*.cache,bin-debug/**,deploy/**,*.swc,public/system/**
map <C-t> :CommandT<CR>
map <leader>f :CommandTFlush<CR>

" Key Mappings
" reload vimrc
nmap ,s :source ~/.vimrc<CR>

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

" Home/end like emacs and bash
nmap <C-e> $
imap <C-e> <End>
nmap <C-a> ^
imap <C-a> <Home>

map <S-End> <esc>V<End>
"nmap <S-End> V<End>


" CTRL-S is Save
noremap <C-s> :w<CR>
inoremap <C-s> <esc>:w<CR>

" ,bd to close buffer without changing window layout.
nmap <leader>bd :Bclose<CR>
imap <C-b>d <esc>:Bclose<CR>
" select current definition
nmap <leader>vm <esc>[mmd]MV'd

" toggle numbers
nmap <leader>n :set nonu!<CR>

map <leader>q <esc>:call WrapMode()<CR>
function! WrapMode()
  setlocal formatoptions=tcq
  setlocal textwidth=80
  setlocal wrap
  setlocal lbr
  setlocal foldmethod=manual
  setlocal spell
  " treat long wrapped lines (paragraphs) like short lines.
  " i.e., directional keys move directly up and down visually
  " and movement keys wrap to the next visual line, not the
  " next line break.
  map <buffer> <up> gk
  imap <buffer> <up> <C-o>gk
  map <buffer> <down> gj
  imap <buffer> <down> <C-o>gj
  map <buffer> <home> g<home>
  imap <buffer> <home> <C-o>g<home>
  map <buffer> <end> g<end>
  imap <buffer> <end> <C-o>g<end>
  map <buffer> j gj
  map <buffer> k gk
endfunction

"""""" Filetype Specific Settings
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!

  " lcd to current rails project root
  autocmd BufRead *.as set filetype=actionscript
  autocmd BufRead *.mxml set filetype=mxml
  autocmd BufRead *.rtex set filetype=tex
  autocmd BufRead *.clj set filetype=clojure
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.ru set filetype=ruby
  autocmd BufRead,BufNewFile Gemfile set filetype=ruby
  autocmd BufRead,BufNewFile Rakefile set filetype=ruby
  autocmd BufRead,BufNewFile Capfile set filetype=ruby
  autocmd BufRead,BufNewFile *.scss  set filetype=scss
  autocmd FileType java,c,cpp,c++ call s:MyCLikeSettings()
  autocmd FileType ruby,eruby call s:MyRubySettings()
  autocmd FileType vim call s:MyVimSettings()
  autocmd FileType python call s:MyPythonSettings()
  autocmd FileType markdown call s:MyMarkdownSettings()
  autocmd FileType clojure call s:MyClojureSettings()
  autocmd FileType html,xhtml source ~/.vim/ftplugin/zencoding.vim
  autocmd FileType actionscript,mxml call s:MyFlexSettings()
augroup END

" Clear all comment markers (one rule for all languages)
map <leader>_ :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

function! s:MyCLikeSettings()
  " Insert comments markers
  map - :s/^/\/\//<CR>:nohlsearch<CR>
endfunction

function! s:MyMarkdownSettings()
  set ai formatoptions=tcroqn2 comments=n:>
endfunction

function! s:MyVimSettings()
  " Insert comments markers
  map - :s/^/\"/<CR>:nohlsearch<CR>
endfunction

function! s:MyRubySettings()
  set ai sw=2 sts=2 et
  "improve autocomplete menu color
  let g:closetag_html_style=1
  " Insert comments markers
  map - :s/^/#/<CR>:nohlsearch<CR>
  " wrap selected text in ERB escape tag
  vnoremap <leader>m "zdi<%= <C-R>z %><ESC>

  " Get rid of rails format.html { } blocks
  map <silent> <leader>rf :%s/[a-z]*\.[a-z]* { \([^}]*\) }/\1<CR>
endfunction

function! s:MyClojureSettings()
  " let g:clj_highlight_builtins=1      " Highlight Clojure's builtins
  " let g:clj_paren_rainbow=1           " Rainbow parentheses'!

  let g:vimclojure#HighlightBuiltins=1   " Highlight Clojure's builtins
  let g:vimclojure#ParenRainbow=1        " Rainbow parentheses'!
  let g:vimclojure#DynamicHighlighting=1 " Dynamically highlight functions
endfunction

function! s:MyFlexSettings()
  set smartindent sw=2 sts=2 et
endfunction

" json is javascript
autocmd BufNewFile,BufReadPost,BufEnter *.json set filetype=javascript

function! s:MyPythonSettings()
  set ai sw=4 sts=4 et
  " insert comments marker
  map - :s/^/#/<CR>:nohlsearch<CR>
  set foldmethod=marker "auto fold
endfunction

" lcd to current rails project root
map <silent> <leader>r :if exists("b:rails_root")<CR>:Rlcd<CR>:endif<CR>

" lcd to current file path
map <silent> <leader>R :lcd %:p:h<CR>
