set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" leader keymap
let mapleader = ","
filetype off                  " required
function! GlobalSeach()
    let text = escape(input("what do you want to seach?: "),  '\\/')
    if text == ""
        echo "" | return
    endif
    let extension = escape(input("Wich extension? (* for all): "), '\\/')
    if extension == ""
        echo "" | return
    endif

    let search_command = ':vim /\V' . text . '/gj ./**/*.' . extension
    try
        execute search_command 
    catch
        echo "Nothing found"
        return
    endtry

    lwindow
endfunction

""" mapping the function to leader-shift-f
noremap <leader><S-f> :call GlobalSeach() <CR>
" leader timeout
set timeoutlen=200
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Set up directories for swp and ~ files
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show line numbers
:set nu

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

set autowriteall
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" easier toggle between alternate buffer
map <Leader>a <C-^>
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

set wildignore+=*/bower_components,*/node_modules,*/dist,*/platforms,*/plugins
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" searches letter by letter and highlights search expression 
set is

" improved indenting
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
autocmd FileType html setlocal indentkeys-=*<Return> shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType go setlocal shiftwidth=8 tabstop=8
autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab
" :tabn and :tabp keymaps
map <F7> :tabp<CR>
map <F8> :tabn<CR>
map <F9> :tabe 

" copy all lines and paste from clipboard mappings 
map <C-a> :%w !pbcopy<CR><CR>
map <Leader>p "+]p
map <Leader>P "+]P
map <leader>y "+y
map <leader>t "+Y
map <leader>x "+x

" insert // at beginning of line
map <F2> <S-i>//<Esc>
"map <S-xF2> i
map <F3> ^2x

" black hole delete
map <Leader>d "_d

nnoremap ' `
" help
map <Leader>f :h<Space>
" make an new line
map <Leader>o o<Esc>
" make a new line above
map <Leader>O O<Esc>
" edit vimrc in split"
map <Leader>vr :vs ~/.vimrc<CR> 
" write and quit"
"map <Leader>wq :wq<CR>
" write
map <Leader>w :wall<CR>
" quit without saving"
map <Leader>q :q!<CR>
" put { around selection
:vnoremap _{ <Esc>`>a}<Esc>`<i{<Esc>

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" maximize and normalize splits
nnoremap <Leader>e\ <C-w>|
nnoremap <Leader>e= <C-w>=
nnoremap <Leader>e- <C-w>_

" compile tex, close Preview, open resume
map <Leader>ee :w<CR>:!sh vimtex.sh<CR><CR>
 " enable per-project .vimrc files
set exrc
set paste
let g:ctrlp_map = '<Leader>t'
