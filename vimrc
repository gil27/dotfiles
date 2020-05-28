"==============================================================================
"				                        Gil's vimrc file
"==============================================================================

"
" lembrete:
" emmet: <c-y>, " legal usar com seleção
" sparkup <c-E> " exemplo: div#gil -> <div id='gil'></div>

if filereadable(expand("~/.vimrc.plug"))
  source ~/.vimrc.plug
endif

"
" Theme
"

if (has("termguicolors"))
  set termguicolors
endif

let ayucolor="dark"
colorscheme agila

hi Comment guifg=#ABCDEF
hi TabLine gui=NONE guibg=#3e4452 guifg=#abb2bf cterm=NONE term=NONE ctermfg=black ctermbg=white
hi CursorLineNr guifg=white
hi LineNr  guifg=grey

"
" Configurations
"

" Moving

set clipboard+=unnamed " copy & paste de qualquer lugar
set mouse=a "mouse ativado
set switchbuf+=newtab

let mapleader = "\<Space>"

" Mappings

map <leader>w :w<cr>
map <leader>q :q<cr>

imap jk <esc>
imap kj <esc>
imap <C-s> <esc>:w<cr>

nmap sop :tabnew $MYVIMRC<cr>                       " abre o .vimrc de qualquer lugar
nmap <C-p> :Files<Cr>                               " abre o FZF
" nmap j gj			                                      " navegação sem saltar linha grande
" nmap k gk                                           " navegação sem saltar linha grande
nmap ,cc :tabclose<CR>                              " gerenica de tabs
nmap ,n :tabnew<CR>                                 " gerenica de tabs
nmap ,o :tabo<CR>                                   " gerenica de tabs
nmap ,m :tabprev<CR>                                " gerenica de tabs
nmap ,. :tabnext<CR>                                " gerenica de tabs
nmap <F5> :checktime<CR>	                          " atualiza os arquivos que foram alterados fora do vim
nmap <silent> ,<Space> :nohlsearch<Bar>:echo<CR>    " Press Space to turn off highlighting and clear message already displayed
nmap <leader>o o<esc>                               " Adiciona linha em branco
nmap <leader>O O<esc>                               " Adiciona linha em branco


:nnoremap <leader>rap  :RAddParameter<cr>           " Add Parameter
:nnoremap <leader>rip  :RInlineTempi<cr>            " Inline Temp
:nnoremap <leader>rcpc :RConvertPostConditional<cr> " Convert Post Conditional
:nnoremap <leader>rec  :RExtractConstant<cr>        " Extract Constant          (visual selection)
:nnoremap <leader>rel  :RExtractLet<cr>             " Extract to Let (Rspec)
:nnoremap <leader>relv :RExtractLocalVariable<cr>   " Extract Local Variable    (visual selection)
:nnoremap <leader>rrlv :RRenameLocalVariable<cr>    " Rename Local Variable     (visual selection/variable under the cursor, *REQUIRES matchit.vim*)
:nnoremap <leader>rriv :RRenameInstanceVariable<cr> " Rename Instance Variable  (visual selection, *REQUIRES matchit.vim*)
:nnoremap <leader>rem :RExtractMethod<cr>           " Extract Method            (visual selection, *REQUIRES matchit.vim*)
vnoremap <Space> zf
"
" Settings
"

set title                                       " Set the window’s title, reflecting the file currently being edited
set rtp+=/usr/local/opt/fzf
set autoread                                    " Loads from disk
set nocompatible                                " Set compatibility to Vim only.
set modelines=0                                 " Turn off modelines - variables
set wrap                                        " Automatically wrap text that extends beyond the screen length.
set formatoptions=tcqrn1
set noshiftround
set scrolloff=5                                 " Display 5 lines above/below the cursor when scrolling with a mouse.
set backspace=indent,eol,start                  " Fixes common backspace problems
set ttyfast                                     " Speed up scrolling in Vim
set laststatus=2                                " Status bar
set showmode                                    " Display options
set showcmd                                     " Display options
set showmatch                                   " highlight matching [{()}]
set cursorline                                  " highlight current line
set showcmd                                     " show command in bottom bar
set history=50                                  " keep 50 lines of command line history
set matchpairs+=<:>                             " Highlight matching pairs of brackets. Use the '%' character to jump between them.
set list                                        " Display different types of white spaces.
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.  " Display different types of white spaces
set relativenumber  		                        "show numbers
set number
set list
set listchars=tab:>-
set ignorecase                                  " Include matching uppercase words with lowercase search term
set smartcase                                   " Include only uppercase words with uppercase search term
set incsearch                                   " highlight search terms
set hlsearch                                    " show search matches as you type
set laststatus=2
set guioptions-=T                               " Removes top toolbar
set guioptions-=r                               " Removes right hand scroll bar
set go-=L                                       " Removes left hand scroll bar
set cpoptions+=$                                " puts a $ marker for the end of words/lines in cw/c$ commands
set shiftwidth=2                                " Indentation settings
set softtabstop=2                               " Indentation settings
set autoindent                                  " Indentation settings
set expandtab
set tabstop=2
set foldmethod=indent                           " Folding settings
set foldnestmax=3 		                          " Set deepest folding to 3 levels
set nofoldenable "                              " Don't fold by default
set wildmode=longest,list 	                    " Activate TAB auto-complete for file paths
set wildmenu 			                              " Make tab completion for files/buffers act like bash
set splitbelow
set splitright
set encoding=utf-8
set fileencoding=utf-8
set noswapfile
set linebreak 			                            " Break lines at word (requires Wrap lines)
set showbreak=+++ 		                          " Wrap-broken line prefix
set visualbell  		                            " Use visual bell (no beeping)
set smartindent 		                            " Enable smart-indent
set smarttab  			                            " Enable smart-tabs
set undolevels=1000 		                        " Number of undo levels
set viminfo='100,<9999,s100 	                  " Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}  " Set status line display

"
" Let's
"
let g:indentLine_char = '[]'
let g:indentLine_first_char = '[]'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

"
" - Commands
"
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly

highlight ExtraWhitespace ctermbg=196 guibg=#FF1100 ctermfg=white guifg=white
match ExtraWhitespace /\s\+$/
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave *.* mkview " Automatically save and load folds
autocmd BufWinEnter *.* silent loadview " Automatically save and load folds

au BufWritePre * :%s/\s\+$//e
au BufRead,BufNewFile *.md setlocal textwidth=80

"
" PLUGINS
"

"
" NERDTree
"
let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
"let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 40
nmap <C-l> :NERDTreeToggle<cr>
nmap <C-k> :NERDTreeFind<cr>
let g:NERDTreeWinSize = 20
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p


"
" Vim Ag
"

set runtimepath^=~/.vim/plugged/ag

let g:ag_working_path_mode="r"
" nmap <Bslash> :tabnew<CR>:Ag<Space>
" nmap <Bslash> :Ag<Space>


"
" Vim tabs
"
for i in [1, 2, 3, 4, 5, 6, 7]
  execute 'nnoremap ,'.i.' '.i.'gt'
endfor

"
" Vim FZF
"

let g:fzf_preview_window = 'right:60%'  " Preview window to fzf
let g:fzf_buffers_jump = 1              " [Buffers] Jump to the existing window if possible
nmap <Bslash> :Rg<Space>
