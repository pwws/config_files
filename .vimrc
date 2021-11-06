" **** For Vundle - plugin manager ***
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'git://github.com/justinmk/vim-syntax-extra.git'
"Plugin 'rip-rip/clang_complete'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" snippets packet
Plugin 'honza/vim-snippets'

Plugin 'git://github.com/valloric/youcompleteme.git'
Plugin 'git://github.com/scrooloose/nerdtree'
Plugin 'git://github.com/vim-syntastic/syntastic'
"Plugin 'git://github.com/jistr/vim-nerdtree-tabs' " Just one NERDTree for all tab
Plugin 'git://github.com/majutsushi/tagbar'
"Plugin 'octave'
Plugin 'git://github.com/ctrlpvim/ctrlp.vim.git'
"airline did not work
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'

"Plugin 'flazz/vim-colorschemes'

"Bundle 'marijnh/tern_for_vim'


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
" **** /For Vundle - plugin manager ****
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set number  "show line numbers
set showcmd "show last entered command
set wildmenu "visual autocomplete for command menu
set showmatch "highlight matching {[()]}

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"change window part
map ` <C-w>w 
"map <F5> <C-w>w 
"map <F6> :tabprevious<CR>
"map <F7> :tabpnext<CR>
map \ :tabnext<CR>
map <tab> :tabprevious<CR>
map <F12> :tabclose<CR>

set laststatus=2 "show filepath at the bottom of the window

command WQ wq
command Wq wq
command W w
command Q q
command Qa qa
command QA qa

syntax on

set backspace=2 "make backspace work like most other apps
set mouse=a
"Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_c_checkers = ['gcc']
let g:syntastic_c_compiler_options = "-std=c89 -c"
"let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libstdc++'

let g:syntastic_c_remove_include_errors = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_quiet_messages = { 'regex' : 'linux' }
" checker is disabled by default. To check a file: :SyntasticCheck
" to close error window: :SyntasticReset
" help: :help syntastic
let g:syntastic_mode_map = { 'mode': 'passive' }
"go to next/previous error
map = :lnext<CR>
map - :lprevious<CR>

"turn conflicting YCM checker off 
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0
"YCM did not parse GL* headers without below line
let g:ycm_semantic_triggers =  { 'cpp,objcpp' : ['->', '.', '::', 're!gl'] }

nnoremap <F1> :YcmCompleter GetType<CR>
nnoremap <F2> :YcmCompleter GoToDefinition<CR>
nnoremap <F3> :YcmCompleter GoToDeclaration<CR>
nnoremap <C-s-tab> :YcmCompleter GoToInclude<CR>

"map ctlp to Ctrl + p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"open the selected file in a new tab by default
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

"tip: use 't' in NERDTree to open the file in a new tab silently
"autocmd VimEnter * NERDTree "open NERDTree on startup
"autocmd VimEnter * wincmd p "move the cursor to the editor window on startup
nmap <silent> T :NERDTreeToggle<CR>

"let g:nerdtree_tabs_open_on_console_startup = 1

"status line settings
set statusline=%<%f\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P

nmap <F8> :TagbarToggle<CR>
set colorcolumn=80
