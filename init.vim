" " neovim settings
" "   - ~/.config/nvim/init.vim
" "
" " Plug setup
" " curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
" "   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" " start nvim -> :PlugInstall
" "
" " For vim-markdown-composer
" "   go to ~/.local/share/nvim/plugged/vim-markdown-composer
" "       cargo build --release --no-default-features --features json-rpc
" "
call plug#begin('~/.local/share/nvim/plugged')
" " ----------- extra building required
"Plug 'euclio/vim-markdown-composer'
Plug 'Shougo/echodoc.vim'
" "
" " ----------- linting
Plug 'dense-analysis/ale'
" "
" " ----------- misc util
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'kshenoy/vim-signature'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'dominikduda/vim_current_word'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'akinsho/toggleterm.nvim'
"" Plug 'jremmen/vim-ripgrep' " use ack.vim instead with ripgrep
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdTree'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jszakmeister/vim-togglecursor'
Plug 'alvan/vim-closetag'
Plug 'sjl/gundo.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
"" Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-buftabline'
Plug 'jalvesaq/vimcmdline'
Plug 'djoshea/vim-autoread'
 "
 " ----------- git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'christoomey/vim-conflicted'
Plug 'airblade/vim-gitgutter'
" "
" " ----------- Langs
" CoC setup:
"   - install lts node
"   - install rust analyzer: https://github.com/rust-analyzer/rust-analyzer/releases
"   - set CocConfig -> {"rust-analyzer.server.path": path-to-rust-analyzer}
"   - CocInstall coc-rust-analyzer
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kovisoft/slimv'
Plug 'rust-lang/rust.vim'
Plug 'aklt/plantuml-syntax'
Plug 'cespare/vim-toml'
Plug 'hdima/python-syntax'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'derekwyatt/vim-scala'
Plug 'zah/nim.vim'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/groovy.vim'
Plug 'jparise/vim-graphql'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
call plug#end()


"" -- Python Envs
" neovim envs: create these and add the paths below to .config/nvim/init.vim
" let g:python_host_prog = '/Users/james/bin/envs/nvim2/venv/bin/python'
" let g:python3_host_prog = '/Users/james/bin/envs/nvim/venv/bin/python'
" let g:python_host_prog = '/home/james/bin/envs/nvim2/venv/bin/python'
" let g:python3_host_prog = '/home/james/bin/envs/nvim/venv/bin/python'


" Set <Leader>
let mapleader=","

autocmd FileType plantuml setlocal makeprg=plantuml\ -tpng\ %\ &&\ open\ $(dirname\ %)/$(basename\ %\ .uml).png

" lisp and slimv configs
let g:slimv_leader = '\'
let g:paredit_mode=0
let g:slimv_repl_split = 4
let g:lisp_rainbow=1
" http://vimdoc.sourceforge.net/htmldoc/change.html#fo-table
autocmd FileType lisp setlocal lisp syntax=lisp ls=2 bs=2 et sw=2 sts=2 ts=8 tw=80
autocmd FileType lisp setlocal iskeyword+=+,-,\*,/,%,<,=,>,:,$,?,!,@-@,94
autocmd FileType lisp setlocal comments^=:;;;,:;;,sr:#\|,mb:\|,ex:\|#
autocmd FileType lisp setlocal formatoptions-=t
autocmd FileType lisp setlocal formatoptions+=crol
set wildignore+=*.fasl
let NERDTreeIgnore = ['\.fasl$']


" current word highlighting
let g:vim_current_word#enabled = 1
hi CurrentWord ctermbg=53
hi CurrentWordTwins ctermbg=241


" code of completion shortcuts
nmap <silent> gj <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" coc, change fg text color
hi FgWarningHintFloatBgCocFloating ctermfg=brown
hi FgCocHintFloatBgCocFloating ctermfg=white
hi FgCocErrorFloatBgCocFloating ctermfg=cyan


"" ---- Regular settings -----
""
filetype plugin indent on
syntax on
set nocp
set t_Co=256         " Set colors...
set background=dark  " ... with dark background
set tabstop=4        " Make all tabs 4 spaces and make 4 spaces feel like tabs
set shiftwidth=4
set softtabstop=4
set expandtab
set spell spelllang=en_us   " Turn on spellcheck
set cursorline    " Enable cursor line highlighting
set ruler         " Shows percentage through file and cursor position
set showcmd       " Shows uncompleted vim commands next to the ruler
set incsearch     " Shows matches to searches before pattern is complete
set ignorecase    " Ignore case in searches
set smartcase     " ... unless search contains uppercase
set showmatch     " Show the matching thing for parens and braces (when closing is typed, cursor flashes over to the opening.)
set modeline      " Make vim look for a modeline (command in first line comment) when it loads a file up.
set nohls         " No highlighting for searches
set noerrorbells  " Quiet!
set visualbell    " Less obnoxious
set wildmenu      " Better command-line completion
set cmdheight=2   " Make command window larger to see last command after changing to insert mode
set showtabline=2 " Always show top-of-page tabline
"set smartindent   " Smart indent messes up indented lines starting with '#', see below...
set cindent        " Make vim format code indention correctly
set cinkeys-=0#
set indentkeys-=0#
set autoindent
set number          " Show line numbers
set relativenumber  " ... relative to cursor
set splitbelow   " More logical window splits
set splitright
set pumheight=10    " Completion window max size
set backspace=indent,eol,start  "fix backspace in insert mode
set hidden

" when opening a file, don't fold the top level
set foldlevelstart=20

" make sure aliases are loaded for shell commands
" -- to pastebin-copy, visually select, :'<,'>:w !pc
" -- to pastebin-paste, :r ! pp <code>
let $BASH_ENV = "~/.settings/.bash_aliases"

set noswapfile
set nobackup

" mouse support off
"set mouse=
" mouse support on
set mouse=a

" Setting list makes you see the list chars (lcs) This is good for makefiles and Python code, but little else
set lcs=tab:»*
set lcs+=trail:*
set listchars+=precedes:<,extends:>

set colorcolumn=121
hi ColorColumn ctermbg=lightgrey

" When returning to a file, return to the line you were on at exit
autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

if has('persistent_undo')
    set undofile
    set undodir=~/.config/vim/tmp/undo//
endif

" ToggleTerm configuration
lua << EOF
require("toggleterm").setup{
  -- https://github.com/akinsho/toggleterm.nvim#setup
  size = function(term)
    return vim.o.columns * 0.4
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'single',
    winblend = 0,  --transparency
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

local Terminal  = require('toggleterm.terminal').Terminal
-- create a default "number 1" terminal
local term = Terminal:new({
  count = 1,
  start_in_insert = true,
})
function _term_toggle()
  term:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua _term_toggle()<CR>", {noremap = true, silent = true})

-- create a "number 2" terminal to launch cargo watch
local cargorun = Terminal:new({
  count = 2,
  cmd = "cargo watch -x run",
  start_in_insert = false,
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
})
function _cargorun_toggle()
  cargorun:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>cr", "<cmd>lua _cargorun_toggle()<CR>", {noremap = true, silent = true})
EOF

" If the toggle-cursor plugin doesn't work
" Change cursor to | in insert mode and block in normal mode
"au InsertEnter * silent execute "!echo -en \<esc>[5 q"
"au InsertLeave * silent execute "!echo -en \<esc>[2 q"
" Or
"let &t_SI = "\<Esc>[6 q"
"let &t_SR = "\<Esc>[4 q"
"let &t_EI = "\<Esc>[2 q"


"" ------ Colors --------
""
" Turn off spell-error highlighting, change to underline
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare
hi clear SpellBad
hi SpellBad cterm=underline

" Turn off gutter highlight (for marks)
"hi clear SignColumn

" Set gutter background black
hi SignColumn ctermbg=0

" Color linenumber column text and background colors
" green background, black text
"hi LineNr ctermfg=black ctermbg=35
" black background, white text
hi LineNr ctermfg=255 ctermbg=0

" Set cursor line highlight color
hi CursorLine cterm=NONE ctermbg=24 guibg=darkred

" Make strings green instead of purple
hi String ctermfg=42

" make comments grey
hi Comment ctermfg=246

" Set tab line background black
hi TabLineFill cterm=bold ctermbg=0

" Set function items color so highlighting can modify the fg color
hi Function cterm=NONE ctermfg=87

" Set search highlight colors
hi Search ctermfg=0 ctermbg=8


"" ----- Bindings -------
""
" Decrease mapping timeout and map an esc shortcut
set timeoutlen=500
imap qq <ESC>

" remap 'recording' so it stops popping up
nnoremap q <Nop>
nnoremap <Leader>r q

" Map ctrl+J/K/L/H to change between split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap split window resizing since ctrl+ & ctrl- change system font size
nnoremap <Leader>w+ <C-W>+
nnoremap <Leader>w- <C-W>-


" FZF!
nnoremap <leader>e :Files<CR>
nnoremap <leader>E :Files<space>
nnoremap f/ :FindHere<CR>
nnoremap <leader>f :Find<CR>
nnoremap <leader>F :Find<space>
vnoremap <leader>f y:Find <C-R>"<CR>
command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" --glob "!.git/objects" '.shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* FindHere call fzf#vim#grep( 'rg --glob '.shellescape(@%).' --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" --glob "!.git/objects" '.shellescape(<q-args>), 1, <bang>0)

" Make Ack.vim use ripgrep!
let g:ackprg = 'rg --vimgrep'
nnoremap <leader>rg :Ack<space>
vnoremap <leader>rg y:Ack <C-R>"<CR>

" Close quickfix and preview windows
nnoremap <leader>cq :cclose<CR>
nnoremap <leader>pq :pclose<CR>

" Map // to search current file for visually selected text
vnoremap // y/<C-R>"<CR>

" Map f/ to ack for visually selected text
vnoremap f/ y:Ack <C-R>"<CR>

" Map d/ to ack for function definition (python)
vnoremap d/ y:Ack "def <C-R>""<CR>

" Map c/ to ack for class definition (python)
vnoremap c/ y:Ack "class <C-R>""<CR>

" NERDTree sidebar toggle (Requires NERDTree plugin)
map <Leader>l :NERDTreeToggle<CR>

" Paste Mode On/Off
set pastetoggle=<Leader>P
map <leader>y "+y
map <leader>p "+p

"" copy/paste for WSL https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
"" https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
"" https://github.com/neovim/neovim/issues/583
"func! ClipboardYank()
"    call system('win32yank.exe -i', @@)
"endfunc
"
"func! ClipboardPaste()
"    let @@ = system('win32yank.exe -o')
"endfunc
"map <leader>y y:call ClipboardYank()<cr>
"map <leader>p :call ClipboardPaste()<cr>p


" Toggle line wrap
nnoremap <leader>[ :set wrap!<CR>

" Act like D and C
nnoremap Y y$

" Moving down searches will center the on the current line
nnoremap n nzzzv
nnoremap N Nzzzv

" UPaste visual select mapping
"vnoremap <C-t> :<C-U>UPaste<CR>

"" ----- Plugin settings ------
" vim easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" undo alignment in visual selection
vnoremap <leader>ga :s/\(\w\S*\s\)\s\+/\1/g<CR>

" Airline and tmuxline setings
let g:airline_symbols_ascii = 1
"let g:airline_theme='deus'

" Buftabline
let g:buftabline_indicators = 1
let g:buftabline_numbers = 2
" list buffers
nnoremap <leader>L :ls<CR>:b
" close buffer
nnoremap <leader>q :bd<CR>
nnoremap <leader>Q :bd!<CR>
" navigate buffers
" nnoremap fe :bnext<CR>
" nnoremap fE :bprev<CR>
func! NextBuf(cmd)
    execute a:cmd
    while &buftype == 'quickfix'
        execute a:cmd
    endwhile
endfunc
nnoremap fe :call NextBuf(':bnext')<CR>
nnoremap fE :call NextBuf(':bprev')<CR>
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

" gitgutter settings
" disable making the sign column look like the line number column
let g:gitgutter_override_sign_column_highlight = 0
" make gutter black
hi SignColumn ctermbg=0
let g:gitgutter_enabled = 1
nnoremap <leader>gg :GitGutterToggle<CR>

""
"" indentLine stuff
let g:indentLine_color_term = 241
let g:indent_guides_guide_size=1

"" closetag stuff
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

"" vim-colors-solarized stuff
" let g:solarized_termcolors=256
" colorscheme solarized

" Ale settings
let g:ale_linters = {
\    'python': ['flake8'],
\    'rust': ['rls'],
\}
let g:ale_python_flake8_options = '--config=setup.cfg --max-line-length=120'
let g:ale_rust_rls_executable = 'rls'
let g:ale_rust_rls_toolchain = 'stable'

let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
let g:ale_list_window_size = 2
let g:ale_linters_explicit = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nnoremap <Leader>cn :lnext<CR>
nnoremap <Leader>cp :lprevious<CR>

" Enable echo doc
let g:echodoc#enable_at_startup = 1

" tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" autoclose doc
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Clojure
autocmd FileType clojure nmap <leader>r :Require!<CR>
autocmd FileType clojure nmap <leader>t :RunTests<CR>
" Disable mapping hooks
let g:sexp_filetypes = ''
function! s:vim_sexp_mappings()
    nmap <silent><buffer> <leader>b         <Plug>(sexp_capture_prev_element)
    nmap <silent><buffer> <leader>B         <Plug>(sexp_emit_head_element)
    nmap <silent><buffer> <leader>a         <Plug>(sexp_capture_next_element)
    nmap <silent><buffer> <leader>A         <Plug>(sexp_emit_tail_element)
    nmap <silent><buffer> <leader>x         <Plug>(sexp_splice_list)
endfunction
autocmd FileType clojure,scheme,lisp,timl call s:vim_sexp_mappings()

" ocaml
autocmd FileType ocaml setlocal commentstring=(*\ %s\ *) sw=2 ts=2 sts=2 et
autocmd FileType dune setlocal commentstring=;\ %s sw=2 ts=2 sts=2 et
autocmd FileType opam setlocal commentstring=#\ %s sw=2 ts=2 sts=2 et

" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
" execute "set rtp+=" . g:opamshare . "/ocp-indent/vim"

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)
autocmd FileType go nmap <leader>gft  :GoTestFunc<CR>
autocmd FileType go nmap <Leader>goc <Plug>(go-coverage-toggle)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>gob :<C-u>call <SID>build_go_files()<CR>

" Rust formatting
let g:rustfmt_autosave = 1
" Rust completion
autocmd FileType rust nnoremap <leader>a O///<space>

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" YouCompleteMe C/Cpp
autocmd FileType cpp,c let g:ycm_global_ycm_extra_conf = '~/.settings/.ycm_extra_conf.py'

" Gundo
nnoremap <leader>u :GundoToggle<CR>
let g:gundo_prefer_python3 = 1

" js
let g:jsx_ext_required = 0  " Allow jsx in js files

" js doc
let g:jsdoc_enable_es6 = 1
autocmd FileType javascript.jsx nnoremap <Leader>a :JsDoc<CR>

" Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" doc string shortcut
autocmd FileType java nnoremap <leader>a O/**<CR><CR>/<ESC>kA<space>

" Git stuff -- Requires vim.fugitive and vim.conflicted
nnoremap <Leader>gb :Gblame
nnoremap <Leader>gc :Conflicted
nnoremap <Leader>gn :GitNextConflict
vnoremap gho :Gbrowse<CR>
vnoremap ghc :Gbrowse!<CR>

" See here for how rhubarb to picks a host
" https://github.com/tpope/vim-rhubarb/blob/977b3ccbad1f7e5370354ae409fb2ea4a7ce2058/autoload/rhubarb.vim#L51
let g:fugitive_github_domains = {$C1_SSH_URL: $C1_HTTPS_URL}


" xml/json auto formatting
vnoremap <Leader>ox :!xmllint --format -<CR>
vnoremap <Leader>oj :!jq "." -M<CR>

" python
let python_highlight_all = 1
" doc string shortcut
autocmd FileType python nnoremap <leader>a o""""""<ESC>hhi<CR><CR><ESC>kA
au FileType python nnoremap <leader>bb Oimport pdb; pdb.set_trace()<esc>
au FileType python nnoremap <leader>bt Ofrom nose.tools import set_trace; set_trace()<esc>

" cpp
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
" doc string shortcut
autocmd FileType cpp nnoremap <leader>a O/*<CR>/<ESC>kA<space>

" elixir
" doc string shortcut
autocmd FileType elixir nnoremap <leader>a O@doc<space>""""""<esc>hhi<cr><esc>O

"" ----- other File specifics ------
""
au BufNewFile,BufRead *.ron set filetype=rust  " Use rust syntax for .ron files
au BufNewFile,BufRead *.hy set filetype=clojure  " Use clj syntax for .hy files
au BufNewFile,BufRead Gearsfile set filetype=yaml
au BufNewFile,BufRead BogieFile set filetype=yaml

" Set spacing
au FileType html setl sw=4 sts=4
au FileType vue setl sw=2 sts=2
au FileType javascript setl sw=2 sts=2

"" ----- vimcmdline
" vimcmdline mappings
let cmdline_map_start          = '<leader>v'
let cmdline_map_send           = '<Space>'
" let cmdline_map_send_and_stay  = '<leader><Space>'
let cmdline_map_source_fun     = '<leader>f'
let cmdline_map_send_paragraph = '<leader>z'
" let cmdline_map_send_block     = '<leader>b'
let cmdline_map_quit           = '<leader>b'

" vimcmdline options
let cmdline_vsplit      = 1      " Split the window vertically
let cmdline_esc_term    = 1      " Remap <Esc> to :stopinsert in Neovim's terminal
let cmdline_in_buffer   = 1      " Start the interpreter in a Neovim's terminal
let cmdline_term_height = 15     " Initial height of interpreter window or pane
let cmdline_term_width  = 80     " Initial width of interpreter window or pane
let cmdline_tmp_dir     = '/tmp' " Temporary directory to save files
let cmdline_outhl       = 1      " Syntax highlight the output

let cmdline_app           = {}
let cmdline_app['python'] = 'python'
let cmdline_app['ruby']   = 'ruby'
let cmdline_app['sh']     = 'bash'


"" ----- custom stuff (funcs and bindings) ------
""
" Toggle line numbers!
map <C-n> :call Toggle_numbers()<CR>
let numtog = 1
func! Toggle_numbers()
    if g:numtog == 0
        set number
        set relativenumber
    else
        set nonumber
        set norelativenumber
    endif
    let g:numtog = <SID>toggler(g:numtog)
endfunc

" Surround visually selected text!
" augments vim.surround functionality
vnoremap <Leader>' xi'<ESC>pa'<ESC>
vnoremap <Leader>" xi"<ESC>pa"<ESC>
vnoremap <Leader>( xi(<ESC>pa)<ESC>
vnoremap <Leader>[ xi[<ESC>pa]<ESC>
vnoremap <Leader>{ xi{<ESC>pa}<ESC>
vnoremap <Leader>< xi<<ESC>pa><ESC>

" ---------------------------------------
" Auto expanding forms!
" ---------------------------------------
inoremap <expr> <enter> <SID>expand_pair()

func! s:expand_pair()
    let l:pairs = ['{}', '[]', '()']
    let l:col = col('.')
    let l:line = getline('.')
    let l:chrs = l:line[l:col-2 : l:col-1]
    if index(l:pairs, l:chrs) > -1
        return "\<enter>\<Esc>\<up>o"
    else
        return "\<enter>"
    endif
endfunc

" ------------------------------------------
" Auto closing forms!
" -----------------------------------------
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
let is_lispy = 0    " always auto pair all forms when lispy
au BufNewFile,BufRead *.clj* let is_lispy = 1
let is_html_like = 0
au FileType html,javascript.jsx let is_html_like = 1

inoremap <expr> ( <SID>pairform('(', ')', [ ')', ']', '}', '>', '"', ''''], g:is_lispy, g:is_html_like)
inoremap <expr> [ <SID>pairform('[', ']', [ ')', ']', '}', '>', '"', ''''], g:is_lispy, g:is_html_like)
inoremap <expr> { <SID>pairform('{', '}', [ ')', ']', '}', '>', '"', ''''], g:is_lispy, g:is_html_like)
inoremap <expr> < <SID>pairform('<', '>', [ ')', ']', '}', '>', '"', ''''], g:is_lispy, g:is_html_like)
inoremap <expr> " <SID>pairquotes('"')
inoremap <expr> ' <SID>pairquotes("'")

inoremap <expr> ) <SID>escapepair(')')
inoremap <expr> ] <SID>escapepair(']')
inoremap <expr> } <SID>escapepair('}')
inoremap <expr> > <SID>escapepair('>')

inoremap <expr> <bs> <SID>delpair()

" Make quote completion toggle-able from all modes
let pairsingles = 0 " pair single quotes - off
let pairdoubles = 1 " pair double quotes - on
au BufNewFile,BufRead *.clj let pairsingles = 0 " pair singles off for clojure files

map <leader>s :call Toggle_pairsingles()<CR>
map <leader>d :call Toggle_pairdoubles()<CR>
map! <leader>s <ESC>:call Toggle_pairsingles()<CR>a
map! <leader>d <ESC>:call Toggle_pairdoubles()<CR>a

func! Toggle_pairsingles()
    let g:pairsingles = <SID>toggler(g:pairsingles)
    echo "pairsingles: " . g:pairsingles
endfunc
func! Toggle_pairdoubles()
    let g:pairdoubles = <SID>toggler(g:pairdoubles)
    echo "pairdoubles: " . g:pairdoubles
endfunc

" Auto pair a start-close pair if there's nothing to the immediate right of the cursor.
" If there's something there and it's the closing character or it isn't in the
" set of chars for which pairing is allowed, don't add the closing char
" If we're lispy, always auto-close pairs.
" If we're html-like, don't pair tag openings.
" Only pair '<>' when left-adjacent char is non-whitespace.
func! s:pairform(start, close, pair_ok, is_lispy, is_html_like)
    if a:is_html_like && a:start == "<"
        return a:start
    endif
    let l:col = col('.')
    let l:line = getline('.')
    let l:chr = l:line[l:col-1]
    let l:prev = l:line[l:col-2]
    if a:start == "<"
        if l:prev == "<" || l:prev == " "
            return a:start
        endif
    endif
    if len(l:chr) > 0 && a:is_lispy == 0
        if index(a:pair_ok, l:chr) < 0
            return a:start
        endif
    endif
    return a:start.a:close."\<left>"
endfunc

func! s:pairquotes(quote)
    if a:quote == "'" && g:pairsingles == 0
        return a:quote
    elseif a:quote == '"' && g:pairdoubles == 0
        return a:quote
    endif
    let l:col = col('.')
    let l:line = getline('.')
    let l:chr = l:line[l:col-1]
    if a:quote == l:chr
        return "\<right>"
    else
        if a:quote == "'"
            let l:pair_ok = ['"', ')', ']', '}', '>']
        elseif a:quote == '"'
            let l:pair_ok = ["'", ')', ']', '}', '>']
        endif
        return s:pairform(a:quote, a:quote, l:pair_ok, 0, 0)
    endif
endfunc

func! s:escapepair(rightchr)
    let l:col = col('.')
    let l:chr = getline('.')[l:col-1]
    if a:rightchr == l:chr
        return "\<right>"
    else
        return a:rightchr
    endif
endfunc

func! s:delpair()
    let l:pairs = ['""', "''", '{}', '[]', '()', '<>']
    let l:col = col('.')
    let l:line = getline('.')
    let l:chrs = l:line[l:col-2 : l:col-1]
    if index(l:pairs, l:chrs) > -1
        return "\<bs>\<del>"
    else
        " Delete both <open> & <close> when backspacing on <close>
        "let l:chrs = l:line[l:col-3 : l:col-2]
        "if index(l:pairs, l:chrs) > -1
        "    return '\<bs>\<bs>'
        "endif
        return "\<bs>"
    endif
endfunc

" Boolean toggler
func! s:toggler(bool)
    if a:bool == 0
        return 1
    else
        return 0
    endif
endfunc

