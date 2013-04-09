% small LaTeX class for exercise papers

% Copyright (C) 2013  Yannick Runge and Konstantin Lübeck

% This program is free software; you can redistribute it and/or 
% modify it under the terms of the GNU General Public License as 
% published by the Free Software Foundation; either version 3 of 
% the License, or (at your option) any later version.

% This program is distributed in the hope that it will be useful, 
% but WITHOUT ANY WARRANTY; without even the implied warranty of 
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
% General Public License for more details.

% You should have received a copy of the GNU General Public License 
% along with this program; if not, see <http://www.gnu.org/licenses/>.


\LoadClass[12pt,oneside,a4paper,fleqn]{scrartcl}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uni_tue_template}

%%%%%%%%%%%%%%%%%%%%%%%%%%
% includes
%%%%%%%%%%%%%%%%%%%%%%%%%%

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

% for head- and footline
\usepackage{fancyhdr}

% line spacing
\usepackage[onehalfspacing]{setspace}

% provides \isempty test
\usepackage{ifthen}
\usepackage{xifthen}


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
	
	\newcommand
	{\exercise}[1]
	{
		{ \noindent \large  \bfseries \exerciseName 
			\ifthenelse{\isempty{#1}} 
			{ \refstepcounter{exNo}{\arabic{exNo}} }
			{ #1 }
			\\
		}
	}	
	
	% TODO subExercise: verschiedene Nummerierungen 1. 2. 3., I II III, a, b, c ...

% 1. Mathematic

	% 1.1 General Constructs
	
		% 1.1.1 Miscellanious
		
			% ADD SOMETHING HERE	
	
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