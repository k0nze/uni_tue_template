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


\LoadClass[12pt,oneside,a4paper]{article}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uni_tue_template}

% page borders
\usepackage[left=2.5cm,right=2.5cm,top=1.5cm,bottom=2cm,includeheadfoot]{geometry}

\usepackage[ngerman]{babel}
\usepackage[utf8]{inputenc}
\usepackage{fancyhdr}
\usepackage{setspace}

% line spacing	
\onehalfspacing	

\pagestyle{fancy}								
\headheight 24pt

% head and foot rule
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

% left head area
\lhead{\headLeft}

% center head area
\chead{\names}

% left head area
\rhead{\headRight}


% left foot area
\lfoot{}	

% center foot area
\cfoot{Seite \thepage}

% right foot area
\rfoot{}