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

% for head- and footline
\usepackage{fancyhdr}

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



%%%%%%%%%%%%%%%%%%%%%%%%%%
% define some stuff
%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\build{1}

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
	basicstyle=\ttfamily\small,%
	numbers=left,
	numberstyle=\tiny\color{black},
	stepnumber=1,
	showstringspaces=false,%
	columns=flexible,%
	moredelim=[is][\itshape]{@@}{@@}
}

\lstdefinestyle{php}{%
	language=PHP,%
	commentstyle=\color{comment},%
	stringstyle=\color{string},%
	keywordstyle=\color{keyword}\bfseries,%
	basicstyle=\ttfamily\small,%
	numbers=left,
	numberstyle=\tiny\color{black},
	stepnumber=1,
	showstringspaces=false,%
	columns=flexible,%
	moredelim=[is][\itshape]{@@}{@@}
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
	
	% Switch for correction command. If enabled, corrections are shown,
	% if not, they're (obviously) not
	\newboolean{correctionON}
	\setboolean{correctionON}{true}
	
	% For switching correction value
	\newcommand{\CON}{\setboolean{correctionON}{true}}
	\newcommand{\COFF}{\setboolean{correctionON}{false}}
	
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