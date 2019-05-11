\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resources/JTH}[2019/04/12 JU-JTH LaTeX class]

% Build on existing report class
\LoadClass[12pt, a4paper]{article}

% --- Package loading starts ---
% Core LaTeX features
\RequirePackage{hyperref}
\RequirePackage{graphicx}
\RequirePackage[utf8]{inputenc}

% Colors
\RequirePackage{xcolor}

% Fonts
\RequirePackage{helvet}
\RequirePackage{mathptmx}

% Various styling and spacing
\RequirePackage{setspace}
\RequirePackage{sectsty}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{tabularx}
\RequirePackage{multicol}
\RequirePackage[natbibapa]{apacite}
\RequirePackage{caption}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage[toc,page]{appendix}
\RequirePackage{datetime}
\RequirePackage{natbib}

% --- Package loading ends ---

% Define a macro for the shorter title
\newcommand*{\shorttitle}[1]{\gdef\@shorttitle{#1}}
\newcommand*{\@shorttitle}{}%

% Define a macro for the subtitle
\newcommand*{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand*{\@subtitle}{}%

% Define a macro for the subject
\newcommand*{\subject}[1]{\gdef\@subject{#1}}
\newcommand*{\@subject}{}%

% Define a macro for the supervisor
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand*{\@supervisor}{}%

% Define a macro for the examiner
\newcommand*{\examiner}[1]{\gdef\@examiner{#1}}
\newcommand*{\@examiner}{}%

% Define a macro for the credits
\newcommand*{\credits}[1]{\gdef\@credits{#1}}
\newcommand*{\@credits}{}%

% Define a macro for the programme
\newcommand*{\programme}[1]{\gdef\@programme{#1}}
\newcommand*{\@programme}{}%

% various font, and indentation
\setlength{\parindent}{0em} % First row indentation
\setlength{\parskip}{1em} % Table of content spacing

% Define footer for 2nd page
\fancypagestyle{alim}{
    \fancyhf{}
    \renewcommand{\footrulewidth}{0.4pt}
    \fancyfoot[C]{
        \fontsize{11pt}{11pt}\selectfont
        \begin{tabularx}{\linewidth}{@{}XXr@{}}
             Mailing address: & Visiting address: & \multicolumn{1}{l}{Phone:} \\
             Box 1026 & Gjuterigatan 5 & 036-10 10 00 (vx) \\
             551 11 Jönköping &  &  \\
        \end{tabularx}
    }
}

% Define commands for custom date printing
\newdateformat{monthyeardate}{%
    \monthname[\THEMONTH] \THEYEAR}
\newdateformat{yyyymmdd}{\THEYEAR-\twodigit{\THEMONTH}-\twodigit{\THEDAY}}

% Define font span
\newenvironment{blackFont}{\fontfamily{ugq}\selectfont}{\par}
\DeclareTextFontCommand{\textBlackFont}{\blackFont}

% --- Start of fancy title page command ---
\renewcommand{\maketitle}{
    % First page
	% Reconfigure front page colors, geometries, etc.
	\thispagestyle{empty}
	\newgeometry{left=3.5cm, top=2.5cm, right=5cm, bottom=4cm}
	\sffamily
	
	% Logo
	\textcolor{black}{\includegraphics[width=50mm]{JTH-logo}}\par
	\vspace{4 cm}
	\setstretch{1.2}
	
	% Title
	\fontsize{40pt}{40pt}\selectfont
	\textbf{\@title}\par
	
	% Subtitle
	\vspace{0.5 cm}
	\fontsize{16pt}{16pt}\selectfont
    \@subtitle\par
    
    % Area, author(s), tutor etc.
    \vspace*{\fill}
    \rmfamily
	\begin{spacing}{0.7}
    	\fontsize{8pt}{8pt}
	    \textBlackFont{PAPER WITHIN} \textit{\@subject}
        \\{\textBlackFont{AUTHORS:} \textit{\@author}}
        \\{\textBlackFont{TUTOR:} \textit{\@supervisor}}
        \\{\textBlackFont{JÖNKÖPING} \textit{\monthyeardate\today}}
	\end{spacing}
	
	% Second page
	\newpage
	\thispagestyle{alim}
    \restoregeometry
	\newgeometry{bottom=3.5cm}
	\vspace*{\fill}
    \newcommand\tab[1][1cm]{\hspace*{##1}}
	\fontsize{10pt}{10pt}\selectfont
    This exam work has been carried out at the School of Engineering in Jönköping in the subject area \@subject. The work is a part of the \@programme\space programme. The authors take full responsibility for opinions, conclusions and findings presented.\\
    \begin{tabularx}{\linewidth}{@{}p{2.6cm}l@{}}
         Examiner: & \@examiner \\
         Supervisor: & \@supervisor \\
         Scope: & \@credits\space credits \\
         Date: & \yyyymmdd\today \\ 
    \end{tabularx}
	
	\vspace{1cm}

	% Restore default settings for the rest of the document
	\color{black}
	\normalsize
	\newpage
	
	% And finally, set the nice spacing again
	\setstretch{1.2}
}
% --- End of fancy title page command ---

% Changes DOI to https format
\renewcommand{\doiprefix}{}
\newcommand{\doi}[1]{\href{https://doi.org/#1}{https://doi.org/#1}}

% Specify header
\pagestyle{fancy}
\fancyhf{}
\fancyheadoffset{0cm}
\fancyhead[L]{\MakeUppercase{\@shorttitle}}
\renewcommand{\headrulewidth}{0pt} 
\renewcommand{\footrulewidth}{0pt}
\fancyhead[R]{\thepage}
\fancypagestyle{plain}{
   \fancyhf{}
   \fancyhead[R]{\thepage}
}

% Format figures/tables correctly
\DeclareCaptionLabelSeparator*{spaced}{\\[2ex]}
\captionsetup[table]{textfont=it,format=plain,justification=justified,
  singlelinecheck=false,labelsep=spaced,skip=0pt}
\captionsetup[figure]{labelsep=period,labelfont=it,justification=justified,
  singlelinecheck=false,font=doublespacing}

% Format appendices correctly with TOC
\appendixtitletocon % Make ToC display "Appendix A/B/C/etc."
\appendixtitleon % Make the appendix chapter have a proper title
