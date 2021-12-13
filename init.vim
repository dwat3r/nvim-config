
" function! Cond(cond, ...)
"   let opts = get(a:000, 0, {})
"   return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
" endfunction

lua << EOF
vim.cmd [[packadd packer.nvim]]
-- file explorer 
-- Plug 'kyazdani42/nvim-web-devicons', Cond(!exists('g:vscode')) " for file icons
-- Plug 'kyazdani42/nvim-tree.lua', Cond(!exists('g:vscode'))
-- " use normal easymotion when in vim mode
-- Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
-- " use vscode easymotion when in vscode mode
-- "Plug 'ChristianChiarulli/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })
--
-- " neovim in browser
-- Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }, Cond(!exists('g:vscode'))
--
-- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}, Cond(!exists('g:vscode'))
--
-- " Plug 'abecodes/tabout.nvim'
--
-- Plug 'nvim-lua/plenary.nvim'
-- Plug 'ful1e5/onedark.nvim', Cond(!exists('g:vscode'))
-- Plug 'tpope/vim-surround', Cond(!exists('g:vscode'))
-- Plug 'tpope/vim-repeat', Cond(!exists('g:vscode'))
-- Plug 'svermeulen/vim-yoink'
-- Plug 'svermeulen/vim-cutlass'

return require('packer').startup(function(use) 
  use 'tpope/vim-unimpaired'
  use { 'ful1e5/onedark.nvim' }
  use { 'tpope/vim-surround' }
end)
EOF

let mapleader=" "
if exists('g:vscode')
  " VSCode extension
  nnoremap gl <Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>
  xnoremap gl <Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>
  nnoremap H <Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>
  nnoremap L <Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>
  nnoremap <leader>c <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
  nnoremap <leader>e <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
  nnoremap gr <Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>
  nnoremap gs <Cmd>call VSCodeNotify('metals.goto-super-method')<CR>
  set clipboard=unnamed,unnamedplus
  nnoremap <silent> <CR> :noh<CR>
else
  " ordinary neovim
  imap jk <Esc>
  map <leader>q :wqa<cr>
  nnoremap <C-s> :w<cr>
" lua << EOF
" require'nvim-treesitter.configs'.setup {
"     highlight = { enable = true },
"     incremental_selection = { 
"       enable = true, 
" 	    keymaps = {
" 		init_selection = "<C-g>",
" 		node_incremental = "<C-g>",
" 		scope_incremental = "<leader>vv",
" 		node_decremental = "<leader>vV",
" 	  }
"   },
"   textobjects = { enable = true },
" }
" EOF
" yoink

" let g:yoinkIncludeDeleteOperations = 1 
" nmap <c-j> <plug>(YoinkPostPasteSwapBack)
" nmap <c-k> <plug>(YoinkPostPasteSwapForward)

" nmap p <plug>(YoinkPaste_p)
" nmap P <plug>(YoinkPaste_P)

" " Also replace the default gp with yoink paste so we can toggle paste in this case too
" nmap gp <plug>(YoinkPaste_gp)
" nmap gP <plug>(YoinkPaste_gP)

" nmap [y <plug>(YoinkRotateBack)
" nmap ]y <plug>(YoinkRotateForward)

" nmap [y <plug>(YoinkRotateBack)
" nmap ]y <plug>(YoinkRotateForward)
" cutlass
" nnoremap x d
" xnoremap x d

" nnoremap X D

" if !exists('g:vscode')
"   let g:EasyMotion_do_mapping = 0 " Disable default mappings

"   " Jump to anywhere you want with minimal keystrokes, with just one key binding.
"   " `s{char}{label}`
"   nmap s <Plug>(easymotion-overwin-f)
"   " or
"   " `s{char}{char}{label}`
"   " Need one more keystroke, but on average, it may be more comfortable.
"   " nmap s <Plug>(easymotion-overwin-f2)

"   " Turn on case-insensitive feature
"   let g:EasyMotion_smartcase = 1

"   " JK motions: Line motions
"   map <Leader>j <Plug>(easymotion-j)
"   map <Leader>k <Plug>(easymotion-k)
" endif
" " Firenvim
" function! OnUIEnter(event) abort
"   if 'Firenvim' ==# get(get(nvim_get_chan_info(a:event.chan), 'client', {}), 'name', '')
"     set laststatus=0
"   	set guifont=monospace:h10
"   endif
" endfunction
" autocmd UIEnter * call OnUIEnter(deepcopy(v:event))
" let g:firenvim_config = { 
"     \ 'globalSettings': {
"         \ 'alt': 'all',
"     \  },
"     \ 'localSettings': {
"         \ '.*': {
"             \ 'cmdline': 'neovim',
"             \ 'content': 'text',
"             \ 'priority': 0,
"             \ 'selector': 'textarea',
"             \ 'takeover': 'always',
"         \ },
"     \ }
" \ }
" let fc = g:firenvim_config['localSettings']
" let fc['.*'] = { 'takeover': 'never' }

" " use unnamedplus only! or else will double set
" set clipboard=unnamedplus
" if getenv('DISPLAY') == v:null
"   exe setenv('DISPLAY', 'FAKE')
" endif 

" tabout
" lua << EOF
" require'nvim-treesitter.configs'.setup {
"   -- my config here
" }
" require('tabout').setup {
"     tabkey = '<Tab>', -- key to trigger tabout
"     act_as_tab = true, -- shift content if tab out is not possible
"     completion = true, -- if the tabkey is used in a completion pum
"     tabouts = {
"     {open = "'", close = "'"},
"     {open = '"', close = '"'},
"     {open = '`', close = '`'},
"     {open = '(', close = ')'},
"     {open = '[', close = ']'},
"     {open = '{', close = '}'}
"   },
"     ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
" }
" EOF
" nord theme
" set Vim-specific sequences for RGB colors | enable true colors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors

  " " Copy to clipboard
  set clipboard=unnamed,unnamedplus
  nnoremap <silent> <CR> :noh<CR>

  set ignorecase smartcase
  set number
  set autoindent
  syntax on
  set mouse=a
  set shiftwidth=2
  set tabstop=2
  set softtabstop=2
  set hlsearch
  set expandtab
  set shiftround
  set timeoutlen=500

  colorscheme onedark

endif
