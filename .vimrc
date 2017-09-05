set nocompatible              " be iMproved
filetype off                  " required!

" not sure what this does


" means f5 can get us in and out of paste mode
set pastetoggle=<f5>

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required! 
" package manager
Plugin 'gmarik/vundle' 

" Turning off for now. Neomake is asynchronous so I use that instead
" syntax checker
"Plugin 'Syntastic'
"
Plugin 'neomake/neomake'

" shows what has been added, removed or modified in git
Plugin 'vim-gitgutter'

" sensible defaults for vim, like nocompatible on steroids
Plugin 'tpope/vim-sensible'

" you complete me omni completion
Plugin 'Valloric/YouCompleteMe'

" ctrl-p fuzzy finder
Plugin 'kien/ctrlp.vim'

" easy motion
Plugin 'Lokaltog/vim-easymotion'

" cmake integration
" Plugin 'jalcine/cmake.vim'

" gdb integration
" Plugin 'vim-scripts/gdbmgr'

" Nerdtree project explorer
Plugin 'austinwiltshire/nerdtree'

" Solarized for vim
Plugin 'altercation/vim-colors-solarized'

" Tag management
Plugin 'ludovicchabant/vim-gutentags'

" Project/directory local vimrc settings autoloaded
Plugin 'embear/vim-localvimrc'

call vundle#end()	

" neomake config, run on save
autocmd! BufWritePost * Neomake

" neomake - manual defaults for c++ linters so i can add include directories
let g:neomake_cpp_enabled_makers = ['gcc']
let g:neomake_cpp_gcc_maker = {
   \ 'exe': 'g++',
   \ 'args': ['-fsyntax-only',
            \ '-std=c++1z',
            \ '-Wall',
            \ '-Wextra',
            \ '-pedantic'],
\ }

" load local vimrc's automatically
let g:localvimrc_ask = 0

" ctrl p speedup
" use a cache for ctrlp
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" use ag instead of vim grep
if executable('ag')
	  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

syntax on
filetype plugin indent on
set hlsearch

" hide buffers instead of closing them
" allows opening new buffers without saving/undoing current
set hidden

"" Syntastic flags
"" let g:syntastic_cpp_compiler = 'clang++' " Switch to clang rather than gcc
"let g:syntastic_cpp_check_header = 1  " check .h and .hpp files
"let g:syntastic_cpp_config = '~/.syntastic_cpp_config'

"" uncomment this to run all checkers. so long as its commented we only run
"" them in order
"" let g:syntastic_aggregate_errors = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_id_checkers = 1

"" this removes errors from the result set in files we include. remove this
"" line if you're trying to debut why things aren't compiling right
"let g:syntastic_cpp_remove_include_errors = 1
"" boost for sifi projects
"" let g:syntastic_cpp_include_dirs = ["/Users/austinwiltshire/projects/deps/boost-1.55.0/include"]

if has("autocmd")
	autocmd FileType c,cpp set autoindent shiftwidth=4 softtabstop=4 tabstop=4 expandtab
        autocmd FileType python set autoindent shiftwidth=4 softtabstop=4 tabstop=4 expandtab
	autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
	autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

	" save on losing focus
	" autocmd FocusLost * :wa
endif

" highlight over line length
set cc=121 

" see history of at least 200 cmds
set history=200

" allow c-p and c-n chords to navigagte history of commands *with* filtering
" just like arrow keys
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" reset leader to comma
let mapleader=','

" line numbers
" turn on absolute line numbers
set nu

" toggle between absolute and relative with leader |
nnoremap <Leader>l :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" quick actions to move through the location list
nnoremap <Leader>N :lnext<CR>
nnoremap <Leader>P :lprev<CR>

" and the same for the quick fix list
noremap <Leader>n :cn<CR>
noremap <Leader>p :cp<CR>

" turn of highlight on return
nnoremap <CR> :nohlsearch<CR>

" ignore case by default
set ignorecase

" use smart case for searches - all lower case means ignore case, whereas
" mixing in any case means case sensitive search
set smartcase


" text mate like visibility of invisible characters like tabs and newlines
set list
set listchars=tab:▸\ ,eol:¬

" Invisible character colors 
highlight NonText guifg=#4a4a59 ctermfg=LightGrey
highlight SpecialKey guifg=#4a4a59 ctermfg=LightGrey

" larger undo functionality via a file
set undofile

" sane regexes
nnoremap / /\v
vnoremap / /\v

" tack g on the end of every replace by default
set gdefault

" training wheels, turns off arrow keys in insert mode so i rely on normal
" mode to navigate
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" move by screen line, not by file line
nnoremap j gj
nnoremap k gk

" solarize dark
syntax enable
set background=dark
colorscheme solarized

" text crosshari
set cursorline
set cursorcolumn

" youcomplete me
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" should jump between declaration and definition
" does not appear to work
" nnoremap <leader>jd :YcmCompleter GoTo<CR>

" ycm will read in tag files.
" must run ctags --fields=+l for the right format
" let g:ycm_collect_identifiers_from_tags_files = 1

" adds syntax keywords to ycm
let g:ycm_seed_identifiers_with_syntax = 1

" adds completion help to the preview window at the top
" let g:ycm_add_preview_to_completeopt = 1

" remove silly config check for ycm
let g:ycm_confirm_extra_conf = 0

" let g:ycm_max_diagnostics_to_display = 1000

" turn off diagnostics for now
let g:ycm_show_diagnostics_ui = 0

" ctrlp tags and current buffer for tags
let g:ctrlp_extensions = ['tag', 'buffertag']

"ctrl p, use buffer/tags/files mode
let g:ctrlp_cmd = 'CtrlPMixed'

" for easy motion, use smart case
let g:EasyMotion_smartcase = 1

" use upper case letters for targets
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'

" one key open for nerdree
noremap - :e.<CR>
map <C-n> :e.<CR>

" use split model
let NERDTreeHijackNetrw=1
let NERDTreeShowLineNumbers=1

" turn on column and line numbers in status bar
set ruler
let NERDTreeShowBookmarks=1

" backup settings, ensures temp files don't get stored in project directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//


