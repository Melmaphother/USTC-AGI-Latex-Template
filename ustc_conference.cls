\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ustc_conference}
\LoadClassWithOptions{article}
\pdfoutput=1

\RequirePackage[top=2.75cm, bottom=2.5cm, left=2.5cm, right=2.5cm, columnsep=0.65cm, headheight=31pt]{geometry}
\RequirePackage{microtype}
\RequirePackage{placeins}
\RequirePackage{hyphenat}
\RequirePackage{setspace}
\RequirePackage{parskip}
\RequirePackage[latin, english]{babel}
\RequirePackage{lipsum}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{ulem}
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{nicematrix}
\RequirePackage{multirow}
\RequirePackage{bm}
\RequirePackage[most]{tcolorbox}
\RequirePackage{xcolor}
\RequirePackage[T1]{fontenc}

\definecolor{ustcblue}{HTML}{1D5CAB}
\newcommand{\ustcblue}[1]{{\bfseries\color{ustcblue}#1}}

\RequirePackage{hyperref}
\RequirePackage[noabbrev,nameinlink]{cleveref}
\hypersetup{
  colorlinks,
  linkcolor=ustcblue,
  citecolor=ustcblue,
  urlcolor=ustcblue
}

\RequirePackage[numbers, sort&compress]{natbib}
\def\bibfont{\small}
\addto{\captionsenglish}{\renewcommand{\refname}{References}}
\newcommand{\citeas}[1]{\Needspace*{8\baselineskip}\noindent\bibentry{#1}}

\newcommand{\sectionfont}{\fontsize{12}{14}\selectfont}
\newcommand{\subsectionfont}{\fontsize{11}{13}\selectfont}
\newcommand{\authorfont}{\fontsize{12}{14}\selectfont}
\newcommand{\affiliationfont}{\fontsize{10}{12}\selectfont}
\newcommand{\contributionfont}{\fontsize{10}{12}\selectfont}
\newcommand{\checkdatafont}{\fontsize{7.92}{10}\selectfont}
\newcommand{\abstractinfont}{\fontsize{10}{12}\selectfont}
\newcommand{\titlefont}{\fontsize{17}{20}\selectfont}
\newcommand{\abstractfont}{\fontsize{12}{12}\selectfont}
\DeclareFontFamily{T1}{bytesans}{}
\DeclareFontShape{T1}{bytesans}{m}{n}{<-> s * [1] fonts/bytesans}{}
\DeclareFontShape{T1}{bytesans}{b}{n}{<-> s * [1] fonts/bytesans}{}
\pdfmapline{+bytesans < fonts/ByteSans-Bold.ttf <T1-WGL4.enc}
\DeclareFontFamily{T1}{bytesansmedium}{}
\DeclareFontShape{T1}{bytesansmedium}{m}{n}{<-> s * [1] fonts/bytesansmedium}{}
\DeclareFontShape{T1}{bytesansmedium}{b}{n}{<-> s * [1] fonts/bytesansmedium}{}
\pdfmapline{+bytesansmedium < fonts/ByteSans-Medium.ttf <T1-WGL4.enc}
\newcommand{\frontsans}{\fontfamily{bytesans}\selectfont}
\newcommand{\frontmedium}{\fontfamily{bytesansmedium}\selectfont}
\newcommand{\suptext}[1]{{\rmfamily\normalfont #1}}
\newcommand{\frontsup}[1]{\textsuperscript{\suptext{#1}}}
\newcommand{\affilsup}[1]{\textsuperscript{\suptext{#1}}}
\newcommand{\equalcontrib}{\suptext{*}}
\newcommand{\corrauthor}{\suptext{\ensuremath{\mathsection}}}
\newcommand{\projectlead}{\suptext{\ensuremath{\dagger}}}
\newcommand{\coauthornote}{\suptext{\ensuremath{\ddagger}}}

\RequirePackage{titlesec}
\titleformat*{\paragraph}{\itshape}
\titleformat*{\section}{\frontsans\sectionfont\bfseries\color{ustcblue}}
\titleformat*{\subsection}{\frontsans\subsectionfont\bfseries\color{ustcblue}}
\titleformat*{\subsubsection}{\frontsans\normalsize\bfseries\color{ustcblue}}

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{custom}{}
\DeclareCaptionFormat{custom}{{\textbf{#1 #2}} #3}
\captionsetup{singlelinecheck=true,format=custom,labelsep=custom,font=small}
\captionsetup[sub]{singlelinecheck=true,format=custom,labelsep=custom,font=small}

\newcommand\nm[1]{#1}

\renewcommand\addtolist[5][]{
  \begingroup
    \if\relax#3\relax\def\sep{}\else\def\sep{#5}\fi
    \let\protect\@unexpandable@protect
    \xdef#3{\expandafter{#3}\sep #4[#1]{#2}}%
  \endgroup
}

\newcommand\authorlist{}
\newcommand\authorformat[2][]{\authorfont \frontsans\bfseries #2\frontsup{#1}}
\renewcommand\author[2][]{\addtolist[#1]{#2}{\authorlist}{\authorformat}{, }}

\newcommand\affiliationlist{}
\newcommand\affiliationformat[2][]{\affiliationfont \frontmedium \affilsup{#1}#2}
\newcommand\affiliation[2][]{\addtolist[#1]{#2}{\affiliationlist}{\affiliationformat}{, }}

\newcommand\contributionlist{}
\newcommand\contributionformat[2][]{\contributionfont \rmfamily\normalfont $^{#1}$#2}
\newcommand\contribution[2][]{\addtolist[#1]{#2}{\contributionlist}{\contributionformat}{, }}

\newcommand\checkdatalist{}
\newcommand\checkdataformat[2][]{{\small {\checkdatafont\frontsans\bfseries #1:} \checkdatafont #2}}
\newcommand\checkdata[2][]{\addtolist[#1]{#2}{\checkdatalist}{\checkdataformat}{\par}}

\renewcommand{\abstract}[1]{\def\abstractlist{{\abstractinfont #1}}}
\newcommand{\email}[1]{\href{mailto:#1}{\texttt{#1}}}
\renewcommand\date[1]{\checkdata[Date]{#1}}
\newcommand\correspondence[1]{\checkdata[Correspondence]{#1}}
\renewcommand{\title}[1]{\newcommand{\titlelist}{\titlefont\frontsans\bfseries #1}}
\newcommand{\beginabstract}{\abstractfont\frontsans\bfseries\ustcblue{Abstract}\par}
\newcommand{\beginappendix}{\appendix{\titlefont\frontsans\bfseries\ustcblue{Appendix}\par}}

\fancypagestyle{firststyle}{
  \fancyhead[R]{}
  \fancyhead[L]{\includegraphics[pagebox=artbox,height=10mm]{assets/ustc-logo.pdf}}
}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\setlength{\headsep}{2pt}

\newcommand{\@toptitlebar}{
  {\color{ustcblue}\hrule height 0.5pt}
  \vskip 4.5mm
}
\newcommand{\@bottomtitlebar}{
  \vskip 3.5mm
  {\color{ustcblue}\hrule height 0.5pt}
}

\newcommand{\mymaketitle}{%
  \tcbset{enhanced}
  \tcbset{left=8mm}
  \tcbset{right=8mm}
  % Single-column main control for the gap between logo and the first blue rule.
  % Decrease this value to move the first rule upward; increase it to move it downward.
  \tcbset{top=0.5mm}
  \tcbset{bottom=6mm}
  \tcbset{colback=white}
  \tcbset{colframe=ustcblue}
  \tcbset{boxrule=0.5pt}
  \tcbset{before skip=0pt}
  \tcbset{grow to left by=1.5pt}
  \tcbset{grow to right by=1.5pt}
  \tcbset{arc=2.5mm}
  {
    \setlength{\parskip}{0mm}
    \centering
    \nohyphens
    {
      \@toptitlebar
      \titlelist\par
      \@bottomtitlebar
    }
    \vskip 8mm
    \authorlist
    \vskip 3mm
    \affiliationlist\par
    \vskip 2.5mm
    \contributionlist\par
  }
  \vskip 8mm
  \begin{tcolorbox}
    \setlength{\parindent}{0cm}
    \setlength{\parskip}{0cm}
    \vspace*{3mm}
    \begin{center}
      \beginabstract
      \vskip 3.5mm
    \end{center}
    \abstractlist\par
    \vskip 4mm
    {
      \setlength{\parskip}{0cm}
      \ifdefempty{\checkdatalist}{\vspace*{0.65cm}}{\checkdatalist\par}
    }
  \end{tcolorbox}
  \tcbset{reset}
  \FloatBarrier
  \thispagestyle{firststyle}
}

\if@twocolumn
\renewcommand{\maketitle}{
\twocolumn[%
 % Main control for the gap between logo and the first blue rule:
 % make this more negative to pull the rule upward.
 \vskip -10mm
  \mymaketitle
  \vskip 8mm
]
}
\else
\renewcommand{\maketitle}{
  % In single-column mode, the logo-to-rule gap is mainly controlled by tcbset{top=...} above.
  \mymaketitle
  \vskip 8mm
}
\fi
