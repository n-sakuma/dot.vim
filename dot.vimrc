syntax on

:source ~/.vim/config/keymap.vim

"新しい行のインデントを現在行と同じにする
set autoindent
"バックアップファイルを作るディレクトリ
set backupdir=$HOME/.vim/backup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
"set browsedir=buffer
"クリップボードをWindowsと連携
"set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"スワップファイル用のディレクトリ
filetype off

set directory=$HOME/.vim/swaps
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
"シフト移動幅
set shiftwidth=2
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=2
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
"set nowrapscan
" 常に開いているファイルと同じディレクトリをカレントディレクトリにする
au BufEnter * execute ":lcd " . expand("%:p:h")

" 保存時に行末の空白削除
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/ /ge

" 余計なVimエディタが起動しないようにする
runtime macros/editexisting.vim

" 文字のないところにもカーソルを移動できる
" all   : all mode (normal, insert, ...)
" block : only visual mode
set virtualedit=all

" 検索結果ハイライトを ESCキーの連打でリセットする
:nnoremap <ESC><ESC> :nohlsearch<CR>

" vimgrepコマンドで検索したら、検索結果の一覧を自動で開く
augroup grepopen
  autocmd!
  autocmd QuickFixCmdPost vimgrep cw
augroup END

set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh


colorscheme torte
if has('gui_macvim')
    set showtabline=2 " タブを常に表示
    set imdisable " IMを無効化
    set transparency=15 " 透明度を指定
    set antialias
    set guifont=Monaco:h14
endif

" if has("gui_running")
"   set fuoptions=maxvert,maxhorz
"   au GUIEnter * set fullscreen
" endif

" gvimrc があとから読まれる
" 読まれたく無いファイルには下記の設定を記述
"let plugin_cmdex_disable = 1

" vundle
:source ~/.vim/config/bundles.vim

" 文字コード関連設定
:source ~/.vim/config/character.vim

" calendar
:source ~/.vim/config/qfixhown-config.vim

