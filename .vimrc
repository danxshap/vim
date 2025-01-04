" ============ Vundle config:  ============
" Instructions @ https://github.com/VundleVim/Vundle.vim#quick-start

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins managed by Vundle
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'DeleteTrailingWhitespace'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'ap/vim-css-color'
Plugin 'vim-scripts/taglist.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'

" Allows you to type \bd to delete current buffer without closing window
Plugin 'kwbdi.vim'

Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ============ /Vundle config ============

" ============ MacVim features ============
" Remove left scrollbar
set guioptions=r
" ============ /MacVim features ============

" ============ Misc plugin settings ============
" Automatically delete trailing whitespace when buffer is written (file saved)
let g:DeleteTrailingWhitespace_Action = 'delete'
let g:DeleteTrailingWhitespace = 1

" Shortcut for 'git status' and 'git add' via fugitive
noremap \s :Git<CR>
noremap \a :Gwrite<CR>

" Disable YouCompleteMe default mapping for \d and make our shortcut for Gdiff
let g:ycm_key_detailed_diagnostics = ''
noremap \d :Gdiff<CR>

" Make it so :Ggrep automatically opens the quickfix window when it's done
autocmd QuickFixCmdPost *grep* call QuickFixFullWidth()

function! QuickFixFullWidth()
    botright cwindow
endfunction

" For ctrlp, set working directory to closest to .git
let g:ctrlp_working_path_mode=2

" Nerdtree
let NERDTreeIgnore = ['\.pyc$']
let NERDTreeShowHidden=1
noremap <c-n> :NERDTreeToggle<CR>
noremap <c-l> :NERDTreeFind<CR>

" Taglist stuff
" brew install ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Enable_Fold_Column=0
highlight MyTagListFileName guifg=#00d2ff ctermfg=blue
highlight MyTagListTitle guifg=#ff0086 gui=bold ctermfg=red
map ) :TlistToggle<CR>

" A default vim setting, but needed for Git gutter
set updatetime=100
" ============ /Misc plugin settings ============

" ============ Syntastic settings ============
" Disable active mode that freaks out when you try to save a file with syntax errors
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

" Automatically open the error window when there are errors and close it when there are none
let g:syntastic_auto_loc_list=1

" Press ctrl+s to run syntax check
map <c-s> :SyntasticCheck<CR>
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_debug_file = "~/syntastic.log"

" Press \t to ignore syntastic errors temporarily
map \t :SyntasticToggleMode<CR> :SyntasticToggleMode<CR>
" ============ /Syntastic settings ============

" ============ Default vim features ============
colorscheme danielcolor
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
set wildignore=*.pyc,.*,/static/*,*/node_modules/*
set virtualedit=all
set foldnestmax=10
set nofoldenable
set foldlevel=1
set hidden

" Cancel search highlighting with ctrl+c
nnoremap <C-c> :nohlsearch<CR>

" Add shortcuts for moving up and down 10 lines at a time with capital J and capital K
nore J 10j
nore K 10k

" Since we re-mapped capital J above, map Ctrl+j to the default J which is the join line operation
nore <C-J> J

" Toggle line wrapping by typing \q
noremap \q :set invwrap<CR>

" Automatically vimgrep for the latest search term in the *current buffer only*
nmap \g :vimgrep /<C-r>// %<CR>:botright copen<CR>

" Shortcut for writing current buffer
noremap \w :w<CR>

" Press ctrl+r while selecting text in visual mode to replace that text with something else
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" Quick-add debug statements by pressing ctrl+i
nnoremap <c-i> :call InsertDebugTrace()<CR>
function! InsertDebugTrace()
    if (&ft == 'python')
        normal! Oimport ipdb; ipdb.set_trace(context=30)
    elseif (&ft == 'javascript')
        normal! Odebugger;
    endif
    :w
endfunction
" ============ /Default vim features ============


function! DiffSelectionWithClipboard() range
  " 1) Yank the visually selected text into the unnamed register
  silent! normal! gv"xy

  " 2) Open a new tab (starts with a single window)
  tabnew

  " 3) Split the tab vertically so we have a left and a right window
  vsplit

  " 4) Move focus to the LEFT window
  wincmd h
  " Create a scratch buffer for your selected text
  enew
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal noswapfile
  file SelectedTextDiff
  " Paste the visually selected text
  normal! "xp
  diffthis

  " 5) Move focus to the RIGHT window
  wincmd l
  " Create another scratch buffer for your clipboard text
  enew
  setlocal buftype=nofile
  setlocal bufhidden=wipe
  setlocal noswapfile
  file ClipboardDiff
  " Paste from the system clipboard (the '+' register on macOS/unix)
  normal! "+p
  diffthis
endfunction

" Visually select text and then press ,d to see the diff moving from that
" selected text to whatever is in the clipboard
xnoremap \D :<C-u>call DiffSelectionWithClipboard()<CR><CR>

" Shortcut for closing the current tab, such as after running the diff command
" above which opens the diff in a new tab
noremap \f :tabc<CR>

" ============ Other notes ============
" To refresh syntax highlighting try scrolling around a little and then :syn sync fromstart

" ============ /Other notes ============
"

set pythonthreedll=/usr/local/bin/python3
