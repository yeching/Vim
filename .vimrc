"*=====================================================================================================*/ 
"/usr/share/vim/vim74vimrc_example.vim
"*=====================================================================================================*/ 

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


" allow backspacing over everything in insert mode
set backspace=indent,eol,start


if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"  set mouse=a
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

"*=====================================================================================================*/ 
"added by myself
"*=====================================================================================================*/ 

"基本设置

colorscheme torte     "设置背景主题  
set nu                  "可以在每一行的最前面显示行号啦！
syntax on               "进行语法检验，颜色显示。
set noautoindent		"自动缩进
set autowrite          "自动保存

"语言设置
set langmenu=UTF-8
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8

"自动插入文件头

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.sh,.py文件，自动插入文件头 

autocmd BufNewFile *.* exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"#/*=========================================================================*/") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: yeqing") 
        call append(line(".")+2, "\# mail: yq08051035@163.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
	    call append(line(".")+4, "\# Version: V1.0") 
	    call append(line(".")+5, "\# Function: ")
        call append(line(".")+6, "#/*=========================================================================*/") 
        call append(line(".")+7, "\#!/bin/bash") 
        call append(line(".")+8, "") 
     elseif &filetype == 'python'
	     call setline(1, "#!/usr/bin/env python")
         call append(line("."),"\#_*_ coding=utf-8 _*_")
         call append(line(".")+1,"#/*=========================================================================*/") 
	     call append(line(".")+2, "\# File Name: ".expand("%"))
         call append(line(".")+3, "\# Author: yeqing")
         call append(line(".")+4, "\# mail: yq08051035@163.com")
         call append(line(".")+5, "\# Created Time: ".strftime("%c"))
         call append(line(".")+6, "\# Version: V1.0")
         call append(line(".")+7, "\# Function: ")
         call append(line(".")+8, "#/*=========================================================================*/")
         call append(line(".")+9, "")

      endif

    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

