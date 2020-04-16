 " _______  _______  _______           _______  _______ _________
" (  ____ \(  ___  )(       )|\     /|(  ____ )(  ___  )\__   __/
" | (    \/| (   ) || () () || )   ( || (    )|| (   ) |   ) (   
" | (_____ | (___) || || || || |   | || (____)|| (___) |   | |   
" (_____  )|  ___  || |(_)| || |   | ||     __)|  ___  |   | |   
 "      ) || (   ) || |   | || |   | || (\ (   | (   ) |   | |   
" /\____) || )   ( || )   ( || (___) || ) \ \__| )   ( |___) (___
" \_______)|/     \||/     \|(_______)|/   \__/|/     \|\_______/
                                                               
let mapleader = ","
 " __      ___                   _             
 " \ \    / (_)                 | |            
 "  \ \  / / _ _ __ ___    _ __ | |_   _  __ _ 
 "   \ \/ / | | '_ ` _ \  | '_ \| | | | |/ _` |
 "    \  /  | | | | | | | | |_) | | |_| | (_| |
 "     \/   |_|_| |_| |_| | .__/|_|\__,_|\__, |
 "                        | |             __/ |
 "                        |_|            |___/ 
	call plug#begin('~/.vim/plugged')
        Plug 'tpope/vim-fugitive'
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        Plug 'christoomey/vim-tmux-navigator'
        Plug 'dracula/vim', { 'as': 'dracula' }
        Plug 'unblevable/quick-scope'
        Plug 'chrisbra/Colorizer'
        Plug 'junegunn/limelight.vim'
        Plug 'lifepillar/vim-mucomplete'
        Plug 'dmerejkowsky/vim-ale'
        Plug 'ludovicchabant/vim-gutentags'
        Plug 'tpope/vim-commentary'
	call plug#end()

  " _                    
 " | |                   
 " | |__   __ _ ___  ___ 
 " | '_ \ / _` / __|/ _ \
 " | |_) | (_| \__ \  __/
 " |_.__/ \__,_|___/\___|

    se nu
    set noswapfile

    set smarttab
    set cindent
    set tabstop=4
    set shiftwidth=4
    " always uses spaces instead of tab characters
    set expandtab
" Colori
	color dracula
" Opzione per le jsp
	autocmd FileType jsp :syntax sync fromstart


             " _                                  _      _   _             
            " | |                                | |    | | (_)            
  " __ _ _   _| |_ ___   ___ ___  _ __ ___  _ __ | | ___| |_ _  ___  _ __  
 " / _` | | | | __/ _ \ / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __| |/ _ \| '_ \ 
" | (_| | |_| | || (_) | (_| (_) | | | | | | |_) | |  __/ |_| | (_) | | | |
 " \__,_|\__,_|\__\___/ \___\___/|_| |_| |_| .__/|_|\___|\__|_|\___/|_| |_|
             "                             | |                             
             "                             |_|                             

    set completeopt+=menuone
    set completeopt+=noselect
    set shortmess+=c   " Shut off completion messages
    " Menu di autocompletazione
	set completeopt=longest,menuone

    "set fileencodings=iso-88591
    set clipboard^=unnamed,unnamedplus
    
    " if hidden is not set, TextEdit might fail.
	set hidden 
	set updatetime=300

    " don't give |ins-completion-menu| messages.
	set shortmess+=c

    " always show signcolumns
	set signcolumn=yes

    " j/k will move virtual lines (lines that wrap)
    noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')


  " __      __ 
 " / _|    / _|
" | |_ ___| |_ 
" |  _|_  /  _|
" | |  / /| |  
" |_| /___|_|  

	autocmd VimEnter * command! -nargs=* Rg
	  \ call fzf#vim#grep(
	  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
	  \   <bang>0 ? fzf#vim#with_preview('up:60%')
	  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
	  \   <bang>0)

"FZF mapping
    nnoremap <C-f> :Files<Enter>
"RipGrep
    nnoremap <leader>a :Rg<space>
    nnoremap <C-A> :exec "Rg ".expand("<cword>")<cr>

  " __             _ _   _           
 " / _|           (_) | (_)          
" | |_ _   _  __ _ _| |_ ___   _____ 
" |  _| | | |/ _` | | __| \ \ / / _ \
" | | | |_| | (_| | | |_| |\ V /  __/
" |_|  \__,_|\__, |_|\__|_| \_/ \___|
  "           __/ |                  
  "          |___/                   
    nmap <space>s :Gstatus<cr>
    nmap <space>c :Gcommit -v<cr>
    nmap <space>a :Git add -p<cr>
    nmap <space>p :Gpush<cr>
    nmap <space>P :Gpull<cr>
    nmap <space>gd :Gdiff<cr>
    nmap <space>gw :Gwrite<cr>



             " _      _                             
            " (_)    | |                            
  " __ _ _   _ _  ___| | _____  ___ ___  _ __   ___ 
 " / _` | | | | |/ __| |/ / __|/ __/ _ \| '_ \ / _ \
" | (_| | |_| | | (__|   <\__ \ (_| (_) | |_) |  __/
 " \__, |\__,_|_|\___|_|\_\___/\___\___/| .__/ \___|
    " | |                               | |         
    " |_|                               |_|         
  let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
  let g:qs_highlight_on_keys = ['f', 'F']
  highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline


   " _                  
  " (_)                 
   " _  __ ___   ____ _ 
  " | |/ _` \ \ / / _` |
  " | | (_| |\ V / (_| |
  " | |\__,_| \_/ \__,_|
 " _/ |                 
" |__/                  
  map <space>e :set makeprg=javac\ %<CR>:make<CR>
  map <space>r :!echo %\|awk -F. '{print $1}'\|xargs java<CR>
