syntax enable
set number relativenumber
set autoindent
set cindent
set cursorline
set encoding=utf8
set autoread
set langmenu=en
set ruler
set hid
set cmdheight=1
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set lazyredraw 
set magic
set foldcolumn=1
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
set list
set termguicolors
set laststatus=2
set mouse=a
set updatetime=100
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50
filetype plugin indent on
set runtimepath+=$GOROOT/misc/vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000

if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tpope/vim-fugitive'
Plug 'raimondi/delimitmate'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'majutsushi/tagbar'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'valloric/youcompleteme'
Plug '907th/vim-auto-save'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'luochen1990/rainbow'

Plug 'ryanoasis/vim-devicons'

call plug#end()

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:airline_powerline_fonts = 1
let g:NERDTreeDirArrowExpandable = '▸'
let NERDTreeHighlightCursorline=1
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowCollapsible = '▾'
let g:go_fmt_command = "goimports"
let $LANG='en' 
let g:Tlist_Ctags_Cmd='/usr/bin/ctags'

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:go_highlight_format_strings = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1

let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_build_constraints = 1

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_auto_type_info = 1
let g:go_metalinter_autosave = 1
let g:go_auto_sameids = 1
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nmap <leader>w :w!<cr>
nmap <leader>\ :NERDTreeToggle<CR>
nmap <leader>/ :TagbarToggle<cr>
map <D-n> :cnext<CR>
map <D-m> :cprevious<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <leader>q :q!<CR>    " Quickly close the current window
nnoremap <S-F6> :GoRename<CR>


augroup nerdtreehidetirslashes
	autocmd!
	autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
augroup end

let g:auto_save = 0
augroup ft_markdown
  au!
  au FileType markdown let b:auto_save = 1
augroup END

let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')

autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AI call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
    nmap mkk :BookmarkMoveUp
    nmap mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
    unmap mkk
    unmap mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

colorscheme sublimemonokai