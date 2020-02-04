let mapleader =","

" DOWNLOAD DEI PLUGINS
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

"__________________________________________________________________PLUGINS_____________________________________

call plug#begin('~/.config/nvim/plugged')
	Plug 'tpope/vim-surround'
	Plug 'scrooloose/nerdtree'
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/goyo.vim'
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'vimwiki/vimwiki'
	Plug 'artur-shaik/vim-javacomplete2'
	Plug 'bling/vim-airline'
	Plug 'tpope/vim-commentary'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'kovetskiy/sxhkd-vim'
	Plug 'dense-analysis/ale'
	Plug 'jiangmiao/auto-pairs'
	Plug 'honza/vim-snippets'
	Plug 'mhartington/oceanic-next'
	Plug 'SirVer/ultisnips'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'morhetz/gruvbox'
	Plug 'AndrewRadev/linediff.vim'
call plug#end()


set termguicolors
"Impostazione dell'encoding
set fileencodings=iso-88591
color gruvbox


" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set number relativenumber
	set bg=dark
	set go=a
	set ma
	set mouse=a
	set nohlsearch
	set clipboard+=unnamedplus
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	map <leader>z :Goyo \| set bg=light \| set linebreak<CR>


" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l


" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writting
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd


" Opzione per fzf
autocmd VimEnter * command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Folding and unfolding
	" nnoremap f :set foldmethod=indent<cr>zM<cr>
	" nnoremap F :set foldmethod=manual<cr>zR<cr>

"Copia con Y
	noremap Y y$

"Formattazione
	" vmap Q gq
	" nmap Q gqap

"Indentazione migliore
	vnoremap < <gv
	vnoremap > >gv

"Tab
	nnoremap tk :tabnew<Space>
	nnoremap tn :tabnext<CR>
	nnoremap tj :tabprev<CR>


"RipGrep
	nnoremap <leader>a :Rg<space>
	nnoremap <leader>A :exec "Rg ".expand("<cword>")<cr>

"Salvare
	nnoremap <leader>, :w!<CR>
	vnoremap <leader>, :w!<CR>

"Uscire
	nnoremap <leader>q :q!<CR>
	inoremap <leader>q :q!<CR>
	vnoremap <leader>q :q!<CR>

"FZF mapping
	nnoremap <Leader>f :Files<Enter>

" Opzione per le jsp
	autocmd FileType jsp :syntax sync fromstart
	"autocmd BufEnter * :syntax sync fromstart
	set redrawtime=10000

"Vim sorround
	nnoremap <leader>s :execute "normal \<Plug>Ysurroundiw)"<cr>

"COC VIM-----------------

" Use tab for trigger completion with characters ahead and navigate.
	inoremap <silent><expr> <TAB>
	      \ pumvisible() ? "\<C-n>" :
	      \ <SID>check_back_space() ? "\<TAB>" :
	      \ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction
	inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" if hidden is not set, TextEdit might fail.
	set hidden

" Some servers have issues with backup files, see #649
	set nobackup
	set nowritebackup


" Ultisnips
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" Vim Fugitive
nmap <space>s :Gstatus<cr>
nmap <space>c :Gcommit -v<cr>
nmap <space>a :Git add -p<cr>
nmap <space>p :Gpush<cr>
nmap <space>P :Gpull<cr>
nmap <space>gd :Gdiff<cr>
nmap <space>gw :Gwrite<cr>



