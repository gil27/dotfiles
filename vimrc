" Call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
  source ~/.vimrc.plug
endif
colorscheme onedark
set nocompatible " Set compatibility to Vim only.
set modelines=0 " Turn off modelines
set wrap " Automatically wrap text that extends beyond the screen length.

set formatoptions=tcqrn1
set noshiftround
set scrolloff=5 " Display 5 lines above/below the cursor when scrolling with a mouse.
set backspace=indent,eol,start " Fixes common backspace problems
set ttyfast " Speed up scrolling in Vim

set laststatus=2 " Status bar

set showmode " Display options
set showcmd " Display options

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"


" FZF
" fzf
"
set rtp+=/usr/local/opt/fzf

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gcc to comment
" gc to comment
" gb

set laststatus=2

set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
set cpoptions+=$ "        puts a $ marker for the end of words/lines in cw/c$ commands


" Indentation settings
set shiftwidth=2
set softtabstop=2
set autoindent
set expandtab
set tabstop=2

set foldmethod=indent " Folding settings
set foldnestmax=3 "                Set deepest folding to 3 levels
set nofoldenable "               " Don't fold by default

set wildmode=longest,list " Activate TAB auto-complete for file paths
set wildmenu "                        Make tab completion for files/buffers act like bash
set splitbelow
set splitright
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set noswapfile

set linebreak " Break lines at word (requires Wrap lines)
set showbreak=+++ " Wrap-broken line prefix
set visualbell  " Use visual bell (no beeping)
set smartindent " Enable smart-indent
set smarttab  " Enable smart-tabs
set undolevels=1000 " Number of undo levels


" atualiza os arquivos que foram alterados fora do vim
nnoremap <F5> :checktime<CR>

au BufRead,BufNewFile *.md setlocal textwidth=80

set showmatch "           highlight matching [{()}]
set cursorline "           highlight current line
set showcmd "             show command in bottom bar
set history=50 "       keep 50 lines of command line history



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:nnoremap rap  :RAddParameter<cr>
:nnoremap rcpc :RConvertPostConditional<cr>
:nnoremap rel  :RExtractLet<cr>
:vnoremap rec  :RExtractConstant<cr>
:vnoremap relv :RExtractLocalVariable<cr>
:nnoremap rit  :RInlineTemp<cr>
:vnoremap rrlv :RRenameLocalVariable<cr>
:vnoremap rriv :RRenameInstanceVariable<cr>
:vnoremap rem  :RExtractMethod<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
"let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 40
nmap <C-l> :NERDTreeToggle<cr>
nmap <C-k> :NERDTreeFind<cr>
let g:NERDTreeWinSize = 20

map <leader>p :NERDTreeToggle<cr>

" Open NERDTree by default
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight ExtraWhitespace ctermbg=196 guibg=#FF1100 ctermfg=white guifg=white
match ExtraWhitespace /\s\+$/
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

map <leader>w :w<cr>
map <leader>q :q<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove trailing whitespace
au BufWritePre * :%s/\s\+$//e


set clipboard+=unnamed
set mouse=a
set switchbuf+=newtab



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Ag
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set runtimepath^=~/.vim/bundle/ag
let g:ag_working_path_mode="r"
" nmap <Bslash> :tabnew<CR>:Ag<Space>
nmap <Bslash> :Ag<Space>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim tab navigation
for i in [1, 2, 3, 4, 5, 6, 7]
  execute 'nnoremap ,'.i.' '.i.'gt'
endfor

" tab managements
nmap ,cc :tabclose<CR>
nmap ,n :tabnew<CR>
nmap ,o :tabo<CR>
nmap ,qq :qa<CR>
nmap ,m :tabprev<CR>
nmap ,. :tabnext<CR>


" ################
" search highlight
" ################

" highlight search terms
set hlsearch

" show search matches as you type
set incsearch

" Press Space to turn off highlighting and clear any message already displayed
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

nnoremap <C-p> :Files<Cr>


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
