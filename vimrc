
" functions
" ==========

function! GU_clearRemaps()
	mapclear
	imapclear
	nmapclear
	xmapclear
	vmapclear
endfunction
call GU_clearRemaps()

function! GU_tabIndent(size)
	let &tabstop = a:size
	let &softtabstop = 0
	let &shiftwidth = a:size
	set noexpandtab
endfunction
function! GU_spaceIndent(size)
	let &tabstop = a:size + a:size / 2
	let &softtabstop = 0
	set expandtab smarttab
	let &shiftwidth = a:size
endfunction

function! GU_noUnderline()
	set cursorline
	hi CursorLine cterm=NONE
	hi CursorLineNr cterm=NONE
endfunction


" display
" ==========

call GU_tabIndent(4)

set number relativenumber
let g:netrw_bufsettings='noma nomod number relativenumber' " line numbers in explorer

function! GU_lcs()
	set lcs=tab::\ 

	" set lcs+=space:-
	set lcs+=nbsp:+
	" set lcs+=multispace:
	set lcs+=trail:&

	"set showbreak:~>
	set showbreak:
	set lcs+=extends:~
	set lcs+=precedes:~

	" set lcs+=eol:`

	set lcs+=conceal:@
endfunction
call GU_lcs()
set list
set breakindent

syntax on
set termguicolors
silent! colo industry
silent! colo darkblue
silent! colo slate
silent! colo habamax
silent! colo sorbet
silent! colo retrobox
"also like: wildcharm, zaibatsu, quiet
call GU_noUnderline()


" behavior
" ==========

set backupdir=~/.vim_backups
set directory=~/.vim_backups

set autoindent

set belloff=all
"set mouse-=a " disable mouse

set notimeout nottimeout " leader-keys wont time out for remaps


" remaps
" ==========

" normal
" ----------

nnoremap - <Nop>

nnoremap -<c-p> :r ~/.vim_clipboard.txt<enter>
nmap -<c-y> V-<c-y>

nnoremap -:s :source ~/.vimrc<enter>
nnoremap -:<space> :call GU_spaceIndent(4)<enter>
nnoremap -:<tab> :call GU_tabIndent(4)<enter>
nnoremap -:4<tab> :call GU_tabIndent(4)<enter>
nnoremap -:8<tab> :call GU_tabIndent(8)<enter>
nnoremap -:cc :set colorcolumn=80<enter>
nnoremap -:cc0 :set colorcolumn=0<enter>
nnoremap -:cc80 :set colorcolumn=80<enter>

nnoremap -<tab>0n /^[^ \t]<enter>
nnoremap -<tab>0N ?^[^ \t]<enter>
nnoremap -<tab>n _v0"sy/^<c-r>s<backspace>[^ \t]<enter>
nnoremap -<tab>N _v0"sy?^<c-r>s<backspace>[^ \t]<enter>


nnoremap -ce _cW,ea =j0
	" define to enum
nnoremap -cf _"sy/(<enter>j/\C<c-r>s<enter>
nnoremap -cgg gg/^[^#]<enter>


" chessmap utilities
nnoremap -hh :e rnbqkbnr_pppppppp_--------_--------_--------_--------_PPPPPPPP_RNBQKBNR_w.md<enter>
nmap -hB ornbqkbnr_pppppppp_--------_--------_--------_--------_PPPPPPPP_RNBQKBNR_w.md<c-c>-hTn
nnoremap -hd }{y}}Po<c-c>
nmap -hb o<c-r>%<c-c>-hTn
nmap -hl -htNk0wi[<c-c>A](<c-c>gJA)<c-c>
nmap -hA -hbdd-hd-htfyyp-ht_lkI[<c-c>A](<c-c>gJA)<c-c>"wddo> <c-c>mvo<enter>* <enter><enter><br><c-c>"wpo<enter>---<enter><c-c>`v
nmap -hml -hd-htfyyp-ht_lkI[<c-c>A](<c-c>gJA)<c-c>"wdd}}o<enter><br><c-c>"wp

nnoremap -ht_f1 :s/11111111/8/ge<enter>:s/1111111/7/ge<enter>:s/111111/6/ge<enter>:s/11111/5/ge<enter>:s/1111/4/ge<enter>:s/111/3/ge<enter>:s/11/2/ge<enter>
nnoremap -ht_l Ihttps://lichess.org/analysis/fromPosition/<c-c>:s/ /_/ge<enter>

nmap -htf }{JJr/Jr/Jr/Jr/Jr/Jr/Jr/:s/\s//g<enter>:s/\./1/g<enter>j0f(l"wx:s/\([a-h]\)/\1<c-r>w/e<enter>:s/w/6/e<enter>:s/\([a-h]\)b/\13/e<enter>:s/()/(-)/e<enter>0df(f)x0"wPa KQkq <c-c>kJJ-ht_f1
nnoremap -htn }{JJr_Jr_Jr_Jr_Jr_Jr_Jr_j0f(xf)xkJr_J:s/\s//ge<enter>:s/\./-/ge<enter>
nnoremap -htN }{JJr_Jr_Jr_Jr_Jr_Jr_Jr_j:s/w/C/e<enter>:s/b/w/e<enter>:s/C/b/e<enter>0f(xf)xkJr_J:s/\s//ge<enter>:s/\./-/ge<enter>
nmap -htl -htf-ht_l

nnoremap -hT_r _a <esc>la <esc>la <esc>la <esc>la <esc>la <esc>la <esc>la<enter><esc>
nmap -hT_b O<esc>j-hT_r-hT_r-hT_r-hT_r-hT_r-hT_r-hT_r-hT_rddp{

nmap -hTf I<tab><c-c>$? [wb] <enter>r<enter>:s/[0-9 -KQkq]//ge<enter>I(<c-c>A)<c-c>k :s/1/./ge<enter>:s/2/../ge<enter>:s/3/.../ge<enter>:s/4/..../ge<enter>:s/5/...../ge<enter>:s/6/....../ge<enter>:s/7/......./ge<enter>:s/8/......../ge<enter>:s/\///ge<enter>-hT_b
nmap -hTn I<tab><c-c>$F.d$F_r<enter>I(<c-c>A)<c-c>k:s/-/./ge<enter>:s/_//ge<enter>-hT_b

nnoremap -i1 miyygg/INDEX<enter>}zzPI* <esc>
nnoremap -i2 miyygg/INDEX<enter>}zzPI  * <esc>
nnoremap -i3 miyygg/INDEX<enter>}zzPI    * <esc>
nnoremap -i4 miyygg/INDEX<enter>}zzPI      * <esc>
nnoremap -i5 miyygg/INDEX<enter>}zzPI        * <esc>
nnoremap -i6 miyygg/INDEX<enter>}zzPI          * <esc>

nnoremap -ib `izz
nnoremap -ig _miw"sy$/<c-r>s$<enter>ztkj
nnoremap -ih 0xx
nnoremap -ii migg/INDEX<enter>ztkj
nnoremap -il I  

nmap -ir1 -i1`i
nmap -ir2 -i2`i
nmap -ir3 -i3`i
nmap -ir4 -i4`i
nmap -ir5 -i5`i
nmap -ir6 -i6`i

nmap -iu11 -i1dd1kP
nmap -iu21 -i2dd1kP
nmap -iu31 -i3dd1kP
nmap -iu41 -i4dd1kP
nmap -iu51 -i5dd1kP
nmap -iu61 -i6dd1kP

nmap -iu12 -i1dd2kP
nmap -iu22 -i2dd2kP
nmap -iu32 -i3dd2kP
nmap -iu42 -i4dd2kP
nmap -iu52 -i5dd2kP
nmap -iu62 -i6dd2kP


nnoremap -mi1 mi_wy$gg/INDEX<enter>}zzPI* <esc>o<esc>
nnoremap -mi2 mi_wy$gg/INDEX<enter>}zzPI  * <esc>o<esc>
nnoremap -mi3 mi_wy$gg/INDEX<enter>}zzPI    * <esc>o<esc>
nnoremap -mi4 mi_wy$gg/INDEX<enter>}zzPI      * <esc>o<esc>
nnoremap -mi5 mi_wy$gg/INDEX<enter>}zzPI        * <esc>o<esc>
nnoremap -mi6 mi_wy$gg/INDEX<enter>}zzPI          * <esc>o<esc>

nnoremap -mig 0"syi[/<c-r>s$<enter>ztkj
nnoremap -mil _W"wy$i[<esc>A]<esc>o<esc>0D"wpVu:silent! s/[^a-z ]//g<enter>:silent! s/ /-/g<enter>0"wy$ddkA(#<c-r>w)<esc>

nmap -mir1 -mi1`i
nmap -mir2 -mi2`i
nmap -mir3 -mi3`i
nmap -mir4 -mi4`i
nmap -mir5 -mi5`i
nmap -mir6 -mi6`i

nnoremap -mix I<br><enter><enter><!-- INDEX --><enter><enter><br><enter><esc>

nnoremap -mlg mB%lF[f]"wyi(:e <c-r>w.md<enter><enter>
nnoremap -mlG mB%lF[f]"wyi(:tabe <c-r>w.md<enter><enter>


nnoremap -t, f,lr<enter>
nnoremap -ts { V}<backspace>:sort<enter>


" visual
" ----------

vnoremap -<c-y> :w! ~/.vim_clipboard.txt<enter>

