set belloff=all
set background=light
set mouse=a
set incsearch
set number
autocmd VimEnter * highlight clear Conceal

" statusline
set noshowmode
set laststatus=2
set statusline=
set statusline+=%{StatuslineMode()}
set statusline+=\ 
set statusline+=%m
set statusline+=%=
set statusline+=%F

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='skim'
    let g:vimtex_quickfix_mode=0
    " these two lines are for a separate plugin I use: https://github.com/KeitaNakamura/tex-conceal.vim
    set conceallevel=2
    let g:tex_conceal='abdmg'
    let g:vimtex_compiler_latexmk = {'build_dir': {-> expand("%:t:r")}}

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

Plug '/opt/homebrew/opt/fzf'
Plug 'junegunn/fzf.vim'

" Plug 'fcpg/vim-fahrenheit'

call plug#end()

" colorscheme fahrenheit
colorscheme onedark
