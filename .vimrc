execute pathogen#infect()
set nocompatible
set mouse=a
syntax on
syntax enable
set background=dark
colorscheme solarized8_low
" let g:solarized_termcolors=256
filetype plugin indent on

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" spellcheck
" navigate: next: ]s   prev:[s  add-word: zg  suggestion: z=
set spelllang=en
set spellfile=~/.dotz/vim/spell.en.utf-8.add
set spell

" Display all matching files when we tab complete
set wildmenu

:set tags=~/.tags/tags
:set ic

map ; :execute "vimgrep/" . expand("<cword>") . "/j `cat ~/.tags/index`" <Bar> cw<CR>
:command -nargs=1 Sgrep :execute "vimgrep /" . expand("<args>") . "/j `cat ~/.tags/index`" | copen
:command -nargs=0 T :execute "tabnew ~/.tags/index"

" rust ctags
" cargo install rusty-tags
" run: rusty-tags vi
" export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/ #put
"    bashrc
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
" autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" other <leader> is \
" run q current file
autocmd FileType q nnoremap  <leader>rq   :!q % -p 5001<CR>
" compile c source to object name with the same name, no extension (:r)
autocmd FileType c nnoremap  <leader>rc   :!gcc -g % -o %:r<CR>


