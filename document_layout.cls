\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{document_layout}[2024/11/21 Corrected Two-Column Template Class]

% Base class
\LoadClass[twocolumn,12pt]{article}

% Page layout
\RequirePackage[a4paper,margin=2cm,columnsep=1cm]{geometry} % 2cm margins, 1cm column separation
\RequirePackage{lmodern} % Modern font
\RequirePackage{microtype} % Better text spacing
\RequirePackage{ragged2e} % For justification
\RequirePackage{xcolor} % For colored text
\RequirePackage{titlesec} % For section formatting

% Headers and footers
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{} % Clear all headers and footers
\fancyhead[L]{\textit{optics laboratory techniques}} % Left-aligned running head
\fancyhead[R]{\textit{@tec.mx}} % Right-aligned running head
\fancyfoot[C]{\thepage} % Page numbers in the footer
\setlength{\headheight}{15pt} % Adjust head height to avoid warnings

% Packages for functionality
\RequirePackage{amsmath,amssymb,graphicx,float,hyperref}
\RequirePackage{caption,subcaption} % Captions and subfigures
\RequirePackage[backend=biber]{biblatex} % Use biblatex for bibliography management

% Title and abstract formatting
\renewcommand{\maketitle}{
  \twocolumn[ % Ensure title and abstract span both columns
    \begin{center}
      {\LARGE \bfseries \@title \par} % Title
      \vspace{0.5em}
    \end{center}
    \RaggedRight % Left-align authors and affiliations
    {\small \@author \par} % Authors and address
    \vspace{0.5em}
    \begin{center}
      \section*{\small \abstractname}
      \vspace{-0.2em}
      \begin{minipage}{0.85\textwidth} % Centered abstract block
        \scriptsize
        \justifying
        \@abstract
      \end{minipage}
    \end{center}
    \vspace{0.5em}
  ]
}

% Abstract storage (fix for \@abstract issues)
\newcommand{\@abstract}{} % Initialize empty abstract command
\newcommand{\setabstract}[1]{\renewcommand{\@abstract}{#1}} % Set abstract
\newcommand{\address}[1]{\textsuperscript{#1}} % Set authors and address

% Section formatting
\titleformat{\section} % Change section format
  {\color{gray}\normalfont\large\bfseries} % Smaller font size and gray color
  {\thesection} % Section number
  {1em} % Space between number and title
  {} % Title

% Subsection formatting
\titleformat{\subsection}
  {\color{gray}\normalfont\normalsize\bfseries}
  {\thesubsection}
  {1em}
  {}


% Bibliography command (avoids conflicts)
\newcommand{\printbibliographysection}[1]{

  \onecolumn  
  \justifying
  \printbibliography[title=#1] % Print bibliography with title
  \twocolumn
}


\endinput
