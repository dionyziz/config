" Version: 1.7

if &term =~ "xterm" || &term =~ "screen"
 set t_Co=256
 if has("terminfo")
   let &t_Sf=nr2char(27).'[3%p1%dm'
   let &t_Sb=nr2char(27).'[4%p1%dm'
 else
   let &t_Sf=nr2char(27).'[3%dm'
   let &t_Sb=nr2char(27).'[4%dm'
 endif
endif

call pathogen#infect()

map <C-]> :YcmCompleter GoToImprecise<CR>

let g:molokai_original = 1
:colorscheme molokai

set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set bs=2
set ignorecase
set smartcase
set gdefault
set autoindent
set autowrite
set hlsearch
set incsearch
set showmatch
set vb t_vb=
set ruler
set cursorline
syntax on
setlocal spell spelllang=en
set nospell
set encoding=utf-8
set number
set modeline
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
let mapleader = ","
nnoremap <leader><space> :noh<cr>
nnoremap <leader>t :tabnew<cr>:e<space>
nnoremap <leader>pp :set paste<cr>
nnoremap <leader>np :set nopaste<cr>
nnoremap <leader>z <C-w><C-w>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap <up> gk
nnoremap <down> gj

filetype plugin on 

" Tab autocompletes
function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction

:inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

autocmd BufRead,BufNewFile *.php setfiletype=php

" Common typos
:iab functino function
:iab fales false

" Trailing whitespace
autocmd FileType c,cpp,java,php,python,ruby,js,haskell,css,html autocmd BufWritePre <buffer> :%s/\s\+$//e

command! W :w
command! Q :q

map <F1> <Esc>
imap <F1> <Esc>
imap <C-c> <Esc>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

cmap w!! w !sudo tee % >/dev/null
set pastetoggle=<F8>

set mouse=v
set nohidden

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Restore cursor position to where it was before
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

autocmd FileType c         set makeprg=gcc\ -Wall\ -O2
autocmd FileType cpp       set makeprg=g++\ -std=c++11\ -Wall\ -O2
autocmd FileType python    set makeprg=python3

" Save, compile and run files
function! CompileAndRun()
  write
  silent! make %
  redraw!
  cwindow
  if len(getqflist()) == 0
    exec '!time ./a.out'
  endif
endfunction
nnoremap <leader>c :call CompileAndRun()<cr>

" Python-specific settings
set foldmethod=indent
set foldlevel=99

" Split behavior
set splitbelow
set splitright

" Required by file system watchers for e.g. webpack --watch
set backupcopy=yes

" Markdown-specific settings
autocmd FileType markdown set formatoptions+=t | set tw=79
