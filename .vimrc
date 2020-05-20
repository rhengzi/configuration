call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'  "语法检查
Plug 'Valloric/YouCompleteMe' " C/C++完成代码补全,语法检查
Plug 'sillybun/vim-repl'   " Python代码的调试执行
Plug 'scrooloose/nerdtree'  " 文件结构显示
Plug 'tpope/vim-surround'  " 符号对的输入
" git管理
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter' " 对vim Buffer中文件修改控制进行显示
Plug 'tpope/vim-fugitive'   "显示git分支信息
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tmhedberg/simpylfold'
Plug 'jiangmiao/auto-pairs'
call plug#end()


""""""""""""""""""""""""""""""""""""
" simpylfold的配置
""""""""""""""""""""""""""""""""""""
let g:SimpylFold_docstring_preview = 1

""""""""""""""""""""""""""""""""""""
" ale的配置
""""""""""""""""""""""""""""""""""""
let b:ale_fixers = {'python':['pylint']}

"""""""""""""""""""""""""
" vim-airline-themes的配置
"""""""""""""""""""""""""
set t_Co=256
"1. 显示buffer的tab
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""
" nerdtree-git-plugin的配置
"""""""""""""""""""""""""
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"""""""""""""""""""""""""
" nerdtree的配置
"""""""""""""""""""""""""
noremap ;a :NERDTreeToggle<CR>

let NERDTreeMinimalUI = 1
let NERDTreeCHDirMode = 2

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


""""""""""""""""""""""""""""""""""""
" YouCompleteMe的配置
""""""""""""""""""""""""""""""""""""
"1. 函数的跳转
nnoremap gl :YcmCompleter GoToDeclaration<CR>
nnoremap gf :YcmCompleter GoToDefinition<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
"2. 代码提示
let g:ycm_auto_trigger=1

"""""""""""""""""""""""""
" vim-repl的配置
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
" vim主题
colorscheme ron
" 一般设置
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
noremap ss :source $MYVIMRC<CR>

set cursorline
set cursorcolumn
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
