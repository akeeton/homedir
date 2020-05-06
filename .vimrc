"""""""""""
" Plugins "
"""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required
" `filetype plugin indent on` is set in vim-sensible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'akeeton/vim-interestingwords'
let g:interestingWordsDefaultMappings=0
let g:interestingWordsTermColors = ['Blue']

Plugin 'easymotion/vim-easymotion'

Plugin 'coot/CRDispatcher'
Plugin 'coot/cmdalias_vim'
Plugin 'coot/EnchantedVim'

let g:VeryMagic = 0 " (default is 1)
let g:VeryMagicSubstitute = 1  " (default is 0)
" let g:VeryMagicGlobal = 1  " (default is 0)
" let g:VeryMagicVimGrep = 1  " (default is 0)
" let g:VeryMagicSearchArg = 1  " (default is 0, :edit +/{pattern}))
" let g:VeryMagicFunction = 1  " (default is 0, :fun /{pattern})
" let g:VeryMagicHelpgrep = 1  " (default is 0)
" let g:VeryMagicRange = 1  " (default is 0, search patterns in command ranges)
" let g:VeryMagicEscapeBackslashesInSearchArg = 1  " (default is 0, :edit +/{pattern}))
" let g:SortEditArgs = 1  " (default is 0, see below)

" See https://vim.fandom.com/wiki/Have_Vim_check_automatically_if_the_file_has_changed_externally
Plugin 'djoshea/vim-autoread'

" Plugin 'haya14busa/incsearch.vim'

" Plugin 'mhinz/vim-sayonara'
" let g:sayonara_confirm_quit = 0

Plugin 'mildred/vim-bufmru'

" Improved :Bdelete and :Bwipe
Plugin 'moll/vim-bbye'

" Plugin 'powerman/vim-plugin-AnsiEsc'

Plugin 'qpkorr/vim-renamer'

Plugin 'sheerun/vim-polyglot'

" Disable tomtom/tcomment_vim mapleader (default <C-_>)
let g:tcomment_mapleader1 = ''

Plugin 'tomtom/tcomment_vim'

Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-sensible'

Plugin 'tweekmonster/startuptime.vim'

" let g:airline#extensions#tabline#enabled      = 1
" let g:airline#extensions#tabline#left_sep     = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'

" Readable themes: base16_monokai, base16_shapeshifter, term, base16_eighties
" let g:airline_theme ='bubblegum'

" File info
" let g:airline_section_y = ''

" Current line number/number of lines
" let g:airline_section_z = '%#__accent_bold#%4l/%L'

" Original line number section
" let g:airline_section_z = '%3p%% %#__accent_bold#%{g:airline_symbols.linenr}%4l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__# :%3v'

" let g:airline_section_warning = ''

" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Put your non-Plugin stuff after this line


"""""""""""""
" Functions "
"""""""""""""

function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "NORMAL"
  elseif l:mode==?"v"
    return "VISUAL"
  elseif l:mode==#"i"
    return "INSERT"
  elseif l:mode==#"R"
    return "REPLACE"
  elseif l:mode==?"s"
    return "SELECT"
  elseif l:mode==#"t"
    return "TERMINAL"
  elseif l:mode==#"c"
    return "COMMAND"
  elseif l:mode==#"!"
    return "SHELL"
  endif
endfunction

" Map key to toggle option
" See https://vim.fandom.com/wiki/Quick_generic_option_toggling
function MapToggle(key, opt)
  let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
  exec 'nnoremap '.a:key.' '.cmd
  exec 'inoremap '.a:key." \<C-O>".cmd
endfunction
command -nargs=+ MapToggle call MapToggle(<f-args>)


""""""""""""
" Settings "
""""""""""""

""""""""""
" Buffer (File) Options
set hidden                     " Edit multiple unsaved files at the same time
set confirm                    " Prompt to save unsaved changes when exiting
" Keep various histories between edits
set viminfo='1000,f1,<500,:100,/100,h

" Search Options
set hlsearch                   " Highlight searches. See below for more.
set ignorecase                 " Do case insensitive matching...
set smartcase                  " ...except when using capital letters
set incsearch                  " Incremental search

" Insert (Edit) Options
set backspace=indent,eol,start " Better handling of backspace key
set autoindent                 " Sane indenting when filetype not recognised
set nostartofline              " Emulate typical editor navigation behaviour
set nopaste                    " Start in normal (non-paste) mode

" Status / Command Line Options
set wildmenu                   " Better commandline completion
set wildmode=longest:full,full " Expand match on first Tab complete
set showcmd                    " Show (partial) command in status line.
set laststatus=2               " Always show a status line
set cmdheight=1

" Interface Options
set number                     " Display line numbers at left of screen
set relativenumber
set visualbell                 " Flash the screen instead of beeping on errors
set t_vb=                      " And then disable even the flashing
set mouse=a                    " Enable mouse usage (all modes) in terminals
set ttimeoutlen=100
set textwidth=0
set colorcolumn=80             " set cc=72,80 to add git's 72 column
highlight ColorColumn ctermbg=LightYellow guibg=LightYellow ctermfg=Black guifg=Black

" Indentation Options
set expandtab
set copyindent
set preserveindent
set shiftwidth=4  " Indents will have a width of 4
set softtabstop=4 " Sets the number of columns for a TAB
set tabstop=4     " The width of a TAB is set to 4.
" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 4.
set smarttab

set scrolloff=11
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list
set directory=$HOME/.vim/swapfiles//

" Modelines are a security hazard
set nomodeline

" Yank to the clipboard registers, * and +
" See https://stackoverflow.com/a/30691754/68086
set clipboard^=unnamed,unnamedplus

" Default statusline
"\ set\ statusline=%f%h%m%r\ [%{&ff}]\ (%{strftime("%H:%M\ %d/%m/%Y",getftime(expand("%:p")))})%=%l,%c%V\ %P
set     statusline=%f%h%m%r\ \[%{strlen(&fenc)?&fenc:'none'}\]\ \[%{&ff}\]\ \[%{StatuslineMode()}\]\%=%l,%c%V\ %P

" Block cursor workaround for git-bash
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"


""""""""
" Maps "
""""""""

" <Leader>
let mapleader=' '

inoremap jk        <Esc>
nnoremap <Enter>   o<ESC>
" <C-Enter> O<ESC>
nnoremap  O<ESC>
" Shift-Enter doesn't work in CLI
" nnoremap <S-Enter> O<ESC>

" Repeat last macro with Alt-2
" nnoremap <A-2> @@
nnoremap 2 @@

" Buffer navigation like Firefox using Ctrl-Tab and Ctrl-Shift-Tab
" Does bufmru even work?
nnoremap [1;6I :BufMRUPrev<CR>
nnoremap [1;5I :BufMRUNext<CR>
inoremap [1;6I <Esc>:BufMRUPrev<CR>
inoremap [1;5I <Esc>:BufMRUNext<CR>

" Center cursor
nnoremap <C-L> zz
inoremap <C-L> <Esc>zz

" Show buffers and prompt for number
nnoremap <F2> :buffers<CR>:buffer<Space>

" Reload .vimrc
nnoremap <C-F5> :source ~/.vimrc<CR>

" Toggle spelling on/off
MapToggle <F6> spell

"" Paste the yank register (@0)
""    Ctrl-P
"nnoremap <C-P> "0p
"vnoremap <C-P> "0p
""    Ctrl-Shift-P
"nnoremap  "0P
"vnoremap  "0P

" F1 to be a context sensitive keyword-under-cursor lookup
nnoremap <F1> :help <C-R><C-W><CR>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
nnoremap Y y$

" Reflow paragraph
nnoremap <C-p> gqip

" VS Code-style comment/uncomment current line
" I guess <C-/> works now...
nnoremap <C-/> :TComment<CR>
vnoremap <C-/> :TComment<CR>
" " <C-/> is interpreted as <C-_>
" nnoremap <C-_> :TComment<CR>
" vnoremap <C-_> :TComment<CR>

" Map CTRL+S to save
" Set `stty -ixon` in bash to let CTRL+S through
noremap  <C-S>      :write<CR>
vnoremap <C-S> <C-C>:write<CR>
inoremap <C-S> <C-O>:write<CR>

nnoremap <C-A>      ggVG
inoremap <C-A> <ESC>ggVG
vnoremap <C-A> <ESC>ggVG

nnoremap <C-Q> :Bdelete<CR>
inoremap <C-Q> :Bdelete<CR>
vnoremap <C-Q> :Bdelete<CR>

map <Leader> <Plug>(easymotion-prefix)

" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
" map n  <Plug>(incsearch-nohl-n)
" map N  <Plug>(incsearch-nohl-N)
" map *  <Plug>(incsearch-nohl-*)
" map #  <Plug>(incsearch-nohl-#)
" map g* <Plug>(incsearch-nohl-g*)
" map g# <Plug>(incsearch-nohl-g#)


"""""""""""""""""
" Auto commands "
"""""""""""""""""
if has("autocmd")
    augroup filetype
        " Remove ALL autocommands for the current group.
        autocmd!

        autocmd BufEnter * :WatchForChanges!

        " Jump to last-known-position when editing files
        " Note: The | character is used in Vim as a command separator (like ; in C)
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup END

    augroup VIMRC_aliases
        au!
        au VimEnter * CmdAlias bd         Bdelete
        au VimEnter * CmdAlias bw         Bwipe
        au VimEnter * CmdAlias wbd        write|Bdelete
        au VimEnter * CmdAlias wbw        write|Bwipe
        au VimEnter * CmdAlias wqu\%[it]  write|quit
        au VimEnter * CmdAlias q          echo\ "Use\ :qu[it]\ instead\ of\ :q"
        au VimEnter * CmdAlias q!         echo\ "Use\ :qu[it]!\ instead\ of\ :q!"
        au VimEnter * CmdAlias wq         echo\ "Use\ :wqu[it]\ instead\ of\ :wq"
    augroup END

    " Make read-only files non-modifiable
    autocmd BufRead * let &l:modifiable = !&readonly

    " Check for updates to the file on entering insert mode
    autocmd InsertEnter * checktime

    " Highlight all occurrences of the word under the cursor using the
    " vim-interestingwords plugin
    autocmd CursorMoved * call UncolorAllWords()|call InterestingWords('n')
endif

"""""""
" End "
"""""""
