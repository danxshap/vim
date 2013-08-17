" this is my vimrc

" automatically reload vimrc when it's saved
" au BufWritePost .vimrc so ~/.vimrc

" BEGIN VUNDLE CONFIG
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (e.g. for updates)
Bundle 'gmarik/vundle'

" Vundle bundles
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'skammer/vim-css-color'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/taglist.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'ShowTrailingWhitespace'
Bundle 'DeleteTrailingWhitespace'
Bundle 'Rename2'
Bundle 'kwbdi.vim'
Bundle 'tpope/vim-markdown'
Bundle 'suan/vim-instant-markdown'
Bundle 'Lokaltog/vim-easymotion'

filetype plugin indent on     " required!
" END VUNDLE CONFIG

" disable active mode that freaks out when you try to save a file with syntax errors
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

" automatically open the error window when there are errors and close it when there are none
let g:syntastic_auto_loc_list=1

" Only reload the markdown in the browser on save / a while after leaving
" insert mode
let g:instant_markdown_slow = 1
filetype plugin on

" syntax check with ctrl+s
map <c-s> :SyntasticCheck<CR>
let g:syntastic_python_checkers = ['pyflakes']


" ignore syntastic errors temporarily
map \t :SyntasticToggleMode<CR> :SyntasticToggleMode<CR>

" disable YouCompleteMe default mapping for \d and make our shortcut for Gdiff
let g:ycm_key_detailed_diagnostics = ''
noremap \d :Gdiff<CR>

" disable gitgutter by default and map \f to toggle it
let g:gitgutter_enabled = 0
noremap \f :ToggleGitGutter<CR>

" shortcut for trailing whitespace
noremap \w :DeleteTrailingWhitespace<CR> :w<CR>

" toggle line wrapping
noremap \q :set invwrap<CR>

" shortcut for git status via fugitive
noremap \s :Gstatus<CR>
noremap \a :Gwrite<CR>

" Make it so :Ggrep automatically opens the quickfix window when it's done
autocmd QuickFixCmdPost *grep* call QuickFixFullWidth()

function! QuickFixFullWidth()
    botright cwindow
endfunction

" set t_Co=256
syntax on
set undofile
set number
set incsearch
set showcmd
set autoindent
set hlsearch
set ruler
set cpoptions+=$
set tabstop=4
set shiftwidth=4
set softtabstop=4
filetype indent on
set smarttab
set expandtab
set wildmode=longest,list,full
set wildmenu
set wildignore=*.pyc,.*
set virtualedit=all
set foldnestmax=10
set nofoldenable
set foldlevel=1
set hidden
colorscheme danielcolor
let NERDTreeIgnore = ['\.pyc$']
autocmd  BufRead,BufNewFile *.html setfiletype htmldjango
highlight Normal ctermbg=None

" cancel search highlighting
nnoremap <C-c> :nohlsearch<CR>

" automatically vimgrep for the latest search term in the *current buffer
" only*
nmap \g :vimgrep /<C-r>// %<CR>:botright copen<CR>

nmap \n :cn<CR>
nmap \p :cp<CR>


" YankRing shortcut
nmap \r :YRShow<CR>

" make up/down keys not move over wrapped lines - when you want to go down,
" always go directly down
nmap j gj
nmap k gk

" hide macvim toolbar
if has("gui_running")
    set guioptions=egmrt
endif

" in ctrlp, set working directory to closest to .git
let g:ctrlp_working_path_mode=2

" map some useful nerdtree commands
noremap <c-n> :NERDTreeToggle<CR>
noremap <c-l> :NERDTreeFind<CR>

" Markdown to HTML
nmap <leader>md :%!/usr/local/bin/Markdown.pl --html4tags

" Add shortcuts for moving up and down 10 lines at a time with capital J and capital K
nore J 10j
nore K 10k

" Since we re-mapped capital J, map Ctrl+J to the default J which is the join line operation
nore <C-J> J

" Taglist stuff
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Enable_Fold_Column=0
highlight MyTagListFileName guifg=#00d2ff ctermfg=blue
highlight MyTagListTitle guifg=#ff0086 gui=bold ctermfg=red
map ) :TlistToggle<CR>

" Quick-add debug statements by pressing ctrl+i
nnoremap <c-i> :call InsertDebugTrace()<CR>
function! InsertDebugTrace()
    if (&ft == 'python')
        normal! Oimport ipdb; ipdb.set_trace()
    elseif (&ft == 'javascript')
        normal! Odebugger;
    endif
    :w
endfunction

" To refresh syntax highlighting try scrolling around a little and then :syn sync fromstart

" type Sc after highlighting a block to add comment in django templates
" NOTE: 99 is the ascii code for "c"
let b:surround_99 = "{% comment %}\r{% endcomment %}"
