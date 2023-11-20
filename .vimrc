"   __     __)
"  (, /|  /|           /)
"    / | / |  _   _   //  _  __
" ) /  |/  |_(_(_(_/_(/__(/_/ (___________ Vimrc__
"(_/   '        .-/
"              (_/
"
" Vimrc Created by magler. May 11, 2017
"
" Todo {{{

" Todo: Sphinx syntax hilighting.
" Todo: Change the map for edit vimrc so it opens in tab.
" Todo: Fix Theme so it works in term
" ToDo: Fix completion for python
" Todo: Add support for snipets.
" Todo: Add https://github.com/Xuyuanp/nerdtree-git-plugin
" Todo: toggle spell check https://gist.github.com/brandonpittman/9d15134057c7267a88a8
" ToDo: user devicons in lightline
" Todo: activate fold when you attempt to move past 0 on the left.

" }}}
" Done {{{
" Todo: toggle NertTree with ",nt"
" Done: change the lightline theme to match cruncbang.
" Done: Add support for code completion.
" }}}
" Autosave {{{
" reload vimrc on save.
autocmd! bufwritepost .vimrc source %

" Auto load vimrc on save
"turn off the cached autosave
set noswapfile
" }}}
" Misc {{{
"set encoding=utf-8
set nocompatible              " required
filetype off                  " required

" spelling
set spell spelllang=en_us

" Change leader to comma
let mapleader=","

" ,ev open vimrc in vsplit
nmap <silent> <leader>ev :vsplit $MYVIMRC<CR>
" ,ez open zshrc in vsplit
nmap <silent> <leader>ez :vsplit ~/.zshrc<CR>
" ,ei open notes in vsplit
nmap <silent> <leader>ei :vsplit ~/notes.txt<CR>
" Insert a timestamp
nmap <silent> <leader>id :put =strftime(\"%c\")<CR>

" Quickly get out of insert mode
" without your fingers having to leave the home row
" (either use 'jj' or 'jk')
" https://github.com/nvie/vimrc/blob/master/vimrc#L302-L304
inoremap jj <Esc>

" }}}
" Plugins {{{
"Start {{{
" https://github.com/junegunn/vim-plug
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align 
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" }}}

" autocomplete
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
"Bundle 'Valloric/YouCompleteMe'

" Syntax
" Plugin 'scrooloose/syntastic'
" Plugin 'hdima/python-syntax'
Plug 'JazzCore/vim-python-syntax'
Plug 'nvie/vim-flake8'

" Devicons
Plug 'ryanoasis/vim-devicons'

" Directory tree/File Manager
Plug 'scrooloose/nerdtree'
" Plugin 'jistr/vim-nerdtree-tabs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ctrlpvim/ctrlp.vim'

" Status line
Plug 'itchyny/lightline.vim'

" Color scheme
Plug 'nightsense/vim-crunchbang'
" Plugin 'AlessandroYorba/Arcadia'
Plug 'tomasr/molokai'
Plug 'crusoexia/vim-monokai'
Plug 'nightsense/carbonized'
" Plugin 'ciaranm/inkpot'
Plug 'hzchirs/vim-material'

"Visual indentation
Plug 'Yggdroot/indentLine'

" Rainbow parentheses
Plug 'luochen1990/rainbow'

" End {{{

" All of your Plugins must be added before the following line
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"}}}
" }}}
" Plugin Settings {{{
" NERDTree {{{

let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" you can add these colors to your .vimrc to help customizing

" let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

" let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

" let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
" let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

"}}}
" Lightline {{{
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
"}}}
" CTRLp {{{
" Setup some default ignores
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
    \ 'file': '\v\.(pyc|exe|so|dll|class|png|jpg|jpeg)$',
    \}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in
" version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'
"}}}
" IndentLine {{{
"
let g:indentLine_char = '⡇'
"   }}}
" Rainbow parentheses {{{
"
let g:rainbow_active = 1
"   }}}
" vim-jedi {{{
let g:jedi#completions_enabled = 0
"
"   }}}
"}}}
" Search {{{
" real regex search
nnoremap / /\v
vnoremap / /\v
" sane search, case insensitive is all lower case, any upper turnes it off
set ignorecase
set smartcase
" global regex default
set gdefault
" highlight as you search
set incsearch
set showmatch
set hlsearch

"clear hilights on ,<SPACE>
nnoremap <leader><space> :noh<cr>

" }}}
" Movement {{{

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ,nt toggle NERDtree
nmap <silent> <leader>nt :NERDTreeToggle<CR>

" }}}
" Colors/GUI {{{
set encoding=utf8

set t_Co=256

" Font
" https://github.com/ryanoasis/vim-devicons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''


if has('gui_running')
  " Disable Gvim menu stuff.
  set guioptions-=m  "menu bar
  set guioptions-=T  "toolbar
  set guioptions-=r  "scrollbar 

  " Knack Nerd Font
  set guifont=Hack\ Nerd\ Font\ Mono:h11:cANSI
  set background=dark
  "colorscheme crunchbang
  colorscheme carbonized-dark
else
  set guifont=Hack\ Nerd\ Font:h15:cANSI
  set background=dark
  colorscheme carbonized-dark
endif

" function that will toggle the menus and stuff in gui mode from SO:
" https://stackoverflow.com/a/13525844
function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction

map <F11> <Esc>:call ToggleGUICruft()<cr>

" by default, hide gui menus
set guioptions=i

"statusline
set laststatus=2
set noshowmode

let python_highlight_all=1
syntax on

" set line numbers
set number
set relativenumber

"Line length guide
set colorcolumn=79
highlight ColorColumn ctermbg=237

"show tabs and eol
set list
set listchars=tab:⣏\ ,eol:⠗
highlight EndOfBuffer guifg=#5f5f5f

"highlight the current line
set cursorline

"Change docstring to comment
syn region pythonDocString start=+^\s*"""+ end=+"""+ keepend contains=...
"syn keyword pythonSelf self
highlight pythonSelf gui=italic
highlight pythonSelf ctermfg=208 guifg=#ff8700

"italic comments?
highlight Comment gui=italic
highlight Comment ctermfg=242
" }}}
" File settings {{{
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
"}}}
" Folding {{{
set foldenable
set modelines=1
"
" Fold line has transparent background.
hi Folded guibg=NONE

" This function replaces the default foldtext and makes fancy fold lines that
" stay within the bounds of the textwidth. This works by filling the space
" from the fold title to the line width with dashes, then filling the rest of
" the line with spaces.
"
" This is the first function I have ever created for vim!
setlocal foldtext=FoldText()
function! FoldText()
" Settings to fold text and limit the width of the dashes by filling with
" spaces.
  " Grab just the title and remove the extras.
  let title=split(split(getline(v:foldstart), "{\{{")[0], '\"')[0]
  " Then get the length of the title.
  let title_length=strlen(title)
  " Get the width of the vim window.
  let window_width=winwidth('')
  " get the width that will be used for the spaces.
  let space_width=window_width-&textwidth
  " Get the width that will be used for dashes.
  let dash_width=&textwidth-title_length
  " Create the spaces.
  let space_fill=repeat(" ", space_width)
  " Create the dashes.
  let dash_fill=repeat('-', dash_width)
  " Tie it all together to create the full title line.
  let fold_title=title.dash_fill.space_fill
  return fold_title
endfunction
"}}}
" vim:foldmethod=marker:foldlevel=0
