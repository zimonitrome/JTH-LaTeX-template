\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{JTH}[2017/10/03 JU-JTH LaTeX class]

% Build on existing report class
\LoadClass[11pt, a4paper]{report}

% --- Package loading starts ---
% Core LaTeX features
\RequirePackage{hyperref}
\RequirePackage{graphicx}
\graphicspath{{images/}}

% Colors for front page
\RequirePackage{xcolor}
\RequirePackage{pagecolor}

% Fonts for headers and body
\RequirePackage{helvet}
\RequirePackage{mathptmx}

% Various styling and spacing
\RequirePackage{setspace}
\RequirePackage{sectsty}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
% --- Package loading ends ---

% Define a macro for the subtitle
\newcommand*{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand*{\@subtitle}{}%

% Various color, font, and indentation
\definecolor{jublue}{RGB}{0.0, 56, 101}
\allsectionsfont{\sffamily}
\setlength{\parindent}{0em}
\setlength{\parskip}{1em}

% Configure footer (i.e., page number) style
\fancypagestyle{plain}{%
\fancyhf{} % clear all header and footer fields
\fancyfoot[C]{\sffamily\fontsize{10pt}{10pt}\selectfont\thepage} % except the center
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}}
\pagestyle{plain}

% --- Start of fancy title page command ---
\renewcommand{\maketitle}{%
	% Reconfigure front page colors, geometries, etc.
	\thispagestyle{empty}
	\newgeometry{left=2cm,top=2cm, right=7cm}
	\newpagecolor{jublue}
	\color{white}
	\sffamily

	% Logo, nice spacing, title, subtitle, author..
	\includegraphics[width=70mm]{JTH-logo.pdf}\par
	\vspace{4 cm}
	\setstretch{1.1}
	\Huge\textbf{\@title}\par
	\huge \@subtitle\par
	\vspace{1 cm}
	\Large\textbf{\@author}

	% Restore default settings for the rest of the document
	\color{black}
	\normalsize
	\rmfamily
	\newpage
	\restoregeometry
	\restorepagecolor

	% And finally, set the nice spacing again
	\setstretch{1.2}
}
% --- End of fancy title page command ---
