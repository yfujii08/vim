" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '~/my-prototype-plugin'
" Plugin vimproc
" Plug 'Shougo/vimproc'
" Plugin autocomplete
Plug 'https://git::@github.com/Shougo/neocomplete.vim.git'
" Plugin indent guide
Plug 'https://git::@github.com/nathanaelkane/vim-indent-guides.git'
Plug 'Yggdroot/indentLine'
" Plugin neobundle
Plug 'Shougo/neobundle.vim'
" Plugin powerline theme
Plug ' itchyny/lightline.vim'
" Plugin Nvim-R
" Plug 'jalvesaq/Nvim-R'
Plug 'Shougo/deoplete.nvim'
Plug 'vim-scripts/Vim-R-plugin'
Plug 'vim-scripts/fcitx.vim'
Plug 'plasticboy/vim-markdown'
" Plugin vim-hybrid Colorscheme
Plug 'w0ng/vim-hybrid'
Plug 'vim-scripts/phd'
Plug 'vim-scripts/twilight'
Plug 'djjcast/mirodark'
Plug 'jpo/vim-railscasts-theme'
Plug 'ciaranm/inkpot'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-scripts/BusyBee'
Plug 'sonjapeterson/1989.vim'
" Add plugins to &runtimepath
call plug#end()

" indent guide setting
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=239
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_size = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" indentLine
let g:indentLine_color_term = 248
let g:indentLine_char = '|' " '┆'
let g:indentLine_setColors = get(g:,'indentLine_setColors',1)
let g:indentLine_faster = get(g:,'indentLine_faster',0)

" let g:indentLine_color_tty_light = 7 " (default: 4)
" let g:indentLine_color_dark = 1 " (default: 2)
" Let indentLine use current conceal options
let g:indentLine_conceallevel  = &conceallevel 
let g:indentLine_concealcursor = &concealcursor

function! s:InitColor()
    if ! g:indentLine_setColors
        return
    endif

    if ! exists("g:indentLine_color_term")
        if &background is# "light"
            let term_color = 249
        else
            let term_color = 239
        endif
    else
        let term_color = g:indentLine_color_term
    endif

    if ! exists("g:indentLine_color_gui")
        if &background is# "light"
            let gui_color = "Grey70"
        else
            let gui_color = "Grey30"
        endif
    else
        let gui_color = g:indentLine_color_gui
    endif

    execute "highlight Conceal ctermfg=" . term_color . " ctermbg=NONE"
    execute "highlight Conceal guifg=" . gui_color .  " guibg=NONE"
endfunction

autocmd ColorScheme * highlight Comment ctermfg=22 guifg=#008800


" Colorscheme: phd, twilight, hybrid
 set background=dark
 let g:hybrid_use_Xresources = 1
 let g:hybrid_custom_term_colors = 1
 let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme hybrid "badwolf

" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '¥h¥w*'
" }}}

"##### auto fcitx  ###########
function! Fcitx2en()
 let s:input_status = system("fcitx-remote")
 if s:input_status == 2
    let l:a = system("fcitx-remote -c")
 endif
endfunction

set ttimeoutlen=150
autocmd InsertLeave * call Fcitx2en()
"##### auto fcitx end ######

" neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
let g:tex_conceal = ''
let g:vim_markdown_conceal=''
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" unable indent
:setlocal formatoptions-=ro

" r-vim
let maplocalleader = ","
 
" deoplete
" Use deoplete.
" let g:deoplete#enable_at_startup = 1
" Use smartcase.
" let g:deoplete#enable_smart_case = 1
" for Nvim-R
if !exists('g:deoplete#omni_patterns')
  let g:deoplete#omni_patterns = {}
endif
let g:deoplete#omni_patterns.r = '[[:alnum:].\\]\+'
     
" nvim-r
let R_vsplit = 1
let R_assign = 0

let R_nvimpager = "horizontal"

let R_objbr_place = "console,right"
let R_objbr_opendf = 0 

" インサートモードに入った時にカーソル行(列)の色を変更する
augroup vimrc_change_cursorline_color
  autocmd!
  " インサートモードに入った時にカーソル行の色をブルーグリーンにする
  autocmd InsertEnter * highlight CursorLine ctermbg=17 guibg=#DDA0DD | highlight CursorColumn ctermbg=17 guibg=#DDA0DD
  " インサートモードを抜けた時にカーソル行の色を黒に近いダークグレーにする
  autocmd InsertLeave * highlight CursorLine ctermbg=236 guibg=#303030 | highlight CursorColumn ctermbg=236 guibg=#303030
augroup END


" ---カンマコマンドモード---
" 「,」を打ってから各キーを打つと各コマンドを実行
let mapleader=","
"" 「,r」：.vimrcのリロード
"noremap <Leader>r :source /etc/vim/vimrc<CR>:noh<CR>
"" 「,,」：ファイルの上書き保存
nnoremap <Leader>, :<C-u>update<CR>
"" 「,q」：ファイルを閉じる
nnoremap <Leader>q :<C-u>q<CR>
"" 「,Q」：ファイルを強制的に閉じる
"nnoremap <Leader>Q :<C-u>q!<CR>
"" 「,p」：ペースト
"nnoremap <Leader>p :<C-u>set invpaste<CR>
"" 「,k」：make
"noremap <Leader>k :<C-u>make!<CR><CR>:<C-u>make! clean<CR><CR>
"" 「,m」：マウスモードOFF
"noremap <Leader>m :<C-u>set mouse=<CR>:set nonumber<CR>
"" 「,M」：マウスモードON
"noremap <Leader>M :<C-u>set mouse=a<CR>:set number<CR>
"" 「,e」：メニューの表示(タブで各項目を選んでいく)
"nnoremap <Leader>e :<C-u>emenu Commands.<TAB>
" 「,s」：ウィンドウを縦分割
"nnoremap <Leader>s :<C-u>sp<CR>
" 「,v」：ウィンドウを横分割
"nnoremap <Leader>v :<C-u>vs<CR>
"" 「,S」：ウィンドウを縦分割(ファイルを選択)
nnoremap <Leader>S :<C-u>sp <TAB>
"" 「,V」：ウィンドウを横分割（ファイルを選択）
nnoremap <Leader>V :<C-u>vs <TAB>
"" 「,t」：新規タブを作成
"nnoremap <Leader>t :<C-u>tabnew<cr>
"" 「,T」：新規タブを作成（ファイルを選択）
"nnoremap <Leader>T :<C-u>tabnew <TAB>
"" 「,n」：行番号表示／非表示
"noremap <Leader>n :<C-u>:setlocal number!<CR>
"" 「,c」：カーソルラインの表示／非表示
"noremap <Leader>c :<C-u>:setlocal cursorline!<CR>
"" 「,C」：カーソルカラムの表示／非表示
"noremap <Leader>C :<C-u>:setlocal cursorcolumn!<CR>
"" 「,l」：タブ、空白、改行などの可視化ON／OFF
"noremap <Leader>l :<C-u>:setlocal list!<CR>

""" vim-r-plugin setting """
" https://raw.githubusercontent.com/jcfaria/Vim-R-plugin/master/doc/r-plugin.txt
" NeoComplete
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
 
" R (plugin: vim-R-plugin)
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#functons')
    let g:neocomplete#sources#omni#functions= {}
endif
let g:neocomplete#sources#omni#input_patterns.r = '[[:alnum:].\\]\+'
let g:neocomplete#sources#omni#functions.r = 'rcomplete#CompleteR'
 
" vim-r-plugin
let vimrplugin_vsplit = 0
let vimrplugin_assign = 0
let vimrplugin_objbr_place = "console,right"
let vimrplugin_objbr_opendf = 0
let vimrplugin_tmux_title = "Vim-R"
let vimrplugin_vimpager = "tab"
let vimrplugin_silent_term = 1

" .Rprofile
" if(interactive()){
"   library(colorout)
"   library(setwidth)
"   library(vimcom)
" }

"""

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set number
set title
set fenc=utf-8
set showcmd
set cursorline
set ambiwidth=double
set tabstop=2
set expandtab
set shiftwidth=2
set smartindent
set showmatch
set matchtime=1
set list
set laststatus=2
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nrformats-=octal
set hidden
set history=50
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set wildmenu
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
set t_Co=256
set clipboard=unnamedplus,autoselect

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif


nnoremap j gj
nnoremap k gk
" change key mapping with pushing <Space>
noremap <Space>h ^
noremap <Space>l $
noremap <Space>m %
noremap <Space>v 0v$h
noremap <Space>d 0v$hx
noremap <Space>y 0v$hy
nnoremap Y y$ " yank to last
" nnoremap x "_x without yank
" nnoremap <C-k> "_dd without yank
" inoremap <C-k> <Esc>"_ddi

" cursor moved in insert mode
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>


autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=2 expandtab shiftwidth=2 softtabstop=2

" endode setting
if has('unix')
  set fileformat=unix
  set fileformats=unix,dos,mac
  set fileencoding=utf-8
  set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
  set termencoding=
elseif has('win32')
  set fileformat=dos
  set fileformats=dos,unix,mac
  set fileencoding=utf-8
  set fileencodings=iso-2022-jp,utf-8,euc-jp,cp932
  set termencoding=
endif

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
