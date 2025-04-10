set encoding=utf-8

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set laststatus=2
set hidden
"set mouse=a " mouse & xterm interaction
set showcmd " show command as its typed
set signcolumn=yes

" disable matching parent behavior (use % instead)
let g:loaded_matchparen=1

" auto commands
:autocmd InsertEnter * set cursorline
:autocmd InsertLeave * set nocursorline
augroup Config

autocmd!
" autoreload vimrc
autocmd BufWritePre * call StripWhitespace()
autocmd BufWritePost *.vimrc source ~/.vimrc
augroup END

function! StripWhitespace()
    "if &ft == 'markdown'
    "    return
    "endif
    let pos = getcurpos()
    %s#\s\+$##e " EOL
    %s#\($\n\s*\)\+\%$##e " EOF
    call setpos('.', pos)
endfunction

" switch between buffers easily
nmap <silent> <C-p> :bprevious<CR>
nmap <silent> <C-n> :bnext<CR>

" install https://github.com/junegunn/vim-plug if it isn't there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn
/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugin list
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'psf/black', { 'branch': 'stable' }
call plug#end()
