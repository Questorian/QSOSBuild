" configuration file
" &
" ---------------------------------
" to edit - :e $MYVIMRC

" need this -  to enable modern stuff
" but no-longer compatible with original vi
set nocompatible

" start pathogen - filetype on must come after this call
" call pathogen#infect()

filetype plugin on
syntax on


"=====[ keyboard purity ]======================================
"
noremap <Up>        <Nop>
noremap <Down>      <Nop>
noremap <Left>      <Nop>
noremap <Right>     <Nop>



"=====[ Backups ]==============================================
set backup			" always keep a backup file before editing
set writebackup
set backupdir=~/.vim/bkup
set directory=~/.vim/tmp
set undodir=~/.vim/tmp
set backupskip=/tmp/*


"=====[ general settings ]======================================
"
set ruler			" display where we are in doc on bottom status line
set relativenumber  " make relative line numbering the default
set history=2000	" set history stack size - (can persist after restart)
set undolevels=1000 " a big undo stack is required - yes exageration
set showcmd         " display commands as they are entered
set visualbell
set undofile
set cursorline
set autowrite       " automatically save files when hiding buffers/files
set autoread        " always reload buffer when external changes detected


"=====[ search & replace  ]======================================
"
set ignorecase		" case insensitive text search by default
set smartcase       " will switch to case sensitive when mixed case supplied
set hlsearch		" enable higlighting when searching - Brams tip
set gdefault        " make /substitions 'global' by default - add 'g' back if not


"=====[ Text handling ]======================================
"
set textwidth=78    " wrap at column 78 (PBP)
set colorcolumn=+1  " visible textwidth border on left edge of display
set nofoldenable    " do not fold code by default



"=====[ Tab handling ]======================================
"
set tabstop=4      "Tab indentation levels every four columns
set shiftwidth=4   "Indent/outdent by four columns
set expandtab      "Convert all tabs that are typed into spaces
set shiftround     "Always indent/outdent to nearest tabstop
set smarttab       "Use shiftwidths at left margin, tabstops everywhere else


"=====[ Leader key and Customisations ]======================================
"
let mapleader=","   " change <Leader> to comma (rather than default '\')

nnoremap <leader>ev     :edit $MYVIMRC<CR>      " edit vimrc
nnoremap <leader>sv     :source $MYVIMRC<CR>    " Source vimrc
nnoremap <leader>a      :Ack    " Ack shortcut for searching 
nnoremap <leader>l      yypVr-          " underline - single
nnoremap <leader>ll      yypVr=         " underline - double


"=====[ "The Smash" ]======================================
"
inoremap jk <esc>
inoremap kj <esc>
"inoremap df <esc>
"inoremap fd <esc>


" line numbers on - but only on current edit buffer
set number
au WinEnter *       :setlocal number
au WinLeave *       :setlocal nonumber



"=====[ General programming support ]===================================
"
"" Insert various shebang lines...
iab hbs #! /bin/sh
iab hbp #! /usr/bin/env perl<CR><CR>use 5.020;<CR>use warnings;<CR>use warnings;<CR>


"=====[ Status Line ]======================================
"
" currently using AirLine - force with 'laststatus=2'
set laststatus=2

"set statusline=%t       "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%h      "help file flag
"set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
"set statusline+=%=      "left/right separator
"set statusline+=%c,     "cursor column
"set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ %P    "percent through file

"=====[ Perl ]======================================
au FileType pl,pm,t set filetype=perl
" use Perl compiler for all *.pl and *.pm files
"au BufNewFile perl  

set iskeyword+=:	" colon used by Perl Modules
set matchpairs=<:>  " allow % to bounce between angle brackets too

" Perl - keyboard stuff
" note: comma "," - is our leader!
map <Leader>pt             <ESC>:%! perltidy<CR>
map <Leader>ptv            <ESC>:<,'>! perltidy<CR>
map <Leader>t              <ESC>:!prove -vl %<CR>

let perl_synwrite_qf=1      " reqires Vi::QuickFix module
"let perl_synwrite_au=1      " quirky! - calls :W automatically on :w calls


:noremap K :!perldoc <cword> <bar><bar> perldoc -f <cword><cr>


" http://vimdoc.sourceforge.net/htmldoc/vimfaq.html
" 5.5. How do I configure Vim to open a file at the last edited location?
" Vim stores the cursor position of the last edited location for each buffer
" in the '"' register. You can use the following autocmd in your .vimrc or
" .gvimrc file to open a file at the last edited location:
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif


"=====[ Shell ]==================================
if has ('Win32') || has('Win64')
    " PowerShell - on Windows
    set shell=PowerShell 
    set shellcmdflag=-noprofile\ -NoLogo\ -command
endif


" Timestamp routines ...
map	<F5>	:setlocal spell! spelllang=en_us<CR>
nmap	<F3>	a<C-R>=strftime("%Y-%m-%dT%H:%M:%S")<CR><ESC>
imap	<F3>	<C-R>=strftime("%Y-%m-%dT%H:%M:%S")<CR>
map	<S-F3>	a<C-R>=strftime("%Y-%m-%d")<CR><ESC>
imap	<S-F3>	<C-R>=strftime("%Y-%m-%d")<CR>


" Display Stuff - Font & Console
" ------------------------------
" set lines=45 columns=99 
" get rid of toolbar and menubar if gui
set guioptions-=m
set guioptions-=T
" leave the scrollbar for now

" set the colour theme
if has ("gui_running")
    set background=dark
else
    set background=dark
endif

colorscheme elflord




" set font
if has ('Win32') || has('Win64')
	set guifont=Consolas:h11:cANSI
elseif has ("unix")
	let &guifont="Monospace 11"
endif


