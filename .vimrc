set belloff=all
set background=light
set mouse=a
set incsearch
set number
set noesckeys
set smarttab
set noshowmode
set hidden
set formatoptions-=cro

autocmd VimEnter * highlight clear Conceal

autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++20 -Wall -Wextra -Wno-unused-result % -o %:r<CR>
autocmd filetype cpp nnoremap <F10> :!./%:r<CR>
"
" inoremap {<CR> {<CR>}<Esc>O
" inoremap (<CR> (<CR>)<Esc>O
" inoremap [<CR> [<CR>]<Esc>O


call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='skim'
    let g:vimtex_quickfix_mode=0
    " these two lines are for a separate plugin I use: https://github.com/KeitaNakamura/tex-conceal.vim
    set conceallevel=2
    let g:tex_conceal='abdmg'
    let g:vimtex_compiler_latexmk = {}

      augroup vimtex_config
	    au!
	    au User VimtexEventQuit call vimtex#compiler#clean(0)
	  augroup END

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-surround'

Plug '/opt/homebrew/opt/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let $FZF_DEFAULT_OPTS='--bind "ctrl-j:down,ctrl-k:up,alt-j:preview-down,alt-k:preview-up"'

Plug 'tpope/vim-sleuth'

call plug#end()
colorscheme onedark

