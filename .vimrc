"let g:solarized_termtrans = 1

let mapleader = ";"

set nocompatible
filetype off

"set rtp+=~/.vim/bundle/Vundle.vim

"call vundle#begin()

"Plugin 'VundleVim/Vundle.vim'

"Plugin 'zxqfl/tabnine-vim'

"Plugin 'Valloric/YouCompleteMe'

"call vundle#end()
filetype plugin indent on

"let g:solarized_use16 = 1

syntax on

set bg=dark

"colorscheme solarized8_high

filetype plugin on

set shiftwidth=4

set path=**

set softtabstop=4

set expandtab

set number relativenumber

set noswapfile

set hidden

set wildignore+=**/virtualenv_run/**,*.pyc,*.pyo,__pycache__

set mouse=a

let g:netrw_banner = 0

let g:netrw_liststyle=3

function MakeRow(c)
    let i = 1
    while i < a:c
        s/$/<++> \& /
        let i += 1
    endwhile
    s/$/<++> \\\\\r/
endfunction

function MakeGrid(c, r)
    s/$/ /
    let i = 0
    let ln = line('.')
    while i < a:r
        call MakeRow(a:c)
        let i += 1
    endwhile
    exec ln
endfunction

function MakeTexHeader()
    1,$d
    s/$/\\documentclass{<++>}\r\r\\usepackage{amsmath}\r\r\\title{<++>}\r\\author{Damien Watson}\r\\date{<++><++>}\r\r\\begin{document}\r\r\\maketitle\r\r<++>\r\r\\end{document}
endfunction

autocmd FileType tex,plaintext setlocal spell spelllang=en_us

autocmd FileType python setlocal breakindentopt=shift:4
autocmd FileType python setlocal si "set to smart indenting

autocmd BufWritePost,FileWritePost *.tex silent! execute "!pdflatex % >/dev/null 2>&1 && pdflatex % >/dev/null 2>&1 && pkill -HUP mupdf" | redraw!

inoremap <leader><leader> <Esc>/<++><Enter>"_c4l

autocmd FileType tex nnoremap <leader>s :call<Space>MakeTexHeader()<Enter>
autocmd FileType tex nnoremap <leader>d :s/<++>/\=strftime("%a %d %b %Y")/<Enter>
autocmd FileType tex inoremap <leader>d <Esc>:s/<++>/\=strftime("%a %d %b %Y")/<Enter>i

autocmd Filetype tex inoremap ,up <++><Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,list \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,number \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,item <Enter>\item<Space>
autocmd FileType tex inoremap ,bold \textbf{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,undli \underline{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,ital \textit{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,emph \emph{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,eqin $$<Space><++><Esc>T$hi
autocmd FileType tex inoremap ,eqd <Enter><Enter>\begin{equation}<Enter><Enter>\end{equation}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ,int \int\limits_^<++><Space><++><Space>\<Space><++><Esc>T_i
autocmd FileType tex inoremap ,sup ^{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,sub _{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,sum \sum_{}^{<++>}<Space><Esc>T{hT{i
autocmd FileType tex inoremap ,prod \prod_{}^{<++>}<Space><Esc>T{hT{i
autocmd FileType tex inoremap ,inf \infty
autocmd FileType tex inoremap ,ang \langle<Space><Space>\rangle<Space><++><Esc>T\hhi
autocmd FileType tex inoremap ,lbra \left(<Space>
autocmd FileType tex inoremap ,rbra \right)<Space>
autocmd FileType tex inoremap ,fram <Enter><Enter>\begin{frame}<Enter><Enter>\end{frame}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ,mat <Enter><Enter>\begin{bmatrix}<Enter><Enter>\end{bmatrix}<Enter><Enter><++><Esc>3k:echo<Space>'Remember<Space>to<Space>use<Space>amsmath<Space>LaTeX<Space>package'<Enter>A
autocmd FileType tex inoremap ,frac \frac{}{<++>}<Space><++><Esc>T{hT{i
autocmd FileType tex inoremap ,dots \cdots
autocmd FileType tex inoremap ,sin \sin()<++><Esc>T(i
autocmd FileType tex inoremap ,cos \cos()<++><Esc>T(i
autocmd FileType tex inoremap ,min \min()<++><Esc>T(i
autocmd FileType tex inoremap ,sih \sinh()<++><Esc>T(i
autocmd FileType tex inoremap ,coh \cosh()<++><Esc>T(i
autocmd FileType tex inoremap ,ln \ln()<++><Esc>T(i
autocmd FileType tex inoremap ,atan \arctan()<++><Esc>T(i
autocmd FileType tex inoremap ,cot \cot()<++><Esc>T(i
autocmd FileType tex inoremap ,det \det\left(<Space><Space>\right)<Space><++><Esc>T(li
autocmd FileType tex inoremap ,lim \lim()<++><Esc>T(i
autocmd FileType tex inoremap ,log \log()<++><Esc>T(i
autocmd FileType tex inoremap ,msec \sec()<++><Esc>T(i
autocmd FileType tex inoremap ,tan \tan()<++><Esc>T(i
autocmd FileType tex inoremap ,coh \coth()<++><Esc>T(i
autocmd FileType tex inoremap ,max \max()<++><Esc>T(i
autocmd FileType tex inoremap ,tah \tanh()<++><Esc>T(i
autocmd FileType tex inoremap ,arr \rightarrow<Space>
autocmd FileType tex inoremap ,pic <Enter><Enter>\begin{figure}<Enter>\includegraphics[width=\linewidth]{}<Enter>\caption{<++>}<Enter>\label{fig:<++>}<Enter>\end{figure}<Enter><Enter><++><Esc>5k$i
autocmd FileType tex inoremap ,lab <Space>\label{:<++>}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,ref <Space>\ref{:<++>}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,pref <Space>\pageref{:<++>}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,tab <Enter><Enter>\begin{tabular}{<Space><Bar>c<Bar><Bar>c<Bar>c<Bar><Space>}<Enter>\hline<Enter>\multicolumn{3<++>}{<Bar>c<Bar>}{<++>}\\<Enter>\hline<Enter><Space>&<Space>&<Space><++>\\<Enter>\hline<Enter><++><Enter>\hline<Enter>\end{tabular}<Enter><Enter><Esc>10k$hi
autocmd FileType tex inoremap ,fig <Enter><Enter>\begin{figure}<Enter><Enter><Enter><Enter>\end{figure}<Enter><Enter><++><Esc>4ki

autocmd FileType tex inoremap .a \alpha
autocmd FileType tex inoremap .A A
autocmd FileType tex inoremap .b \beta
autocmd FileType tex inoremap .g \gamma
autocmd FileType tex inoremap .G \Gamma
autocmd FileType tex inoremap .d \delta
autocmd FileType tex inoremap .D \Delta
autocmd FileType tex inoremap .e \epsilon
autocmd FileType tex inoremap .ve \varepsilon
autocmd FileType tex inoremap .E E
autocmd FileType tex inoremap .z \zeta
autocmd FileType tex inoremap .Z \Zeta
autocmd FileType tex inoremap .h \eta
autocmd FileType tex inoremap .H \H
autocmd FileType tex inoremap .vv \theta
autocmd FileType tex inoremap .vV \vartheta
autocmd FileType tex inoremap .V \Theta
autocmd FileType tex inoremap .i \iota
autocmd FileType tex inoremap .I I
autocmd FileType tex inoremap .k \kappa
autocmd FileType tex inoremap .K K
autocmd FileType tex inoremap .l \lambda
autocmd FileType tex inoremap .L \Lambda
autocmd FileType tex inoremap .m \mu
autocmd FileType tex inoremap .M M
autocmd FileType tex inoremap .n \nu
autocmd FileType tex inoremap .N N
autocmd FileType tex inoremap .b \beta
autocmd FileType tex inoremap .B B
autocmd FileType tex inoremap .x \xi
autocmd FileType tex inoremap .X \Xi
autocmd FileType tex inoremap .o o
autocmd FileType tex inoremap .O O
autocmd FileType tex inoremap .p \pi
autocmd FileType tex inoremap .P \Pi
autocmd FileType tex inoremap .r \rho
autocmd FileType tex inoremap .vr \varrho
autocmd FileType tex inoremap .R P
autocmd FileType tex inoremap .s \sigma
autocmd FileType tex inoremap .S \Sigma
autocmd FileType tex inoremap .t \tau
autocmd FileType tex inoremap .T T
autocmd FileType tex inoremap .u \upsilon
autocmd FileType tex inoremap .U \Upsilon
autocmd FileType tex inoremap .f \phi
autocmd FileType tex inoremap .vf \varphi
autocmd FileType tex inoremap .F \Phi
autocmd FileType tex inoremap .c \chi
autocmd FileType tex inoremap .C \Chi
autocmd FileType tex inoremap .y \psi
autocmd FileType tex inoremap .Y \Psi
autocmd FileType tex inoremap .w \omega
autocmd FileType tex inoremap .W \Omega

autocmd FileType tex inoremap %inf \infty
autocmd FileType tex inoremap %fa \forall
autocmd FileType tex inoremap %re \Re
autocmd FileType tex inoremap %im \Im
autocmd FileType tex inoremap %div \nabla
autocmd FileType tex inoremap %part \partial
autocmd FileType tex inoremap %qed \square
autocmd FileType tex inoremap %neq \neq
autocmd FileType tex inoremap %less \leq
autocmd FileType tex inoremap %great \geq
autocmd FileType tex inoremap %in \in
autocmd FileType tex inoremap %app \approx
autocmd FileType tex inoremap %per \perp


:set shell=/bin/bash

function! Osc52Yank()
	let buffer=system('base64 -w0', @0)
	let buffer='\ePtmux;\e\e]52;c;'.buffer.'\w07\e\\'
	silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape(g:tty)
endfunction

nnoremap <leader>y :call 0sc52Yank()<CR>

command W :execute 'silent w !sudo tee % > /dev/null' | :edit!
command Wq :execute 'silent w !sudo tee % > /dev/null' | :edit! | :q

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
