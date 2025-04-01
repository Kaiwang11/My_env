" set autoindent
set cursorline
set nu
set autowrite
syntax enable
" autocmd CursorHold * silent! checktime
set hlsearch
set clipboard=unname
set statusline+=%F
set t_Co=256
let g:auto_save = 1
" colorscheme seoul256
colorscheme codedark
" colo seoul256-light
let g:solarized_contrast="low"
set background=dark
" colorscheme one
let python_highlight_all=1
autocmd BufNewFile,BufRead *.py set syntax=python
set foldmethod=indent
set tabstop=4
set softtabstop=4
set mouse=a
let g:SimpylFold_docstring_preview = 1
let g:python_highlight_all = 1
let g:python_highlight_operators=1

let g:airline#extensions#tabline#enabled = 1
autocmd FileType apache setlocal commentstring=#\ %s
filetype plugin indent on
autocmd FileType python map <buffer> <F3> :call flake8#Flake8()<CR>
call plug#begin()
	" Plug 'junegunn/seoul256.vim'
	Plug 'tomasiser/vim-code-dark'
	Plug 'junegunn/vim-easy-align'
	xmap ga <Plug>(EasyAlign)
	" Plug 'Valloric/YouCompleteMe'
	" let g:ycm_auto_hover = ''
	" let s:ycm_hover_popup = -1
	" nmap <leader>D <plug>(YMHover)
	Plug 'tomtom/tcomment_vim'
	"Plug 'tpope/vim-commentary'
	Plug '907th/vim-auto-save'
	"Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
	"Plug 'sheerun/vim-polyglot'
	Plug 'preservim/nerdcommenter'
	Plug 'tpope/vim-surround' " ysiw' cs'(
	Plug 'vim-scripts/indentpython.vim'
	Plug 'vim-syntastic/syntastic'
	Plug 'nvie/vim-flake8'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'altercation/vim-colors-solarized'
	Plug 'scrooloose/nerdtree'
	Plug 'vim-airline/vim-airline'
	map <C-p> :NERDTreeToggle %<CR>
	let NERDTreeChDirMode=1
	Plug 'tmsvg/pear-tree'
	nnoremap <C-n> :NERDTreeToggle<CR>
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
	Plug 'tmhedberg/SimpylFold'
	Plug 'tpope/vim-repeat'

	Plug 'preservim/tagbar'
	"let g:tagbar_ctags_bin
	nnoremap <Space> :TagbarToggle<CR>
	nnoremap tn :TagbarOpen fj<CR>
    set tags+=~/.local/lib/python3.8/site-packages/tags
	
	" Plug 'prabirshrestha/async.vim'
	" Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/vim-lsp'
	"Plug 'mattn/vim-lsp-settings'
	"let g:lsp_document_highlight_enabled = 0
	"nmap <buffer> gs <plug>(lsp-definition)
	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
	inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
	if executable('pylsp')
	    " pip install python-lsp-server
	    au User lsp_setup call lsp#register_server({
	        \ 'name': 'pylsp',
	        \ 'cmd': {server_info->['pylsp']},
	        \ 'allowlist': ['python', 'python3'],
	        \ })
	"nmap <buffer> gd <plug>(lsp-definition)	
	Plug 'dense-analysis/ale'
	let g:ale_linters={
		\ 'python': ['pylsp'],
	\}
	let g:ale_virtualtext_cursor = 'current'
	highlight clear ALEErrorSign
	highlight clear ALEWarningSign
	let g:ale_sign_column_always = 1
	let g:ale_completion_enabled = 1
	let g:ale_fixer='autoimport'
	let g:ale_statusline_format = ['E:%d', 'W:%d', 'ok']
	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_completion_autoimport = 0
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
	let g:ale_lint_on_enter = 1
	let g:ale_set_signs = 1
	let g:ale_sign_error = '◈'
	let g:ale_sign_warning = '◈'
	let g:lsp_diagnostics_enabled = 1
	nmap gd :ALEGoToDefinition<cr>
	nmap gr :ALEFindReferences<cr>
	nmap gh :ALEHover<cr>
	nmap gs :ALESymbolSearch<cr>
endif
	
call plug#end()
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '-', '#' ]
	  execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
	    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
		  execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
		    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor
