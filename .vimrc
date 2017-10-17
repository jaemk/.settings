" " Vim settings
" "
" " Vundle setup
" "   in ~/.vim/bundle
" "      git clone https://github.com/VundleVim/Vundle.vim.git
" "   start vim -> :PluginInstall
" "
" " For YouCompleteMe
" "   go to ~/.vim/bundle/YouCompleteMe
" "       ./install.py --clang-completer --racer-completer
" "
" " For vim-markdown-composer
" "   go to ~/.vim/bundle/vim-markdown-composer
" "       cargo build --release --no-default-features --features json-rpc
" "
" " Optional Vundle Plugins
set nocompatible
filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" Plugin 'VundleVim/Vundle.vim'
" " ----------- extra building required
" " Plugin 'https://github.com/Valloric/YouCompleteMe.git'
" " Plugin 'euclio/vim-markdown-composer'
" "
" " ----------- linting
" Plugin 'https://github.com/scrooloose/syntastic.git'
" "
" " ----------- misc util
" Plugin 'https://github.com/tpope/vim-repeat.git'
" Plugin 'https://github.com/tpope/vim-surround.git'
" Plugin 'https://github.com/kshenoy/vim-signature.git'
" Plugin 'https://github.com/nathanaelkane/vim-indent-guides.git'
" Plugin 'https://github.com/jremmen/vim-ripgrep.git'
" Plugin 'mileszs/ack.vim'
" Plugin 'scrooloose/nerdTree'
" Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'https://github.com/jaemk/vim-upaste.git'
" Plugin 'jszakmeister/vim-togglecursor'
" Plugin 'sjl/gundo.vim'
" "
" " ----------- git
" Plugin 'https://github.com/tpope/vim-fugitive.git'
" Plugin 'https://github.com/christoomey/vim-conflicted.git'
" "
" " ----------- Langs
" Plugin 'rust-lang/rust.vim'
" Plugin 'racer-rust/vim-racer'
" Plugin 'cespare/vim-toml'
" Plugin 'hdima/python-syntax'
" Plugin 'artur-shaik/vim-javacomplete2'
" Plugin 'derekwyatt/vim-scala'
" Plugin 'posva/vim-vue'
" Plugin 'https://github.com/tpope/vim-fireplace.git'
" Plugin 'https://github.com/tpope/vim-classpath.git'
" Plugin 'https://github.com/guns/vim-sexp.git'
" Plugin 'https://github.com/tpope/vim-sexp-mappings-for-regular-people.git'
" Plugin 'https://github.com/guns/vim-clojure-static.git'
" Plugin 'https://github.com/guns/vim-clojure-highlight.git'
" Plugin 'https://github.com/kien/rainbow_parentheses.vim.git'
" Plugin 'https://github.com/fatih/vim-go.git'
" Plugin 'pangloss/vim-javascript'
" Plugin 'mxw/vim-jsx'
" Plugin 'https://github.com/heavenshell/vim-jsdoc.git'
" Plugin 'octol/vim-cpp-enhanced-highlight'
" call vundle#end()

" Set <Leader>
let mapleader=","


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
set esckeys       " better handling of arrow keys\keep vim from popping into command mode.
set ruler         " Shows percentage through file and cursor position
set showcmd       " Shows uncompleted vim commands next to the ruler
set incsearch     " Shows matches to searches before pattern is complete
set ignorecase    " Ignore case in searches
set smartcase     " ... unless search contains uppercase
set showmatch     " Show the matching thing for parens and braces (when closing is typed, cursor flashes over to the opening.)
set modeline      " Make vim look for a modeline (command in first line comment) when it loads a file up.
"set nohls         " No highlighting for searches
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

set noswapfile
set nobackup

" Setting list makes you see the list chars (lcs) This is good for makefiles and Python code, but little else
set lcs=tab:»*
set lcs+=trail:*
set listchars+=precedes:<,extends:>

" Set up file location history in .viminfo
" When returning to a file, return to the line you were on at exit
set viminfo='50,\"100,:100,%,n~/.viminfo
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
hi clear SignColumn

" Color linenumber column text grey
hi LineNr ctermfg=black ctermbg=35

" Set cursor line highlight color
hi CursorLine cterm=NONE ctermbg=24 guibg=darkred

" Make strings grey instead of purple
hi String ctermfg=42

" make comments grey
hi Comment ctermfg=246



"" ----- Bindings -------
""
" Decrease mapping timeout and map an esc shortcut
set timeoutlen=500
imap qq <ESC>

" remap 'recording' so it stops popping up
nnoremap q <Nop>
nnoremap <Leader>q q

" Map ctrl+J/K/L/H to change between split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap split window resizing since ctrl+ & ctrl- change system font size
nnoremap <Leader>w+ <C-W>+
nnoremap <Leader>w- <C-W>-

" Map // to search current file for visually selected text
vnoremap // y/<C-R>"<CR>

" Map f/ to ack for visually selected text
""vnoremap f/ y:Ack <C-R>"<CR>
vnoremap f/ y:Rg <C-R>"<CR>

" Map d/ to ack for function definition (python)
""vnoremap d/ y:Ack "def <C-R>""<CR>
vnoremap d/ y:Rg "def <C-R>""<CR>

" Map c/ to ack for class definition (python)
""vnoremap c/ y:Ack "class <C-R>""<CR>
vnoremap c/ y:Rg "class <C-R>""<CR>

" NERDTree sidebar toggle (Requires NERDTree plugin) (lower-case L)
map <Leader>l :NERDTreeToggle<CR>

" Paste Mode On/Off
set pastetoggle=<Leader>p

" Act like D and C
nnoremap Y y$

" Moving down searches will center the on the current line
nnoremap n nzzzv
nnoremap N Nzzzv

" UPaste visual select mapping
vnoremap <C-t> :<C-U>UPaste<CR>


"" ----- Plugin settings ------
""
"" indentLine stuff
" let g:indentLine_color_term = 241
let g:indent_guides_guide_size=1

"" closetag stuff
"let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

"" vim-colors-solarized stuff
" let g:solarized_termcolors=256
" colorscheme solarized

"" If you install syntastic
"" - Make sure to either:
""   - install 'flake8' in your working venv
""   - make a shell script (named 'flake8') on your path that pipes input
""     into the correct python interpreter. See the 'flake8' bash script
""   - install 'flake8' in some arbitrary venv and use:
""     let g:syntastic_python_python_exec = '~/path/to/env/bin/python'
"" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_rust_checkers = ['rustc']
" let g:syntastic_python_python_exec = '~/envs/flake3/bin/python3'  " Point to the venv with your linter installed
let g:syntastic_python_checkers = ['flake8', 'mypy']
let g:syntastic_python_flake8_quiet_messages = { 'regex' : ['E501', 'W391', 'E301', 'E221', 'E266', 'E127', 'E128', 'E114', 'E116', 'E502', 'E124'] }
let g:syntastic_mode_map = {'mode': 'passive'}
nnoremap <Leader>cr :SyntasticReset<CR>
nnoremap <Leader>cs :SyntasticCheck flake8<CR>
nnoremap <Leader>cc :SyntasticCheck mypy<CR>
nnoremap <Leader>cm :SyntasticToggleMode<CR>
nnoremap <Leader>cn :lnext<CR>
nnoremap <Leader>cp :lprevious<CR>

" Clojure
autocmd FileType clojure nmap <leader>r :Require!<CR>

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


"""" !!!!!!!!!!
" Rust (vim-racer)
" -- use C-x-C-o, will autocomplete with ycm
set hidden
let g:racer_cmd = "racer"
let g:racer_experimental_completer = 1
" RUST_SRC_PATH should be specified in .bashrc
" YouCompleteMe Rust
let g:ycm_rust_src_path = $RUST_SRC_PATH

" YouCompleteMe Cpp
let g:ycm_global_ycm_extra_conf = '~/.settings/.ycm_extra_conf.py'

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


" Git stuff -- Requires vim.fugitive and vim.conflicted
nnoremap <Leader>gb :Gblame
nnoremap <Leader>gc :Conflicted
nnoremap <Leader>gn :GitNextConflict

" python
let python_highlight_all = 1

" cpp
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

"" ----- other File specifics ------
""
au BufNewFile,BufRead *.ron set filetype=rust  " Use rust syntax for .ron files
au BufNewFile,BufRead *.hy set filetype=clojure  " Use clj syntax for .hy files

" Set spacing
au FileType html setl sw=4 sts=4
au FileType vue setl sw=2 sts=2
au FileType javascript setl sw=2 sts=2



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
inoremap <expr> ( <SID>pairform('(', ')', [ ']', '}', '>', '"', ''''])
inoremap <expr> [ <SID>pairform('[', ']', [ ')', '}', '>', '"', ''''])
inoremap <expr> { <SID>pairform('{', '}', [ ']', ')', '>', '"', ''''])
inoremap <expr> < <SID>pairform('<', '>', [ ']', ')', '}', '"', ''''])
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
func! s:pairform(start, close, pair_ok)
    let l:col = col('.')
    let l:line = getline('.')
    let l:chr = l:line[l:col-1]
    if len(l:chr) > 0
        if l:chr == a:close || index(a:pair_ok, l:chr) < 0
            " don't add a close if the next is a close or isn't in the set of
            " 'pair_ok' characters
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
        return s:pairform(a:quote, a:quote, l:pair_ok)
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

