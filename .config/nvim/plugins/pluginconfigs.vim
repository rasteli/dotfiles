""" Emmet
let g:user_emmet_mode='a'                 " - Enable all modes functions in emmet-vim.
let g:user_emmet_leader_key='<C-Space>'   " - Actually the binding is <C-Space>, (with a trailing comma).

""" NERDTree
let NERDTreeShowHidden=1                            " - Show hidden files in NERDTree.
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}  " - Open file in new tab in NERDTree.

""" IndentLine
let g:indentLine_char = '|'             " - Indentation character.
let g:indentLine_enabled = 1            " - Enables/Disables IndentLine.
let g:indentLine_color_term = 103       " - Color of character when true color is disable.
let g:indentLine_color_gui = '#383D4A'  " - Color of character when true color is enabled.

""" Lightline configuration
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['gitbranch', 'readonly', 'filename', 'modified']
  \   ]
  \  },
  \  'component_function': {
  \     'gitbranch': 'gitbranch#name'
  \   }
  \ }

""" COC SETTINGS
"let g:coc_node_path = '/usr/local/lib/nodejs/node-v17.3.0-linux-x64/bin/node'
"command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
""
"let g:coc_global_extensions = [
      ""\ 'coc-pairs',
      ""\ 'coc-prettier',
      ""\ 'coc-tsserver',
      ""\ 'coc-json',
      ""\ 'coc-eslint',
      ""\ ]

""" CLOSE TAG
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'

""" LSP CONFIG
lua << EOF
require'lspconfig'.gdscript.setup{}
EOF
