" VIM PLUG
	call plug#begin('~/.vim/plugged')
		Plug 'tpope/vim-fugitive'
		Plug 'dense-analysis/ale'
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'preservim/nerdtree'
		Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
		Plug 'junegunn/fzf.vim'
		Plug 'grvcoelho/vim-javascript-snippets'
	call plug#end()

"Impostazioni varie
	set fileencodings=iso-88591
	set clipboard+=unnamedplus

" Menu di autocompletazione
	set completeopt=longest,menuone

" Colori
	"color gruvbox
	colorscheme onehalfdark

" Inserisci numeri di riga
	se nu

" Opzione per fzf
	autocmd VimEnter * command! -nargs=* Rg
	  \ call fzf#vim#grep(
	  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
	  \   <bang>0 ? fzf#vim#with_preview('up:60%')
	  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
	  \   <bang>0)

" Coc Snippets
	inoremap <silent><expr> <TAB>
	      \ pumvisible() ? "\<C-n>" :
	      \ <SID>check_back_space() ? "\<TAB>" :
	      \ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	if has('patch8.1.1068')
	  " Use `complete_info` if your (Neo)Vim version supports it.
	  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	else
	  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	endif

" Mappings
	"Nerd Tree
		map <C-n> :NERDTreeToggle<CR>
	"RipGrep
		nnoremap <leader>a :Rg<space>
		nnoremap <C-A> :exec "Rg ".expand("<cword>")<cr>
	"FZF mapping
		nnoremap <C-f> :Files<Enter>
	" Vim Fugitive
		nmap <space>s :Gstatus<cr>
		nmap <space>c :Gcommit -v<cr>
		nmap <space>a :Git add -p<cr>
		nmap <space>p :Gpush<cr>
		nmap <space>P :Gpull<cr>
		nmap <space>gd :Gdiff<cr>
		nmap <space>gw :Gwrite<cr>

" Opzione per le jsp
	autocmd FileType jsp :syntax sync fromstart
