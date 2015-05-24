set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim' " required. Makes Vundle manage Vundle.

" General plugins
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'

" Plugins for Ruby
Bundle 'vim-ruby/vim-ruby'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-endwise'

" ll of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
" 
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" 
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Colors
" colorscheme Tomorrow-Night-Bright
colorscheme jellybeans
syntax enable

" Basic Configurations
set tabstop=4
set softtabstop=4
set expandtab
set number
set showcmd
set cursorline
set showmatch
set lazyredraw
set wildmenu
set shell=zsh
set clipboard=unnamed

" Searching
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" Leader
let mapleader=","

" Autocompletion
" set complete=.,b,]
" set wildmode=longest,list:longest
" imap <Tab> <C-p>

" A remap to Ag.vim
nnoremap <leader>a :Ag<space>

" Configuration for ctrlp.vim
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Autogroups for some type of files.
augroup configgroup
            autocmd!
            autocmd VimEnter * highlight clear SignColumn
            autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                                    \:call <SID>StripTrailingWhitespaces()
            autocmd FileType java setlocal noexpandtab
            autocmd FileType java setlocal list
            autocmd FileType java setlocal listchars=tab:+\ ,eol:-
            autocmd FileType java setlocal formatprg=par\ -w80\ -T4
            autocmd FileType php setlocal expandtab
            autocmd FileType php setlocal list
            autocmd FileType php setlocal listchars=tab:+\ ,eol:-
            autocmd FileType php setlocal formatprg=par\ -w80\ -T4
            autocmd FileType ruby setlocal tabstop=2
            autocmd FileType ruby setlocal shiftwidth=2
            autocmd FileType ruby setlocal softtabstop=2
            autocmd FileType ruby setlocal commentstring=#\ %s
            autocmd FileType ruby compiler ruby
            autocmd FileType ruby set omnifunc=rubycomplete#Complete
            autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
            autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
            autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
            autocmd FileType python setlocal commentstring=#\ %s
            autocmd BufEnter *.cls setlocal filetype=java
            autocmd BufEnter *.zsh-theme setlocal filetype=zsh
            autocmd BufEnter Makefile setlocal noexpandtab
            autocmd BufEnter *.sh setlocal tabstop=2
            autocmd BufEnter *.sh setlocal shiftwidth=2
            autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Tmux + Vim navigating.
" http://www.codeography.com/2013/06/19/navigating-vim-and-tmux-splits
if exists('$TMUX')
        function! TmuxOrSplitSwitch(wincmd, tmuxdir)
                let previous_winnr = winnr()
                silent! execute "wincmd " . a:wincmd
                if previous_winnr == winnr()
                        call system("tmux select-pane -" . a:tmuxdir)
                        redraw!
                endif
        endfunction

        let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
        let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
        let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

        nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
        nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
        nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
        nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
        map <C-h> <C-w>h
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l
endif
