% small LaTeX class for exercise papers

% Copyright (C) 2013  Yannick Runge and Konstantin Lübeck

% This program is free software; you can redistribute it and/or 
% modify it under the terms of the GNU General Public License as 
% published by the Free Software Foundation; either version 3 of 
% the License, or (at your option) any later version.

% This program is distributed in the hope that it will be useful, 
% but WITHOUT ANY WARRANTY; without even the implied warranty of 
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
% General Public License

% You should have received a copy of the GNU General Public License 
% along with this program; if not, see <http://www.gnu.org/licenses/>.


% TODO
% + common code listing enviroment (style, colors, tabs)



\LoadClass[12pt,oneside,a4paper,fleqn]{scrartcl}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uni_tue_template}

%%%%%%%%%%%%%%%%%%%%%%%%%%
% includes
%%%%%%%%%%%%%%%%%%%%%%%%%%

% for multi- line frames
\usepackage{mdframed}

% better font placement
\usepackage{lmodern}

% page borders
\usepackage[left=2.5cm,right=2.5cm,top=1.5cm,bottom=2cm,includeheadfoot]{geometry}

% german spelling
\usepackage[ngerman]{babel}

% set input encoding
\usepackage[utf8]{inputenc}

% set font encoding
\usepackage[T1]{fontenc}

% Packages for math stuff
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
% For lighting symbol (contradiction)
\usepackage{wasysym}

% for head- and footline
\usepackage{fancyhdr}

% for graphics
\usepackage{tikz}
% for functions
\usepackage{pgfplots}

% for displaying colors
\usepackage{xcolor}

% for code
\usepackage{listings}

% line spacing
\usepackage[onehalfspacing]{setspace}

% provides fun with if conditions
\usepackage{ifthen}
\usepackage{xifthen}
\usepackage{etoolbox}

% math symbols
\usepackage{amssymb}

% cool stuff for enumerate
\usepackage{paralist}

% useful for tables
\usepackage{tabu}


%% MIPS Assembler language definition for the LaTeX listings package
%% mips.sty
%% Copyright 2009 Adam Wolfe Gordon <awg@xvx.ca>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Adam Wolfe Gordon <awg@xvx.ca>
%
% This work consists of the file mips.sty.

\lstdefinelanguage[mips]{Assembler}%
{morekeywords=[1]{abs,abs.d,abs.ps,abs.s,add,add.d,add.ps,add.s,addi,addiu,addu,alnv.ps,and,%
  andi,b,bal,bc1f,bc1fl,bc1t,bc1tl,bc2f,bc2fl,bc2t,bc2tl,beq,beql,beqz,bge,bgeu,bgez,%
  bgezal,bgezall,bgezl,bgt,bgtu,bgtz,bgtzl,ble,bleu,blez,blezl,blt,bltu,bltz,bltzal,%
  bltzall,bltzl,bne,bnel,bnez,break,c.eq.d,c.eq.ps,c.eq.s,c.f.d,c.f.ps,c.f.s,c.le.d,%
  c.le.ps,c.le.s,c.lt.d,c.lt.ps,c.lt.s,c.nge.d,c.nge.ps,c.nge.s,c.ngl.d,c.ngl.ps,%
  c.ngl.s,c.ngle.d,c.ngle.ps,c.ngle.s,c.ngt.d,c.ngt.ps,c.ngt.s,c.ole.d,c.ole.ps,c.ole.s,%
  c.olt.d,c.olt.ps,c.olt.s,c.seq.d,c.seq.ps,c.seq.s,c.sf.d,c.sf.ps,c.sf.s,c.ueq.d,c.ueq.ps,%
  c.ueq.s,c.ule.d,c.ule.ps,c.ule.s,c.ult.d,c.ult.ps,c.ult.s,c.un.d,c.un.ps,c.un.s,cache,%
  ceil.l.d,ceil.l.s,ceil.w.d,ceil.w.s,cfc0,cfc1,cfc2,clo,clz,cop2,ctc0,ctc1,ctc2,cvt.d.l,%
  cvt.d.s,cvt.d.w,cvt.l.d,cvt.l.s,cvt.ps.s,cvt.s.d,cvt.s.l,cvt.s.pl,cvt.s.pu,cvt.s.w,%
  cvt.w.d,cvt.w.s,deret,di,div,div.d,div.s,divu,ehb,ei,eret,ext,floor.l.d,floor.l.s,floor.w.d,%
  floor.w.s,ins,j,jal,jalr,jalr.hb,jr,jr.hb,l.d,l.s,la,lb,lbu,ld,ldc1,ldc2,ldxc1,lh,lhu,li,li.d,%
  li.s,ll,lui,luxc1,lw,lwc1,lwc2,lwl,lwr,lwxc1,madd,madd.d,madd.ps,madd.s,maddu,mfc0,mfc1,%
  mfc1.d,mfc2,mfhc1,mfhc2,mfhi,mflo,mov.d,mov.ps,mov.s,move,movf,movf.d,movf.ps,movf.s,movn,%
  movn.d,movn.ps,movn.s,movt,movt.d,movt.ps,movt.s,movz,movz.d,movz.ps,movz.s,msub,msub.d,msub.ps,%
  msub.s,msubu,mtc0,mtc1,mtc1.d,mtc2,mthc1,mthc2,mthi,mtlo,mul,mul.d,mul.ps,mul.s,mulo,%
  mulou,mult,multu,neg,neg.d,neg.ps,neg.s,negu,nmadd.d,nmadd.ps,nmadd.s,nmsub.d,nmsub.ps,%
  nmsub.s,nop,nor,not,or,ori,pll.ps,plu.ps,pref,prefx,pul.ps,puu.ps,rdhwr,rdpgpr,recip.d,%
  recip.s,rem,remu,rfe,rol,ror,rotr,rotrv,round.l.d,round.l.s,round.w.d,round.w.s,rsqrt.d,%
  rsqrt.s,s.d,s.s,sb,sc,sd,sdbbp,sdc1,sdc2,sdxc1,seb,seh,seq,sge,sgeu,sgt,sgtu,sh,sle,sleu,%
  sll,sllv,slt,slti,sltiu,sltu,sne,sqrt.d,sqrt.s,sra,srav,srl,srlv,ssnop,sub,sub.d,sub.ps,%
  sub.s,subu,suxc1,sw,swc1,swc2,swl,swr,swxc1,sync,synci,syscall,teq,teqi,tge,tgei,tgeiu,tgeu,%
  tlbp,tlbr,tlbwi,tlbwr,tlt,tlti,tltiu,tltu,tne,tnei,trunc.l.d,trunc.l.s,trunc.w.d,trunc.w.s,ulh,%
  ulhu,ulw,ush,usw,wrpgpr,wsbh,xor,xori},%
morekeywords=[2]{.alias,.align,.ascii,.asciiz,.asm0,.bgnb,.byte,.comm,.data,.double,.end,.endb,%
  .endr,.ent,.err,.extern,.file,.float,.fmask,.frame,.globl,.half,.kdata,.ktext,.lab,.lcomm,%
  .livereg,.loc,.mask,.noalias,.option,.rdata,.repeat,.sdata,.set,.space,.struct,.text,%
  .verstamp,.vreg,.word},%
comment=[l]\#%
}[keywords,comments,strings]


%%%%%%%%%%%%%%%%%%%%%%%%%%
% define some stuff
%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\build{5}

\def\credits{Yannick Runge \& Konstantin Lübeck}

% defining colors for code- style "eclipse"
\definecolor{comment}{RGB}{63,127,95}
\definecolor{string}{RGB}{42,0,255}
\definecolor{keyword}{RGB}{117,0,89}

% defining code- style "eclipse"
\lstdefinestyle{java}{%
	language=JAVA,%
	commentstyle=\color{comment},%
	stringstyle=\color{string},%
	keywordstyle=\color{keyword}\bfseries,%
	basicstyle=\ttfamily\footnotesize,%
	numbers=left,
	numberstyle=\tiny\color{black},
	stepnumber=1,
	showstringspaces=false,%
	columns=fixed,%
	moredelim=[is][\itshape]{@@}{@@},%
	tabsize=4
}

\lstdefinestyle{php}{%
	language=PHP,%
	commentstyle=\color{comment},%
	stringstyle=\color{string},%
	keywordstyle=\color{keyword}\bfseries,%
	basicstyle=\ttfamily\footnotesize,%
	numbers=left,
	numberstyle=\tiny\color{black},
	stepnumber=1,
	showstringspaces=false,%
	columns=fixed,%
	moredelim=[is][\itshape]{@@}{@@},%
	tabsize=4
}

\lstdefinestyle{cpp}{%
	language=C++,%
	commentstyle=\color{comment},%
	stringstyle=\color{string},%
	keywordstyle=\color{keyword}\bfseries,%
	basicstyle=\ttfamily\footnotesize,%
	numbers=left,
	numberstyle=\tiny\color{black},
	stepnumber=1,
	showstringspaces=false,%
	columns=fixed,%
	moredelim=[is][\itshape]{@@}{@@},%
	tabsize=4
}

\lstdefinestyle{x86asm}{
	language=[x86masm]Assembler,
	commentstyle=\color{comment},%
	stringstyle=\color{string},%
	keywordstyle=\color{keyword}\bfseries,%
	basicstyle=\ttfamily\footnotesize,%
	numbers=left,
	numberstyle=\tiny\color{black},
	stepnumber=1,
	showstringspaces=false,%
	columns=fixed,%
	moredelim=[is][\itshape]{@@}{@@},%
	tabsize=4
}

\lstdefinestyle{mipsasm}{
	language=[mips]Assembler,
	commentstyle=\color{comment},%
	stringstyle=\color{string},%
	keywordstyle=\color{keyword}\bfseries,%
	basicstyle=\ttfamily\footnotesize,%
	numbers=left,
	numberstyle=\tiny\color{black},
	stepnumber=1,
	showstringspaces=false,%
	columns=fixed,%
	moredelim=[is][\itshape]{@@}{@@},%
	tabsize=4
}

% set global parameters for pgfplot
\pgfplotsset{
%
	ejes/.style args={#1:#2 #3:#4}{
%
        domain=#1:#2,% Bereich, in dem die Funktionen dargestellt werden
%
        samples=100,% Anzahl aller Plot- Punkte pro Längeneinheit
%
				xlabel=$\scriptstyle x$,% x- Achsenbschriftung
				ylabel=$\scriptstyle f(x)$,% y- Achsenbschriftung
%
        xmin=#1,
        xmax=#2,
%
				ymin=#3,
				ymax=#4,
%
        xtick={#1,...,#2},% Intervall der x- Achsenbeschriftungen
        ytick={#3,...,#4},% Intervall der y- Achsenbeschriftungen
%
        restrict y to domain=#3:#4,% falls die Funktinon gegen +/- unendlich geht
%
        axis lines=middle,% Zeichne ein karthesisches Koordinatensystem
%
        tick label style={font=\tiny},% Setze Stil der Achsenbeschriftung
%
        smooth,% Kantenglättung von Funktionen
%
				axis plot post/.style={% Standard- Werte für Graphen
					black,% schwarz
					mark=none,% keine Punkte entlang der Kurve
					smooth% Kantenglättung
				},
%
				width=8cm,% Breite der Grafik
				height=8cm,% Höhe der Grafik
%
	}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%
% set some typo stuff
%%%%%%%%%%%%%%%%%%%%%%%%%%

\pagestyle{fancy}								
\headheight 24pt

% paragraph indent
\parindent0mm

% paragraph space
\parskip4mm

% head and foot rule
\renewcommand
{\headrulewidth}
{0.4pt}

\renewcommand
{\footrulewidth}
{0.4pt}

% left head area
\lhead{\headLeft}

% center head area
\chead{\names}

% left head area
\rhead{\headRight}

% left foot area
\lfoot{\footLeft}	

% center foot area
\cfoot{Seite \thepage}

% right foot area
\rfoot{\footRight}

% line separation within tabu
\tabulinesep=2mm

%%%%%%%%%%%%%%%%%%%%%%%%%%
% counters
%%%%%%%%%%%%%%%%%%%%%%%%%%

% counter for exercises
\newcounter{no}
\setcounter{no}{1}
\newcounter{exNo}[no]


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Own commands
%%%%%%%%%%%%%%%%%%%%%%%%%%

% 0. Miscellanious

	% Commands for placing head and foot parts.
	% If you like to adjust these, do so by
	% overwriting it via (for example)
	% \renewcommand{\headLeft}{my stuff}
	\newcommand
	{\headLeft}
	{}
	
	\newcommand
	{\names}
	{}
	
	\newcommand
	{\headRight}
	{}
	
	\newcommand
	{\footLeft}
	{}
	
	\newcommand
	{\footRight}
	{}
	
	% Refer to this parameter if you want to change the
	% standard exercise name
	\newcommand
	{\exerciseName}
	{Aufgabe}	
	
	% Do not begin a new paragraph after you used \exercise. Because the "\\" is
	% directly implemented in the command it would otherwise cause an overfull hbox.
	\newcommand
	{\exercise}[1]
	{
		{ \noindent \large  \bfseries \exerciseName
			\ifthenelse{\isempty{#1}} 
			{\ \refstepcounter{exNo}{\arabic{exNo}}}
			{\ #1}
			\vspace{5mm}
		}
	}	
	
	\newcommand
	{\subExBegin}[1]
	{
		\vspace{-4mm}
		\ifthenelse{\isempty{#1}}
		{\begin{enumerate}}
		{\begin{enumerate}[#1]}		
		\itemsep-3mm 
	}
	
	\newcommand
	{\subExEnd}
	{\end{enumerate}}
	
	% Table structure
	% Usage:
	% \begin{tabu}
	% \tableHead{1stColumn&2ndColumn&3rdColumn}
	% It's & Hammer & Time\\
	% \end{tabu}
	\renewenvironment
	{table}[1]
	{
		\begin{tabu}{#1}
		\tabucline[1pt]{-}}
	{
		\\ \tabucline[1pt]{-}
		\end{tabu}
	}	
	
	\newcommand
	{\tableHead}[1]
	{#1 \\ \hline}

	% German quotation marks
	% @param 1: Contents between quotation marks
	\newcommand
	{\gqm}[1]
	{\glqq #1\grqq}
	
	% For correcting exercises
	% @param 1:	If empty, correction text (nearly) whole textwidth.
	% 						Else, enter something between 0 and 1 (default 0.95)
	% @param 2:	If empty, no box around correction text.
	%						Else, enter "frame" and box is drawn
	% @param 3:	Contents of the correction
	\newcommand
	{\correction}[3]
	{
		\ifthenelse{\boolean{correctionON}}{
			\ifthenelse{\isempty{#1}} {
				\def\boxwidth{.95}
			} {
				\def\boxwidth{#1}
			}
			
			\ifthenelse{\equal{frame}{#2}} {
				\textcolor{red}{\fbox{\parbox{\boxwidth\textwidth}{#3}}}		
			} {
				\textcolor{red}{\parbox{\boxwidth\textwidth}{#3}}
			}
		} {
			%If disabled, do nothing
		}	
	}
	
	% \coril stands for correction inline - Use this if you want
	% to get red inline correction text
	\newcommand
	{\coril}[1]
	{\ifthenelse{\boolean{correctionON}}{\textcolor{red}{#1}}{\hspace{-3pt}}}
	
	% Switch for correction command. If enabled, corrections are shown,
	% if not, they're (obviously) not
	\newboolean{correctionON}
	\setboolean{correctionON}{true}
	
	% For switching correction value
	\newcommand
	{\CON}
	{\setboolean{correctionON}{true}}
	
	\newcommand
	{\COFF}
	{\setboolean{correctionON}{false}}
	
	% For drawing functions
	\newenvironment
	{function}[1]
	{%
	\begin{tikzpicture}
		\ifthenelse{\isempty{#1}}{
			\begin{axis}[ejes=-4:4 -4:4]
		} {
			\begin{axis}[#1]
		}
	}%
	{%
		\end{axis}
	\end{tikzpicture}
	}
	
	% Little wrapper for drawing a function in the "function"- environment
	\newcommand{
	\drawfunction}[1]
	{\addplot[]{#1};}
	
% 1. Mathematic

	% 1.1 General Constructs
	
		% 1.1.1 Miscellanious / Stuff that turned out to be useful			
			
			% Standard limes to infinity
			%@param 1: Variable
			\renewcommand
			{\liminf}[1]
			{\limlim{#1\rightarrow\infty}}
			
			% Standart sum to infinity
			\newcommand
			{\suminf}[1]
			{\limsum{#1}{\infty}}
	
		% 1.1.2 Left- Right- Bracket- Constructs
		
			% round bracket
			\newcommand
			{\lrr}[1]
			{\left(#1\right)}
			
			% angled bracket
			\newcommand
			{\lra}[1]
			{\left[#1\right]}
			
			% cambered bracket
			\newcommand
			{\lrc}[1]
			{\left\{#1\right\}}
			
			% absolute value
			\newcommand
			{\lrabs}[1]
			{\left|#1\right|}
			
			% floor
			\newcommand
			{\floor}[1]
			{\left\lfloor#1\right\rfloor}
			
			% ceiling
			\newcommand
			{\ceiling}[1]
			{\left\lceil#1\right\rceil}
			
		% 1.1.3 All- und Existenzaussagen
			
			% Allquantor
			% \forall
			
			% Existenzquantor
			% \exists
			
		% 1.1.4 Constructs containing "\limits" command
		
		% Sum with limits
		% @param 1: Index below the sum
		% @param 2: index above the sum
		\newcommand
		{\limsum}[2]
		{\sum\limits_{#1}^{#2}}
		
		% Product with limits
		% @param 1: Index below the product
		% @param 2: index above the proudct
		\newcommand
		{\limprod}[2]
		{\prod\limits_{#1}^{#2}}
		
		% Integral witch limits
		% @param 1: Index below the integral
		% @param 2: index above the integral
		\newcommand
		{\limint}[2]
		{\displaystyle\int\limits_{#1}^{#2}}
		
		% Limes with limits
		%@param 1: What's under the limes
		\newcommand
		{\limlim}[1]
		{\lim\limits_{#1}}
		
		
	% 1.2 Logische Junktoren
		
		% und- Junktor
		\renewcommand
		{\land}
		{\wedge}
		
		% oder- Junktor
		\renewcommand
		{\lor}
		{\vee}
		
		% nicht- Junktor
		\renewcommand
		{\lnot}
		{\neg}
		
		% exclusive- Or (XOR)- Junktor
		\newcommand
		{\lxor}
		{\oplus}

	% 1.3 Mengenlehre
		
		% 1.3.1 Spezielle Mengen
		
			% natürliche Zahlen
			\newcommand
			{\mn}
			{\mathbb{N}}
	
			% reelle Zahlen
			\newcommand
			{\mr}
			{\mathbb{R}}
			
			% ganze Zahlen
			\newcommand
			{\mz}
			{\mathbb{Z}}
			
			% rationale Zahlen
			\newcommand
			{\mq}
			{\mathbb{Q}}
			
			% komplexe Zahlen
			\newcommand
			{\mc}
			{\mathbb{C}}
			
			% Lösungsmenge
			\newcommand
			{\ml}
			{\mathbb{L}}
			
			% leere Menge
			\newcommand
			{\mvoid}
			{\emptyset}
			
			% Potenzmenge
			\newcommand
			{\mpz}
			{\mathcal{P}}
			
		% 1.3.2 Verknüfungsglieder von Mengen
		
			% Vereinigung
			\newcommand
			{\mor}
			{\cup}
		
			% Schnitt
			\newcommand
			{\mand}
			{\cap}
			
			% symmetrische Differenz
			\newcommand
			{\mnand}
			{\bigtriangleup}
			
			% Differenzmenge
			\newcommand
			{\mnot}
			{\setminus}
			
			% Komplement
			\newcommand
			{\mcp}
			{^\complement}
			
			% Teilmenge ("part of")
			\newcommand
			{\mpo}
			{\subseteq}	
			
			% "Summe" aller Vereinigungen
			% @param 1: Was unter dem Operator steht
			% @param 2: Was über dem Operator steht
			\newcommand
			{\morsum}[2]
			{\bigcup\limits_{#1}^{#2}}
			
			% "Summe" aller Schnitte
			% @param 1: Was unter dem Operator steht
			% @param 2: Was über dem Operator steht
			\newcommand
			{\mandsum}[2]
			{\bigcap\limits_{#1}^{#2}}
			
			% Karthesisches Produkt
			\newcommand
			{\mkth}[2]
			{\prod\limits_{#1}^{#2}}
	
	% 1.4 Abbildungen
	
		% Hintereinanderabbildung
		% \circ

		% ...
	% 1.5 Analysis
		
			% Grad einer Funktion
			\newcommand
			{\grad}
			{\mathrm{grad}}
			
			% Umkehrfunktion
			\newcommand
			{\ifu}[1]
			{#1^{-1}}
			
			% Diff.quotient
			\renewcommand
			{\dq}[1]
			{\frac{\mbox{d}}{\mbox{d}#1}}
			
			% differenzierbar
			\newcommand
			{\diffbar}
			{differenzierbar\;}
			
			%dx
			\newcommand
			{\intd}[1]
			{\;\mathrm{d}#1}
