" Highly optimized .vimrc for Perl, C, Lua hacking
" 2009 - 2011 Magnus Woldrich < http://github.com/trapd00r/ >
set nocp

set autoread
set autochdir
set autoindent
set cmdheight=1
set cinoptions=:0,l1,t0,g0,(0
set colorcolumn=81
set cot+=menuone
set csprg=/usr/local/bin/cscope
set cst
set csto=0
set csverb
set cursorline
set display+=lastline,uhex
set expandtab
set foldmethod=manual
set gdefault
set grepprg=ack\ -a
set guioptions-=m
set guioptions-=T
set helpheight=150
set hidden
set history=50
set hlsearch
set ignorecase
set incsearch
set isfname+=:
set laststatus=2
set list
set listchars=tab:\-\ ,trail:-
set magic
set mat=2
set matchpairs+==:;
set matchpairs+=':'
set maxfuncdepth=1000
set nobackup
set nocsverb
set noequalalways
set noerrorbells
set noswapfile
set nowb
set nowrap
set relativenumber
set numberwidth=2
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set scrolloff=5
set shiftwidth=2
set shortmess=aIoOT
"set shortmess=atI
"set showcmd
set showmatch
set showmode
set smartcase
set smartindent
set smarttab
set splitbelow
set statusline=%<[%02n]\ %F%(\ %m%h%w%y%r%)\ %a%=\ %8l,%c%V/%L\ (%P)\ [%08O:%02B]
set tabpagemax=50
set tabstop=2
set t_Co=256
set tw=80
set title
set ttimeoutlen=50
set ttyfast
set undofile
set undolevels=512
set vb t_vb=
set vb
set wildchar=<Tab>
set wildmode=list:longest,full
set wildmode=longest,list
set wildignore=*.swp,*.bak,*.un~

syntax on

setlocal nospell spelllang=en_us

colorscheme neverland-ansi_bg

filetype plugin indent on

au BufRead,BufNewFile *.markdown set ft=md
au BufRead,BufNewFile *.md set ft=md

au BufWritePost *.{sh,pl} silent exe
autocmd! BufNewFile * silent! 0r ~/configs/vim/templates/template.%:e

au      FileType pl,pm,t set filetype=perl
au      FileType perl :noremap K :!perldoc <cword> <bar><bar> perldoc -f <cword><cr>
au!     FileType perl :noremap <leader>c
    \ :!time perl -Mwarnings::unused -MVi::QuickFix -c %<cr>

autocmd FileType perl setlocal errorformat=%f:%l:%m
autocmd FileType perl setlocal keywordprg=perldoc\ -f
"autocmd BufNewFile,BufRead *.p? compiler perl
"au BufWritePost *.pl,*.pm !perl -c %

"let g:indent_guides_auto = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234


hi CursorLine term=none cterm=none


let mapleader                    = ','
let g:tex_conceal                = 1

let perl_moose_stuff             = 1
let perl_no_scope_in_variables   = 1
let perl_no_sync_on_sub          = 1
let perl_no_sync_on_global_var   = 1
let perl_extended_vars           = 1
let perl_include_pod             = 1
let perl_string_as_statement     = 1
let perl_nofold_packages         = 1
let perl_sync_dist               = 1000
let perl_want_scope_in_variables = 1
let perl_pod_formatting          = 1
let perl_pod_spellcheck_headings = 1

cmap W w

map @ :s/^#//<CR><ESC>$
map <C-h> <C-w><Left> map <C-j> <C-w><Down> map <C-J> <C-W>j<C-W>_


map <C-K> <C-W>k<C-W>_
map <C-k> <C-w><Up>
map @ I#

nmap <silent>  ;s  :call ToggleSyntax()<CR>
nmap <silent> \sp :set syn=perl<CR>:syntax sync fromstart<CR>
nmap <Space> 10j

inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Up>   <NOP>

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <leader>n :bprevious<CR>
nnoremap <leader>p :bnext<CR>
nnoremap <leader>d :buffers<CR>:buffer<Space>
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>g :e#<CR>

nnoremap <Leader>1 :set ft=perl<CR>
nnoremap <Leader>2 :set ft=c<CR>
nnoremap <Leader>3 :set ft=lua<CR>
nnoremap <Leader>4 :set ft=sh<CR>
nnoremap <Leader>5 :set ft=config<CR>
nnoremap <Leader>6 :set ft=vim<CR>

nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

nnoremap <leader>a :bdelete!<CR> " force delete buffer ^

nnoremap ; :
nnoremap <leader>e iuse Data::Dumper;<CR>$Data::Dumper::Terse<TAB><TAB> = 1;<CR>$Data::Dumper::Indent<TAB><TAB> = 1;<CR>$Data::Dumper::Useqq<TAB><TAB> = 1;<CR>$Data::Dumper::Deparse<TAB> = 1;<CR>$Data::Dumper::Quotekeys = 0;<CR>$Data::Dumper::Sortkeys  = 1;<CR><CR><ESC>
nnoremap <leader>f :set paste<CR>i
nnoremap <leader>p i=pod<CR><CR>=head1 NAME<CR><CR>=head1 SYNOPSIS<CR><CR>=head1 DESCRIPTION<CR><CR>=head1 EXPORTS<CR><CR>None by default.<CR><CR>=head1 FUNCTIONS<CR><CR>=head1 AUTHOR<CR><CR><TAB>Magnus Woldrich<CR>CPAN ID: WOLDRICH<CR>magnus@trapd00r.se<CR>http://japh.se<CR><CR>=head1 CONTRIBUTORS<CR><CR>None required yet.<CR><CR>=head1 COPYRIGHT<CR><CR>Copyright 2011 B<THIS PROGRAM>s L</AUTHOR> and L</CONTRIBUTORS> as listed above.<CR><CR>=head1 LICENSE<CR><CR>This program is free software; you may redistribute it and/or modify it under the same terms as Perl itself.<CR><CR>=cut<CR><ESC>
nnoremap <leader>s :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>t :e /home/scp1/doc/TODO<CR>
nnoremap <leader>v V`]

nnoremap / /\v
vnoremap / /\v

nnoremap <silent> <C-l> :nohl<CR>

nmap     <silent> ,/    :nohl<CR>
nmap     <silent> ,,    :nohl<CR>

noremap <C-D>   <C-W>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
noremap <Up>    <NOP>

runtime macros/matchit.vim

ia dumper Dumper

cab ! new<CR>:r ! " Dump output from external cmd to new buffer

set formatprg=perl\ -MText::Autoformat\ -e'autoformat'
set formatoptions=qro

function! ToggleRelativeAbsoluteNumber()
  if &number
    set relativenumber
  else
    set number
  endif
endfunction
