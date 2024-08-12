set number 
set relativenumber
syntax enable
set termguicolors
call plug#begin()
 Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

colorscheme catppuccin_mocha

