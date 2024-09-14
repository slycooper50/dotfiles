set incsearch
syntax on
set ruler
set number
set tags=./tags;,tags;
set path+=/usr/local/include;
set foldmethod=syntax
set ignorecase
set nowrap
set bg=dark
set hlsearch
set termguicolors
autocmd VimEnter * hi Folded ctermbg=238 ctermfg=white
autocmd VimEnter * NERDTree

"VIM Plug

call plug#begin('~/.vim/plugged')

"Vim Airline
Plug 'vim-airline/vim-airline'

"Airline Themes
Plug 'vim-airline/vim-airline-themes'

"NERDTree
Plug 'preservim/nerdtree'

"GRUVBOX
Plug 'morhetz/gruvbox'

"Bbye for gracefully closing buffers but not windows
Plug 'moll/vim-bbye'

"indentLine vertical dashed lines
"Plug 'Yggdroot/indentLine'

"Color Schemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ghifarit53/tokyonight-vim'
Plug 'ghifarit53/daycula-vim'
Plug 'bluz71/vim-nightfly-colors'

"Fugitive
Plug 'tpope/vim-fugitive'

call plug#end()

"AIRLINE PROPERTIES
let g:airline_theme='powerlineish'
"let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#branch#enabled=1
let g:airline_symbols = {}
let g:airline_symbols.space = "\ua0"
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
"" let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = 'TABS'       " can put text here like TABS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = 'BUFFERS'    " can put text here like BUFFERS to denote tabs (I clear it so nothing is shown)
let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
let g:airline#extensions#tabline#show_buffers = 1     " show buffers in the tabline
let g:airline#extensions#tabline#tab_min_count = 1     " minimum of 1 tabs needed to display the tabline
let g:airline#extensions#tabline#show_splits = 1       " enables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
let g:airline#extensions#tabline#buffer_nr_show = 1   " show buffer number
"let g:airline#extensions#tabline#buffer_nr_format='%s'

"indentLine properties
"let g:indentLine_setColors = 0
"let g:indentLine_defaultGroup = 'SpecialKey'
"let g:indentLine_color_term = 239
"let g:indentLine_char = 'c'


"Command for using termdebug
function Debug(arg)
	packadd termdebug
	exe "Termdebug" a:arg
	exe "normal \<C-W>10\+"
	Source
	vertical res 160
	echo a:arg
endfunction
let g:termdebug_wide=160
command -nargs=1 Debug :call Debug(<f-args>)
command -nargs=0 DebugFlow :call Debug('opm-simulators/build/bin/flow')

""Set colorscheme
colorscheme gruvbox

""Maps
map <F2> :!grep -iIRn <cword> $SEARCH_DIRS --color=always \| less -R <cr><cr>
map <F3> :!grep -iIRn "" $SEARCH_DIRS --color=always \| less -R <Home><S-Right><S-Right><Right><Right>
map <F5> :call TermDebugSendCommand('step')<CR>
map <F6> :call TermDebugSendCommand('finish')<CR>
map <F8> :call TermDebugSendCommand('next')<CR>
map <F9> :call TermDebugSendCommand('continue')<CR>
map ,<SPACE> :call TermDebugSendCommand('bt')<CR>
map <C-PageUp> :call TermDebugSendCommand('sly-up')<CR>
map <C-PageDown> :call TermDebugSendCommand('sly-down')<CR>
map <C-L> :call TermDebugSendCommand('shell clear')<CR>
map <C-E> :call TermDebugSendCommand('p ')<CR>
map <C-\> :call TermDebugSendCommand('sly-vars')<CR>
map <C-N> :bn<CR>
map <C-P> :bp<CR>
map <C-C> :Bdelete<CR>
map <C-K> :!find \| grep --color=always<SPACE>
map <C-I> :execute 'set cc='.virtcol('.')<CR>

"cmdline editing using tcsh-style
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
