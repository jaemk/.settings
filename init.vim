" " neovim settings
" "   - ~/.config/nvim/init.vim
" "
" " Plug setup
" " curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
" "   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" " start nvim -> :PluginInstall
" "
" " For vim-markdown-composer
" "   go to ~/.local/share/nvim/plugged/vim-markdown-composer
" "       cargo build --release --no-default-features --features json-rpc
" "
call plug#begin('~/.local/share/nvim/plugged')
" " ----------- extra building required
Plug 'euclio/vim-markdown-composer'
" Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'Shougo/echodoc.vim'
" "
" " ----------- linting
Plug 'w0rp/ale'
" "
" " ----------- misc util
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'kshenoy/vim-signature'
Plug 'nathanaelkane/vim-indent-guides'
"" Plug 'jremmen/vim-ripgrep' " use ack.vim instead with ripgrep
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdTree'
Plug 'ntpeters/vim-better-whitespace'
"" Plug 'jaemk/vim-upaste'
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
Plug 'prakashdanish/vim-githubinator'
 "
 " ----------- git
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'
Plug 'airblade/vim-gitgutter'
" "
" " ----------- Langs
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'cespare/vim-toml'
Plug 'hdima/python-syntax'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'derekwyatt/vim-scala'
"" Plug 'posva/vim-vue'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'
"" Plug 'kien/rainbow_parentheses.vim'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc'
Plug 'octol/vim-cpp-enhanced-highlight'
"" Plug 'vim-scripts/groovy.vim'
Plug 'jparise/vim-graphql'
call plug#end()

" Set <Leader>
let mapleader=","

"" -- Python Envs
" neovim envs
" let g:python_host_prog = '/Users/james/bin/envs/nvim2/bin/python'
" let g:python3_host_prog = '/Users/james/bin/envs/nvim/bin/python'
let g:python_host_prog = '/home/james/bin/envs/nvim2/bin/python'
let g:python3_host_prog = '/home/james/bin/envs/nvim/bin/python'


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
nnoremap fe :bnext<CR>
nnoremap fE :bprev<CR>
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
" let g:indentLine_color_term = 241
let g:indent_guides_guide_size=1

"" closetag stuff
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

"" vim-colors-solarized stuff
" let g:solarized_termcolors=256
" colorscheme solarized

" Ale settings
let g:ale_python_flake8_options = '--config=setup.cfg --max-line-length=120'
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
let g:ale_list_window_size = 2
let g:ale_linters_explicit = 1
let g:ale_linters = {
\    'python': ['flake8'],
\}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nnoremap <Leader>cn :lnext<CR>
nnoremap <Leader>cp :lprevious<CR>

" Clojure
"autocmd FileType clojure nmap <leader>r :Require!<CR>

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

map <Leader>ne :cnext<CR>
map <Leader>pe :cprevious<CR>
nnoremap <Leader>ce :cclose<CR>

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


" Enable echo doc
let g:echodoc#enable_at_startup = 1

" Enable deoplete and tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" autoclose doc
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#enable_at_startup = 1

" python completion
" - make sure jedi is installed in the env (virtual or system (--user))
let g:deoplete#sources#jedi#show_docstring = 1
let g:jedi#completions_enabled = 1

" Rust completion
let g:deoplete#sources#rust#racer_binary = $RACER_PATH
let g:deoplete#sources#rust#rust_source_path = $RUST_SRC_PATH
autocmd FileType rust nnoremap <leader>a O///<space>

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

" xml/json auto formatting
vnoremap <Leader>ox :!xmllint --format -<CR>
vnoremap <Leader>oj :!jq "." -M<CR>

" python
let python_highlight_all = 1
" doc string shortcut
autocmd FileType python nnoremap <leader>a o""""""<ESC>hhi<CR><CR><ESC>kA

" cpp
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
" doc string shortcut
autocmd FileType cpp nnoremap <leader>a O/*<CR>/<ESC>kA<space>

"" ----- other File specifics ------
""
au BufNewFile,BufRead *.ron set filetype=rust  " Use rust syntax for .ron files
au BufNewFile,BufRead *.hy set filetype=clojure  " Use clj syntax for .hy files

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


" Toggle auto highlighting
let g:autohl = 1
nnoremap <C-s> :call Toggle_autohl()<CR>
func! Toggle_autohl()
    let g:autohl = <SID>toggler(g:autohl)
    echo "autohl: " . g:autohl
    return
endfunc


" -----------------------------------------------------------------------------
" -----------------------------------------------------------------------------
"
" HiCursorWords -- Highlights words under the cursor.
"
" Maintainer: Shuhei Kubota <kubota.shuhei+vim@gmail.com>
" Description:
"   This script highlights words under the cursor like many IDEs.
"
"   This doesn't provide scope-aware highlighting nor language specific one.
"   You can control highlighting by highlighting group names.
"
" Variables:
"
"   (A right hand side value is a default value.)
"
"   g:HiCursorWords_delay = 200
"       A delay for highlighting in milliseconds.
"       Smaller value may cause your machine slow down.
"
"   g:HiCursorWords_hiGroupRegexp = ''
"       If empty, all words are highlighted.
"       If not empty, only the specified highlight group is highlighted.
"       (my memo: 'Identifier\|vimOperParen')
"
"       To investigate highlight group name, the next variable may help you.
"
"   g:HiCursorWords_debugEchoHiName = 0
"       If not 0, echoes the highlight group name under the cursor.
"
" Hightlight groups:
"
"   (Do :highlight! as you like.)
"
"   WordUnderTheCursor
"
"

if !exists('g:HiCursorWords_delay')
    let g:HiCursorWords_delay = 200
endif

if !exists('g:HiCursorWords_hiGroupRegexp')
    let g:HiCursorWords_hiGroupRegexp = ''
endif

if !exists('g:HiCursorWords_debugEchoHiName')
    let g:HiCursorWords_debugEchoHiName = 0
endif


highlight! link WordUnderTheCursor Search

augroup HiCursorWords
    autocmd!
    autocmd  CursorMoved,CursorMovedI  *  call s:HiCursorWords__startHilighting()
augroup END


function! s:HiCursorWords__getHiName(linenum, colnum)
    let hiname = synIDattr(synID(a:linenum, a:colnum, 0), "name")
    let hiname = s:HiCursorWords__resolveHiName(hiname)
    return hiname
endfunction

function! s:HiCursorWords__resolveHiName(hiname)
    redir => resolved
    silent execute 'highlight ' . a:hiname
    redir END

    if stridx(resolved, 'links to') == -1
        return a:hiname
    endif

    return substitute(resolved, '\v(.*) links to ([^ ]+).*$', '\2', '')
endfunction

function! s:HiCursorWords__getWordUnderTheCursor(linestr, linenum, colnum)
    "let word = substitute(a:linestr, '.*\(\<\k\{-}\%' . a:colnum . 'c\k\{-}\>\).*', '\1', '') "expand('<word>')
    let word = matchstr(a:linestr, '\k*\%' . a:colnum . 'c\k\+')
    if word == ''
        return ''
    endif
    return '\V\<' . word . '\>'
endfunction

function! s:HiCursorWords__execute()
    if exists("w:HiCursorWords__matchId")
        call matchdelete(w:HiCursorWords__matchId)
        unlet w:HiCursorWords__matchId
    endif
    if g:autohl == 0
        if exists("w:HiCursorWords__matchId")
            call matchdelete(w:HiCursorWords__matchId)
            unlet w:HiCursorWords__matchId
        endif
        return
    endif

    let linestr = getline('.')
    let linenum = line('.')
    let colnum = col('.')

    if g:HiCursorWords_debugEchoHiName
        echo s:HiCursorWords__getHiName(linenum, colnum)
    endif

    let word = s:HiCursorWords__getWordUnderTheCursor(linestr, linenum, colnum)
    if strlen(word) != 0
        if strlen(g:HiCursorWords_hiGroupRegexp) != 0
                    \ && match(s:HiCursorWords__getHiName(linenum, colnum), g:HiCursorWords_hiGroupRegexp) == -1
                return
        endif
        let w:HiCursorWords__matchId = matchadd('WordUnderTheCursor', word, 0)
    endif
endfunction

function! s:HiCursorWords__startHilighting()
    let b:HiCursorWords__oldUpdatetime = &updatetime
    let &updatetime = g:HiCursorWords_delay
    augroup HiCursorWordsUpdate
        autocmd!
        autocmd CursorHold,CursorHoldI  *
                    \ if exists('b:HiCursorWords__oldUpdatetime') | let &updatetime = b:HiCursorWords__oldUpdatetime | endif
                    \ | call s:HiCursorWords__execute()
    augroup END
endfunction

