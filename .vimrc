set nocompatible    " be iMproved, required
filetype off        " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'jayli/vim-easydebugger'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" File tree manager
Plugin 'scrooloose/nerdtree' 
" display git status within Nerdtree
Plugin 'Xuyuanp/nerdtree-git-plugin' 
" add beautiful icons besides files
" Plugin 'ryanoasis/vim-devicons'  
" enhance nerdtree's tabs
Plugin 'jistr/vim-nerdtree-tabs' 
Plugin 'sillybun/vim-repl'
" All of your Plugins must be added before the following line.
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe的配置信息
""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"
let g:syntastic_ignore_files=[".*\.py$"] 
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1
" 语义补全
" let g:ycm_key_invoke_completion='<c-y>'
"关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
" 让补全行为与一般的IDE一致
set completeopt=longest,menu
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=1
" 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=1
" 在注释中也可以补全
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
" 输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
" 错误标识符
let g:ycm_error_symbol='>>'
" 警告标识符
let g:ycm_warning_symbol='>*'
" 不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
let g:ycm_use_ultisnips_completer=1
let g:ycm_auto_trigger = 1
 
let g:ycm_semantic_triggers =  {
\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
\ 'cs,lua,javascript': ['re!\w{2}'],
\ }
nnoremap gl :YcmCompleter GoToDeclaration<CR>
nnoremap gf :YcmCompleter GoToDefinition<CR>
""""""""""""""""""""""""""""""""""""
" nerdTree的配置
""""""""""""""""""""""""""""""""""""
" >> Basic settings
map <c-h> :NERDTreeToggle<CR>
let g:NERDTreeChDirMode = 2  "Change current folder as root
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) |cd %:p:h |endif
" >> UI settings
let NERDTreeQuitOnOpen=1 " Close NERDtree when files was opend
let NERDTreeMinimalUI=1 " Start NERDTree in minimal UI model
let NERDTreeDirArrows=1 " Display arrows instead of ascii art in NERDTree
let NERDTreeCHDirMode=2 " Change current working directory based on root directory in NERDTree
let g:NERDTreeHidden=1 " Don't show hidden files
"let NerdTreeWinSize=30 " Initial DERDTree width
let NERDTreeAutoDeleteBuffer=1 " Auto delete buffer deleted with NerdTree
let NERDTreeIgnore = ['\.pyc$', '\.swp', '\.swo', '__pycache__']   " Hide temp files in NERDTree
let g:NERDTreeShowLineNumbers=1  " Show Line Number
autocmd vimenter * if !argc()|NERDTree|endif " Open Nerdtree when there's no file opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close NERDTree when there's no other windows
let g:nerdtree_tabs_open_on_console_startup=0
">> Customize icons on Nerdtree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
">> NERDTree-Git: Special characters
let g:loaded_nerdtree_git_status=1
">> Nerdtree-devicons
"set guifont=DroidSansMono_Nerd_Font:h11
">> Nerdtree-syntax-highlighting
let g:NERDTreeDisableFileExtensionHighlight = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error

""""""""""""""""""""""""
"代码折叠
""""""""""""""""""""""""
let g:SimpylFold_docstring_preview=1

""""""""""""""""""""""""
" airline配置
""""""""""""""""""""""""
set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
let g:airline#extensions#tabline#enabled = 1   " 是否打开tabline
"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1
set laststatus=2  "永远显示状态栏
let g:airline_theme='luna' "选择主题
let g:airline#extensions#tabline#enabled=1    "Smarter tab line: 显示窗口tab和buffer
let g:airline#extensions#tabline#left_sep = ' '  "separater
let g:airline#extensions#tabline#left_alt_sep = '|'  "separater
let g:airline#extensions#tabline#formatter = 'default'  "formater
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
"""""""""""""""""""""""""
" snippets 配置
"""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger='<c-j>'

"""""""""""""""""""""""""
" gitgutter 配置
"""""""""""""""""""""""""
let g:gitgutter_terminal_reports_focus=1
"""""""""""""""""""""""""
" easyDebugger
"""""""""""""""""""""""""
" Vim-EasyDebugger 快捷键配置
" 启动 NodeJS/Python/Go 调试
nmap <S-R>  <Plug>EasyDebuggerInspect
" 启动 NodeJS 的 Web 调试模式
nmap <S-W>  <Plug>EasyDebuggerWebInspect
" 关闭调试
nmap <S-E>  <Plug>EasyDebuggerExit
" 暂停程序
nmap <F6>   <Plug>EasyDebuggerPause
tmap <F6>   <Plug>EasyDebuggerPause
" 跳出函数
nmap <F7>   <Plug>EasyDebuggerStepOut
tmap <F7>   <Plug>EasyDebuggerStepOut
" 进入函数
nmap <F8>   <Plug>EasyDebuggerStepIn
tmap <F8>   <Plug>EasyDebuggerStepIn
" 单步执行
nmap <F9>   <Plug>EasyDebuggerNext
tmap <F9>   <Plug>EasyDebuggerNext
" Continue
nmap <F10>  <Plug>EasyDebuggerContinue
tmap <F10>  <Plug>EasyDebuggerContinue
" 设置断点
nmap <F12>  <Plug>EasyDebuggerSetBreakPoint

"""""""""""""""""""""""""
" vim-markdown
"""""""""""""""""""""""""
let g:vim_markdown_math = 1

"""""""""""""""""""""""""
" vim-indent-guides 
"""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup=0

"""""""""""""""""""""""""
" vim-repl
"""""""""""""""""""""""""
let g:repl_program = {
            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   }
let g:repl_predefine_python = {
            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
nnoremap ;r :REPLToggle<Cr>
autocmd Filetype python nnoremap ;d <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap ;n <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap ;s <Esc>:REPLPDBS<Cr>
let g:repl_position = 3
let g:sendtorepl_invoke_key = ";;"
let g:repl_vimscript_engine = 0

"""""""""""""""""""""""""
" Quickly Run
"""""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %< -std=c++11"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'python'
		if search("@profile")
			exec "AsyncRun kernprof -l -v %"
			exec "copen"
			exec "wincmd p"
		elseif search("set_trace()")
			exec "!python3 %"
		else
			exec "AsyncRun -raw python3 %"
			exec "copen"
			exec "wincmd p"
		endif
	endif
endfunc

noremap gg :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc

" 不同buffer之间的切换
noremap bj :bn<CR>
noremap bk :bp<CR>
noremap bh :b#<CR>
" 不同tab之间的切换
noremap tj :tabNext<CR>
noremap tk :tabPrevious<CR>

" 在一般模式下打开终端
nnoremap tt :term ++rows=6<CR>

colorscheme murphy

set nu
set hlsearch
set backspace=indent,eol,start
syntax on
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set splitbelow
set splitright
echo ">^.^<"
noremap ss :source $MYVIMRC<CR>
