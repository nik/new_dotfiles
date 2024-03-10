set nocompatible              " be iMproved, required
filetype on                  " required

set t_Co=256
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath+=~/.vim/bundle/neobundle.vim/
call vundle#begin()
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'airblade/vim-gitgutter'
call neobundle#end()

NeoBundleCheck
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""""""""""""""""""""""""
" Vim Plugins
"""""""""""""""""""""""""

" appearance
Plugin 'morhetz/gruvbox'
Plugin 'hzchirs/vim-material'
Plugin 'noahfrederick/vim-hemisu'
Plugin 'dracula/vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'ayu-theme/ayu-vim'
Plugin 'nyoom-engineering/oxocarbon.nvim'

" editing
Plugin 'godlygeek/tabular'
Plugin 'kana/vim-textobj-user'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/matchit'
Plugin 'sheerun/vim-polyglot'
Plugin 'github/copilot.vim'

" navigation
Plugin 'ervandew/supertab'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

" languages
Plugin 'AndrewRadev/vim-eco'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'yaymukund/vim-rabl'
Plugin 'tpope/vim-endwise'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'

" frameworks
Plugin 'tpope/vim-rails'
Plugin 'othree/html5.vim'
Plugin 'elixir-lang/vim-elixir'

" misc
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'mhartington/nvim-typescript', {'build': './install.sh'}
Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/denite.nvim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
Plugin 'mattn/gist-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/webapi-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-ruby/vim-ruby'

Plugin 'ryanoasis/vim-devicons'

set encoding=UTF-8

" Plugins you want just for yourself go here
if filereadable(expand("~/.custom.vim-plugins"))
  source ~/.custom.vim-plugins
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""
" Basic features
"""""""""""""""""""""""""
" Display options
syntax on
set termguicolors
set nowrap
set nocursorline
set number
set list!                       " Display unprintable characters
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«

set bg=dark
let g:material_style='oceanic'
let g:airline_theme='papercolor'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:ale_fixers = {
      \'ruby': ['rubocop'],
      \}

let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_fix_on_save = 1
let g:ale_enabled = 1

let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

set t_ZH=^[[3m
set t_ZR=^[[23m

" Misc
set hidden                      " Don't abandon buffers moved to the background
set wildmenu                    " Enhanced completion hints in command line
set wildmode=list:longest,full  " Complete longest common match and show possible matches and wildmenu
set backspace=eol,start,indent  " Allow backspacing over indent, eol, & start
set complete=.,w,b,u,U,t,i,d    " Do lots of scanning on tab completion
set updatecount=100             " Write swap file to disk every 100 chars
set directory=~/.vim/swap       " Directory to use for the swap file
set diffopt=filler,iwhite       " In diff mode, ignore whitespace changes and align unchanged lines
set history=1000                " Remember 1000 commands
set scrolloff=3                 " Start scrolling 3 lines before the horizontal window border
set visualbell t_vb=            " Disable error bells
set shortmess+=A                " Always edit file, even when swap file is found
set directory=/tmp "sets the swap (.swp) file directory

" up/down on displayed lines, not real lines. More useful than painful.
noremap k gk
noremap j gj

" Formatting, indentation and tabbing
set autoindent smartindent
set smarttab                    " make <tab> and <backspace> smarter
set tabstop=2                   " tabstops of 2
set shiftwidth=2
set expandtab                   " tabs are turned into spaces
set shiftwidth=2
set textwidth=80
set formatoptions-=t formatoptions+=croql

" viminfo: remember certain things when we exit
" (http://vimdoc.sourceforge.net/htmldoc/usr_21.html)
"   %    : saves and restores the buffer list
"   '100 : marks will be remembered for up to 30 previously edited files
"   /100 : save 100 lines from search history
"   h    : disable hlsearch on start
"   "500 : save up to 500 lines for each register
"   :1000 : up to 1000 lines of command-line history will be remembered
"   n... : where to save the viminfo files
if !has('nvim')
  set viminfo+=n~/.vim/viminfo
endif
" set viminfo=%100,'100,/100,h,\"500,:1000,n~/.nviminfo

" ctags: recurse up to home to find tags.
set tags+=tags;$HOME

" Undo
set undolevels=10000
if has("persistent_undo")
  set undodir=~/.vim/undo       " Allow undoes to persist even after a file is closed
  set undofile
endif

" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

" to_html settings
let html_number_lines = 1
let html_ignore_folding = 1
let html_use_css = 1
let xml_use_xhtml = 1

" When opening a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \     exe "normal g'\"zz" |
    \ endif |


" After 4s of inactivity, check for external file modifications on next keyrpress
au CursorHold * checktime

"""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let mapleader=","
let localmapleader=","

nmap <Leader>s :%S/
vmap <Leader>s :S/

vnoremap . :normal .<CR>
vnoremap @ :normal! @

" Toggles
set pastetoggle=<F1>
" the nmap is just for quicker powerline feedback
nmap <silent> <F1>      :set invpaste<CR>
nmap          <F2>      :setlocal spell!<CR>
imap          <F2> <C-o>:setlocal spell!<CR>
nmap <silent> <F3>      :set invwrap<CR>
" TODO toggle numbers

map <Leader>/ :nohlsearch<cr>
map <Home> :tprev<CR>
map <End>  :tnext<CR>

nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" TODO Do also cnext and cprev as a fallback
map <PageDown> :lnext<CR>
map <PageUp>   :lprev<CR>

" Disable K for manpages - not used often and easy to accidentally hit
noremap K k

" Resize window splits
" TODO Fix mousewheel
nnoremap <Up>    3<C-w>-
nnoremap <Down>  3<C-w>+
nnoremap <Left>  3<C-w><
nnoremap <Right> 3<C-w>>

nnoremap _ :split<cr>
nnoremap \| :vsplit<cr>

map <Leader>w :set invwrap<cr>
map <Leader>p :set invpaste<cr>

vmap s :!sort<CR>
vmap u :!sort -u<CR>

" Write file when you forget to use sudo
cmap w!! w !sudo tee % >/dev/null

"""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""
nnoremap <S-u> :GundoToggle<CR>
let g:gundo_close_on_revert=1

" TODO Merge the NERDTreeFind with Toggle inteilligently.
nnoremap <C-g> :NERDTreeToggle<cr>
nnoremap <C-f> :NERDTreeFind<cr>

let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$',
                   \ '\.so$', '\.egg$', '^\.git$', '\.cmi', '\.cmo' ]
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1

map <silent> <Leader>gd :Gdiff<CR>
map <silent> <Leader>gb :Gblame<CR>
map <silent> <Leader>gg :Gbrowse<CR>

nnoremap <Leader>a :Ag

" Put a space around comment markers
let g:NERDSpaceDelims = 1

let g:quickfixsigns_classes=['qfl', 'vcsdiff', 'breakpoints']

set laststatus=2

" let g:ctrlp_map = '<Leader>.'
" let g:ctrlp_custom_ignore = '/\.\|\.o\|\.so'
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_regexp = 0
" let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
" map <Leader>, :CtrlPMRU<CR>

" set fzf to.respect .gitignore
let $FZF_DEFAULT_COMMAND='rg --files'
nnoremap <C-t> :Files<CR>

let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8} }

noremap \= :Tabularize /=<CR>
noremap \: :Tabularize /^[^:]*:\zs/l0l1<CR>
noremap \> :Tabularize /=><CR>
noremap \, :Tabularize /,\zs/l0l1<CR>
noremap \{ :Tabularize /{<CR>
noremap \\| :Tabularize /\|<CR>
noremap \& :Tabularize /\(&\\|\\\\\)<CR>

nmap <leader>gi :Gist
let g:gist_post_private = 1
let g:gist_open_browser_after_post = 1

let g:python3_host_prog = '/usr/bin/python3'

"""""""""""""""""""""""""
" Cscope
"""""""""""""""""""""""""
if has("cscope")
  " Use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
  set cscopetag

  " Check cscope for definition of a symbol before checking ctags. Set to 1 if
  " you want the reverse search order.
  set csto=0

  " Add any cscope database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  endif

  " Show msg when any other cscope db is added
  set cscopeverbose
end

" Source custom vim from ~/.custom.vim
if filereadable(expand("~/.custom.vim"))
  source ~/.custom.vim
endif

" RABL syntax highlighting
au BufRead,BufNewFile *.rabl setf ruby

"Matchit macro for ruby block text objects
runtime macros/matchit.vim

" EXPERIMENTAL

hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235

set statusline=%=&P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\
set laststatus=2
set noshowmode

" colo less
let ayucolor="mirage"   " for dark version of theme
colorscheme PaperColor
" colo 256-grayvim
set background=light
