"James Chow vim setting profile
"General Setting {
	set background=dark
	syntax enable
    "colorscheme solarized
	syntax on
	set number
    set relativenumber
	"set helplang=en
	set helplang=cn
    "set vim remember line
    set history=700

	set mouse=a
	set mousehide

	set nowrap
	set autoindent
	set tabstop=4
	set expandtab
	set shiftwidth=4
	
	"colorscheme desert

    "map the shortcut key for change window size
    "nmap <leader>w= :resize +3<CR>
    "nmap <leader>w- :resize -3<CR>
    "nmap <leader>w, :vertical resize -3<CR>
    "nmap <leader>w. :vertical resize +3<CR>
"}

"Bundle {
    filetype off
    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()
"}


Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'uguu-org/vim-matrix-screensaver'
"Bundle 'Raimondi/delimitMate'
"Bundle 'carlhuda/janus'
Bundle 'jiangmiao/auto-pairs'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-airline/vim-airline'
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on

"Nerdtree {
    let NERDChrismasTree=0
    let NERDTreeWinSize=35
    let NERDTreeChDirMode=2
    let NERDTreeIgnore=['\~$', '\.swp$'] "Ignore the bak files
    let NERDTreeShowBookmarks=1
    let NERDTreeWinPos="left"
    map <C-n> :NERDTreeToggle<CR>
"}

"Fugitive {
    set laststatus=2 "Always display the status line
    set statusline+=%{fugitive#statusline()} "Git hotness
"}

"Syntastic {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_check_on_open=1
    let g:syntastic_check_on_wq=0
"}

"ctrlp {
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
"}

"You complete me {

"}

