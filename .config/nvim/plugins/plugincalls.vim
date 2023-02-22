set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/plugged')

Plugin 'VundleVim/Vundle.vim'  " - Inititalizing vundle.

Plugin 'vimwiki/vimwiki'                " - VimWiki.
Plugin 'itchyny/lightline.vim'          " - Status line.
Plugin 'dracula/vim',{'as':'dracula'}   " - Dracula theme.

Plugin 'preservim/nerdtree'       " - File browser.
Plugin 'itchyny/vim-gitbranch'    " - Shows current branch in status line.
Plugin 'preservim/nerdcommenter'  " - Comments lines.

Plugin 'rasteli/kitty'    " - Kitty theme (best used with some transparency).
Plugin 'mattn/emmet-vim'  " - Eases html writing.
Plugin 'ap/vim-css-color' " - Preview colors inside vim.

Plugin 'dag/vim-fish'        " - Fish shell support.
Plugin 'dylanaraps/wal.vim'  " - Pywal colorscheme.
Plugin 'romgrk/doom-one.vim' " - Doom one theme.

"Plugin 'neoclide/coc.nvim'    " - Intelisense engine.
Plugin 'alvan/vim-closetag'   " - Auto close (x)html tags.
Plugin 'Yggdroot/indentLine'  " - Indentation visualizer.

"Plugin 'yuezk/vim-js'                 " - Javascript syntax highlight.
"Plugin 'maxmellon/vim-jsx-pretty'     " - JSX and TSX syntax highlighting.
"Plugin 'HerringtonDarkholme/yats.vim' " - Typescript syntax highlighting.

"Plugin 'habamax/vim-godot'       " - Vim integration with Godot.
Plugin 'neovim/nvim-lspconfig'   " - Configurations for nvim built-in language server protocol.
" - Adds icons to files and directories
" (it must be the last plugin in this call).
Plugin 'ryanoasis/vim-devicons'
Plugin 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }

call vundle#end()
