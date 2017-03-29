"add menu
set guioptions+=m

"allow mouse resize window
set mouse=a

"alow auto reload file when file is modified
set autoread

"open current dir
nnoremap <F5> <Esc>:!start explorer /select,%:p<CR>
inoremap <F5> <Esc>:!start explorer /select,%:p<CR>

"Toggle auto-indenting for code paste
set pastetoggle=<F6>

"Enable/Disable cursorline. Default is 0.
let g:spacevim_enable_cursorline = 1

"Set the help language of vim. Default is 'en'.  You can change it to Chinese.
"let g:spacevim_vim_help_language = 'chinese'

"Enable/Disable tabline filetype icon. default is 0.
let g:spacevim_enable_tabline_filetype_icon=0

"Enable/Disable lint on save feature of SpaceVim's maker. Default is 1.
let g:spacevim_lint_on_save = 0

"close relative number
set norelativenumber

"set the default window size 50 lines and 150 columns
"if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  "set lines=50 columns=150
"else
  " This is console Vim.
  "if exists("+lines")
   " set lines=50
  "endif
  "if exists("+columns")
   " set columns=150
  "endif
"endif

" Use ~x on an English Windows version or ~n for French.
au GUIEnter * simalt ~x

" Unite work flow leader of SpaceVim. Default is `f`. Set to empty to disable
" this feature, or you can set to another char.
let g:spacevim_unite_leader = ""

"reset the default macro q key 
nunmap q


" where do you want to save sessions?
let g:session_dir = $HOME."/.vimsessions"
 
" Save sessions whenever vim closes
autocmd VimLeave * call SaveSession()
 
" Saves the session to session dir. Creates session dir if it doesn't
" yet exist. Sessions are named after servername paameter
function! SaveSession()
 
    " get the server (session) name
    let s = v:servername
 
    " create session dir if needed
    if !isdirectory(g:session_dir)
    	call mkdir(g:session_dir, "p")
    endif
 
    " save session using the server name
    execute "mksession! ".g:session_dir."/".s.".session.vim"
endfunc

" Load session when vim is opened
autocmd VimEnter * call OpenSession()
 
" Open a saved session if there were no file-names passed as arguments
" The session opened is based on servername (session name). If there
" is no session for this server, none will be opened
function! OpenSession()
 
    " check if file names were passed as arguments
    if argc() == 0
 
    	let sn = v:servername
    	let file = g:session_dir."/".sn.".session.vim"
 
        " if session file exists, load it
    	if filereadable(file)
            execute "source ".file
        endif
    endif
endfunc


"set syntax sync fromstart
syntax sync fromstart
set lazyredraw

"reset ctrl-c to esc
nnoremap <C-c> <ESC>
inoremap <C-c> <ESC>

"automatically change the current directory
"set autochdir

" use space as `<Leader>`
let mapleader = "\<space>"
let g:mapleader="\<space>"

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Fast saving
nmap <leader>w :w!<cr>

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
