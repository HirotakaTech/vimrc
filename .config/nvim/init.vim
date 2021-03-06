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
 "
 " Auto installa vim plug
 if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

	call plug#begin('~/.vim/plugged')
            Plug 'tpope/vim-fugitive'
            Plug 'ThePrimeagen/vim-be-good'
            Plug 'tomlion/vim-solidity'
            Plug 'AndrewRadev/linediff.vim'
            Plug 'skorokithakis/pastery.vim'
            Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            Plug 'junegunn/fzf.vim'
            Plug 'habamax/vim-asciidoctor'
            Plug 'christoomey/vim-tmux-navigator'
            Plug 'dracula/vim', { 'as': 'dracula' }
            Plug 'unblevable/quick-scope'
            Plug 'chrisbra/Colorizer'
            Plug 'junegunn/limelight.vim'
            Plug 'morhetz/gruvbox'
            Plug 'liuchengxu/vista.vim'
            Plug 'kylelaker/riscv.vim'
            Plug 'neoclide/coc.nvim', {'branch': 'release'}
            Plug 'tpope/vim-commentary'
            Plug 'taohexxx/lightline-buffer'
            Plug 'ryanoasis/vim-devicons'
            Plug 'itchyny/lightline.vim'
	call plug#end()
" =============================================================================

  " _
 " | |
 " | |__   __ _ ___  ___
 " | '_ \ / _` / __|/ _ \
 " | |_) | (_| \__ \  __/
 " |_.__/ \__,_|___/\___|

 "{{
    se nu
    set noswapfile
    set cc=80 "riga di colonna

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
    set showtabline=2  " always show tabline
    set splitbelow splitright

    set termguicolors

    set autoindent
    set smarttab
    set cindent
    set tabstop=8
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set wrap
    set textwidth=80
    " always uses spaces instead of tab characters
    set expandtab

    " Colori
    color gruvbox

    " Opzione per le jsp
    autocmd FileType jsp :syntax sync fromstart

    " Save when losing focus
    au FocusLost * :silent! wall

    " Resize splits when the window is resized
    au VimResized * :wincmd =

    " Make sure Vim returns to the same line when you reopen a file.
    augroup line_return
        au!
        au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \     execute 'normal! g`"zvzz' |
            \ endif
    augroup END

    " Use sane regexes.
    nnoremap / /\v
    vnoremap / /\v

    " Line match with tab
    " map <tab> %

    " Keep search matches in the middle of the window.
    nnoremap n nzzzv
    nnoremap N Nzzzv

    " Space to toggle folds.{
    nnoremap <Space> za
    vnoremap <Space> za
    "}

    " Window resize
    nnoremap <m-right> :vertical resize +3<cr>
    nnoremap <m-left> :vertical resize -3<cr>
    nnoremap <m-up> :resize +3<cr>
    nnoremap <m-down> :resize -3<cr>

    " Formatting, TextMate-style
    nnoremap Q gqip
    vnoremap Q gq

    " Select (charwise) the contents of the current line, excluding indentation.
    " Great for pasting Python lines into REPLs.
    nnoremap vv ^vg_

    " Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e


" =============================================================================
" }}

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
    set clipboard=unnamedplus

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


    "Fix problemi java
    " noremap <leader>f :YcmCompleter FixIt<cr>

    " noremap <leader>o :YcmCompleter OrganizeImports<cr>

" =============================================================================

  " __      __
 " / _|    / _|
" | |_ ___| |_
" |  _|_  /  _|
" | |  / /| |
" |_| /___|_|
"

	autocmd VimEnter * command! -nargs=* Rg
	  \ call fzf#vim#grep(
	  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1,
	  \   <bang>0 ? fzf#vim#with_preview('up:60%')
	  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
	  \   <bang>0)

    "FZF mapping
    nnoremap <C-f> :Files<Enter>
    nnoremap <leader><leader>f :Buffer<Enter>
    "RipGrep
    nnoremap <C-A> :Rg<space>
    "nnoremap <C-A> :exec "Rg ".expand("<cword>")<cr>

" =============================================================================

  " __             _ _   _
 " / _|           (_) | (_)
" | |_ _   _  __ _ _| |_ ___   _____
" |  _| | | |/ _` | | __| \ \ / / _ \
" | | | |_| | (_| | | |_| |\ V /  __/
" |_|  \__,_|\__, |_|\__|_| \_/ \___|
  "           __/ |
  "          |___/
  "
    nmap <leader>s :Git<cr>
    nmap <leader>c :Gcommit -v<cr>
    nmap <leader>p :Gpush<cr>
    nmap <leader>P :Gpull<cr>
    nmap <leader>a :diffget //2<cr>
    nmap <leader>l :diffget //3<cr>


" =============================================================================

             " _      _
            " (_)    | |
  " __ _ _   _ _  ___| | _____  ___ ___  _ __   ___
 " / _` | | | | |/ __| |/ / __|/ __/ _ \| '_ \ / _ \
" | (_| | |_| | | (__|   <\__ \ (_| (_) | |_) |  __/
 " \__, |\__,_|_|\___|_|\_\___/\___\___/| .__/ \___|
    " | |                               | |
    " |_|                               |_|
    "
    let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
    let g:qs_highlight_on_keys = ['f', 'F']
    highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
    highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" =============================================================================

   " _
  " (_)
   " _  __ ___   ____ _
  " | |/ _` \ \ / / _` |
  " | | (_| |\ V / (_| |
  " | |\__,_| \_/ \__,_|
 " _/ |
" |__/
"
    " map <space>e :set makeprg=javac\ %<CR>:make<CR>
    " map <space>r :!echo %\|awk -F. '{print $1}'\|xargs java<CR>

" =============================================================================



"COC
"
" Give more space for displaying messages.
    set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
    set updatetime=300

    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

" Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
    if exists('*complete_info')
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

" Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

" Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

"Chiave api per pastery
    let g:pastery_apikey = "Vp8e6egMu9xTQviUDnDQSbP6CT33WXaz"


    map <space>r :w<cr>:!java %<cr>

    nnoremap <space><space> :bnext<CR>
    nnoremap <S-space> :bprevious<CR>

    tnoremap <Esc> <C-\><C-n>


"Copia roba con wl-clipboard
    map <C-p> "+P

    map <space>t :botright vertical terminal<cr>

" Emoji 😄
    set noemoji
    map <space>e :terminal ~/.config/nvim/emoji.sh<cr>I


" Asciidoc
    augroup ON_ASCIIDOCTOR_SAVE | au!
        au BufWritePost *.adoc :Asciidoctor2PDF
    augroup end

" Vista vim
    function! NearestMethodOrFunction() abort
      return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

    set statusline+=%{NearestMethodOrFunction()}

    " By default vista.vim never run if you don't call it explicitly.
    autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
    let g:vista_fzf_preview = ['right:50%']

    map <space>j :Vista coc<cr>

" use lightline-buffer in lightline
let g:lightline = {
    \ 'tabline': {
    \   'left': [ [ 'bufferinfo' ],
    \             [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \   'right': [ [ 'close' ], ],
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component_function': {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \ },
    \ 'component': {
    \   'separator': '',
    \ },
    \ }

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" enable devicons, only support utf-8
" require <https://github.com/ryanoasis/vim-devicons>
let g:lightline_buffer_enable_devicons = 1

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1

" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'

" hide buffer list
let g:lightline_buffer_excludes = ['vimfiler']

" max file name length
let g:lightline_buffer_maxflen = 30

" max file extension length
let g:lightline_buffer_maxfextlen = 3

" min file name length
let g:lightline_buffer_minflen = 16

" min file extension length
let g:lightline_buffer_minfextlen = 3

" reserve length for other component (e.g. info, close)
let g:lightline_buffer_reservelen = 20
