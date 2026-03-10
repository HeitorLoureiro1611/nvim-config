" ==============================================================================
" CONFIGURAÇÕES GERAIS
" ==============================================================================
set number              " Mostra número da linha
set relativenumber      " Mostra linhas relativas (ajuda na movimentação)
set cursorline          " Destaca linha atual
set mouse=a             " Habilita mouse
set clipboard=unnamedplus " Usa a área de transferência do sistema
set termguicolors       " Cores reais (24-bit)
set background=dark     " Fundo escuro
set ttyfast             " Scrolling mais rápido
set hidden              " Permite trocar de buffer sem salvar

" Indentação
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Busca
set hlsearch
set incsearch
set wildmode=longest,list

" Comportamento de janelas e arquivos
filetype plugin indent on
syntax on
set laststatus=3        " Barra de status única no final da tela

" ==============================================================================
" PLUGINS
" ==============================================================================
call plug#begin()
    " IDE & Autocompletar
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    
    " Visual e Tema
    Plug 'sainnhe/everforest'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'
    
    " Utilitários
    Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
call plug#end()

" ==============================================================================
" CONFIGURAÇÃO DE PLUGINS E TEMA
" ==============================================================================
" Everforest
let g:everforest_background = 'soft'
let g:everforest_better_performance = 1
colorscheme everforest

" NERDTree
let g:NERDTreeWinSize = 20
let g:NERDTreeMinimalUI = 1

" --- Configuração do CoC para diagnósticos ---
" Usa o 'sign column' para mostrar erros
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Função auxiliar para o Tab funcionar no começo da linha
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:UltiSnipsExpandTrigger="<c-j>" " Muda o gatilho do snippet para Ctrl+J

" Atalhos para navegar entre erros
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Atalho para mostrar a mensagem do erro (se estiver em cima da linha)
nnoremap <leader>d :<C-u>CocDiagnostics<CR>

" ==============================================================================
" ATALHOS (KEYMAPPINGS)
" ==============================================================================
" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>



" Salvar e Compilar/Executar C com F5
nnoremap <F5> :w <bar> !gcc % -o %< && ./%< <CR>
" ==============================================================================
" LUA (Configuração da Lualine)
" ==============================================================================
lua << EOF
require('lualine').setup({
  options = {
    theme = 'everforest',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  }
})
EOF
