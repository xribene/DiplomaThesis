%Thesis Class

\NeedsTeXFormat{LaTeX2e}[1996/12/01]
\ProvidesClass{Thesis}
              [2007/22/02 v1.0
   LaTeX document class]
\def\baseclass{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\def\@checkoptions#1#2{
  \edef\@curroptions{\@ptionlist{\@currname.\@currext}}
  \@tempswafalse
  \@tfor\@this:=#2\do{
    \@expandtwoargs\in@{,\@this,}{,\@curroptions,}
    \ifin@ \@tempswatrue \@break@tfor \fi}
  \let\@this\@empty
  \if@tempswa \else \PassOptionsToClass{#1}{\baseclass}\fi
}
\@checkoptions{11pt}{{10pt}{11pt}{12pt}}
\PassOptionsToClass{a4paper}{\baseclass}
\ProcessOptions\relax
\LoadClass{\baseclass}
\newcommand\bhrule{\typeout{------------------------------------------------------------------------------}}
%Project Directory
\def \cwpth {/home/el11555/Thesis/DiplomaThesis2/}

\def\ano{\textperiodcentered \,}
% \newcommand\Declaration[1]{
% \btypeout{Declaration of Authorship}
% \addtotoc{Declaration of Authorship}
% \thispagestyle{plain}
% \null\vfil
% %\vskip 60\p@
% \begin{center}{\huge\bf Declaration of Authorship\par}\end{center}
% %\vskip 60\p@
% {\normalsize #1}
% \vfil\vfil\null
% %\cleardoublepage
% }
%%%%%%%%%%%
%Language Specific

\RequirePackage{epsfig}


\usepackage[Greek,Latin]{ucharclasses}
\RequirePackage{xltxtra}
\RequirePackage[nonumeralsign]  {xgreek}

\setTransitionsForGreek{\setlanguage{greek}}{\setlanguage{english}}

 \nogreekalph
%Dashes that do not break hyphenation
\RequirePackage[shortcuts]{extdash}
%Set word spacing tolerance
\tolerance=2000
%\hyphenation=1600
\usepackage{fontspec}
    \setmainfont{Linux Libertine O}
\renewcommand{\normalsize}{\fontsize{12}{10}\selectfont}
%\setmainfont{Helvetica}
%\setmainfont{udidot}
%%%%%%%%%%%
\RequirePackage{bm}
\RequirePackage{indentfirst}
\RequirePackage{graphicx}
\RequirePackage[space]{grffile}
\RequirePackage{cleveref}

\RequirePackage{relsize}
\RequirePackage[scriptsize]{subfigure}
\RequirePackage{booktabs}
\RequirePackage{rotating}
\RequirePackage{listings}
%\RequirePackage{lstpatch}
\graphicspath{{Graphics/}}  % Location of the graphics files
\RequirePackage{amsmath}
\RequirePackage{latexsym}
\RequirePackage{etoolbox}
\RequirePackage{amsfonts,amssymb,amscd,amsthm,xspace,wasysym}
\RequirePackage{index}
 \newindex{default}{idx}{ind}{Ευρετήριο όρων}
\newindex{en}{edx}{end}{Ευρετήριο αγγλικών όρων}
 \RequirePackage[usenames, dvipsnames, table]{xcolor}
 \RequirePackage{tikz,standalone}
 \RequirePackage{algorithm, algpseudocode}% http://ctan.org/pkg/algorithmicx
 \RequirePackage{array, multirow, hhline, rotating}
 \RequirePackage[normalem]{ulem}
 \usetikzlibrary{shapes.geometric, shapes.arrows, decorations.pathmorphing}
 \usetikzlibrary{matrix,chains,scopes,positioning,arrows,fit}
%\makeatletter %the catcode of @ is 11 already
\tikzset{join/.code 2 args=\tikzset{after node path={%
\ifx\tikzchainprevious\pgfutil@empty\else(\tikzchainprevious)%
edge[every join,#1]#2(\tikzchaincurrent)\fi}}}
%\makeatother %this command makes @ a normal letter, so in this context it is invalid.

\RequirePackage[pdfpagemode={UseOutlines},bookmarks=true,bookmarksopen=true,
   bookmarksopenlevel=0,bookmarksnumbered=true,hypertexnames=false,
   colorlinks,linkcolor={blue},citecolor={blue},urlcolor={red},
   pdfstartview={FitV},unicode,breaklinks=true]{hyperref}
%\RequirePackage[square, numbers, comma, sort&compress]{natbib}  % Use the "Natbib" style for the references in the Bibliography
%\RequirePackage[backend=bibtex]{biblatex}
\RequirePackage{csquotes}
\RequirePackage[
  language=greek,
  backend=bibtex,%bibtex,
  style=numeric,
  bibencoding=utf8,
  url=true
]{biblatex}

%\addbibresource{<database>.<extension>}
\bibliography{ mendeley}  % The references (bibliography) information are stored in the file named "Bibliography.bib"
\RequirePackage{verbatim}  % Needed for the "comment" environment to make LaTeX comments
%%\RequirePackage{vector}  % Allows "\bvec{}" and "\buvec{}" for "blackboard" style bold vectors in maths
\RequirePackage{float}% http://ctan.org/pkg/float
%\hypersetup{urlcolor=blue, colorlinks=true}  % Colours hyperlinks in blue, but this can be distracting if there are many links.
\RequirePackage{datetime}
\def\new@tpage{\newpage\thispagestyle{empty}\null}
\newcommand\btypeout[1]{\bhrule\typeout{\space #1}\bhrule}
\RequirePackage{setspace}
\onehalfspacing
\usepackage{tikz}
\usepackage{amstext}
\usepackage{array}


\usetikzlibrary{arrows.meta}

\usetikzlibrary{shapes.geometric}

\renewcommand{\arraystretch}{1.2}
\usepackage{tkz-euclide}
\usetkzobj{all}
\usetikzlibrary{through}
\newcommand{\tikzAngleOfLine}{\tikz@AngleOfLine}
\def\tikz@AngleOfLine(#1)(#2)#3{%
\pgfmathanglebetweenpoints{%
\pgfpointanchor{#1}{center}}{%
\pgfpointanchor{#2}{center}}
\pgfmathsetmacro{#3}{\pgfmathresult}%
}

\def\roundloop[#1]#2#3{%
 \coordinate (rla) at (#2.east);
 \path   (#2)--++(#1) coordinate (rlb);
 \tkzTgtFromP(#2,rla)(rlb)
 \node (rlb) at (rlb) [draw=none,opacity=0,circle through={(tkzFirstPointResult)}] {};
 \coordinate  (rlc) at (intersection 2 of #2 and rlb);
 \coordinate  (rld) at (intersection 1 of #2 and rlb);
 \tikzAngleOfLine(rlb)(rld){\AngleStart}
 \tikzAngleOfLine(rlb)(rlc){\AngleEnd}
 \tikzAngleOfLine(#2)(rlb){\AngleLabel}
 \ifdim\AngleStart pt<\AngleEnd pt
 \draw[black,thick,->]%
   let \p1 = ($ (rlb) - (rld) $), \n2 = {veclen(\x1,\y1)}
   in
     (rlb) ++(\AngleLabel:\n2) node[fill=white]{#3}
     (rld) arc (\AngleStart:\AngleEnd:\n2);
 \else
  \draw[black,thick,->]%
   let \p1 = ($ (rlb) - (rld) $), \n2 = {veclen(\x1,\y1)}
   in
     (rlb) ++(\AngleLabel:\n2) node[fill=white]{#3}
     (rld) arc (\AngleStart-360:\AngleEnd:\n2);
   \fi
  }
\usetikzlibrary{calc,matrix,positioning}
\usepackage{amsmath} % nice math symbols
\tikzset{%
  >={Latex[width=2,length=2]},
  % Specifications for style of nodes:
  base/.style = {rectangle, rounded corners, draw=black,
                           minimum width=4, minimum height=1,
                           text centered, font=\sffamily},
  io/.style = {circle, rounded corners, draw=black,
                           minimum width=4, minimum height=1,
                           text centered, font=\sffamily,fill=blue!30},
  decision/.style = {diamond, draw=black, minimum width=4,
                   minimum height=1, text centered},
  buffer/.style = {base, fill=green!30},
  selector/.style = {base, fill=yellow!20, minimum height=1cm,minimum width=1cm},
  process/.style = {base, minimum width=2.5, fill=orange!15,
                           font=\ttfamily},
  timer/.style = {circle, draw=black, minimum width=2.5, fill=purple!15,
                           font=\ttfamily},
  iff/.style = {decision, minimum width=2.5, fill=orange!15,
                          font=\ttfamily}
}
\tikzset{every loop/.style={min distance=10mm,in=0,out=60,looseness=10}}
\tikzset{
  -|-/.style={
    to path={
      (\tikztostart) -| ($(\tikztostart)!#1!(\tikztotarget)$) |- (\tikztotarget)
      \tikztonodes
    }
  },
  -|-/.default=0.5,
  |-|/.style={
    to path={
      (\tikztostart) |- ($(\tikztostart)!#1!(\tikztotarget)$) -| (\tikztotarget)
      \tikztonodes
    }
  },
  |-|/.default=0.5,
}
\def\blockdist{2.3}
\def\edgedist{2.5}
% Measurements
\setlength{\oddsidemargin}{7mm}
\setlength{\evensidemargin}{0mm}
\setlength{\textwidth}{150mm}

\setlength{\topmargin}{0mm}
\setlength{\textheight}{235mm}
\advance \topmargin by -\headheight
\advance \topmargin by -\headsep

% Macros for dates
\RequirePackage{datetime}

% Declare Math Operators
\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator*{\argmax}{argmax}

\setlength{\parindent}{0pt}
\setlength{\parskip}{2.0ex plus0.5ex minus0.2ex}
\RequirePackage{vmargin}
\setmarginsrb           { 1.5in}  % left margin
                        { 0.6in}  % top margin
                        { 1.0in}  % right margin
                        { 0.8in}  % bottom margin
                        {  20pt}  % head height
                        {0.25in}  % head sep
                        {   9pt}  % foot height
                        { 0.3in}  % foot sep
\raggedbottom
\setlength{\topskip}{1\topskip \@plus 5\p@}
\doublehyphendemerits=10000       % No consecutive line hyphens.
\brokenpenalty=10000              % No broken words across columns/pages.
\widowpenalty=9999                % Almost no widows at bottom of page.
\clubpenalty=9999                 % Almost no orphans at top of page.
\interfootnotelinepenalty=9999    % Almost never break footnotes.
\RequirePackage{fancyhdr}
\lhead[\rm\thepage]{\fancyplain{}{\sl{\rightmark}}}
\rhead[\fancyplain{}{\sl{\leftmark}}]{\rm\thepage}
\chead{}\lfoot{}\rfoot{}\cfoot{}
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\btypeout{\thechapter\space #1}\markboth{\@chapapp\ \thechapter\ #1}{\@chapapp\ \thechapter\ #1}}
\renewcommand{\sectionmark}[1]{}
\renewcommand{\subsectionmark}[1]{}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\theoremstyle{plain}
\newtheorem{definition}{Ορισμός}
\newtheorem{proposition}{Πρόταση}
\newtheorem{theorem}{Θεώρημα}
\newtheorem{corollary}{Συμπέρασμα}
\newtheorem{lemma}{Λήμμα}
\newtheorem{example}{Παράδειγμα}
\newtheorem{remark}{Σημείωση}
\newtheorem{notation}{Συμβολισμός}
\newtheorem{law}{Νόμος}


\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
\renewcommand{\theproposition}{\arabic{chapter}.\arabic{proposition}}
\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}
\newcommand{\set}[1]{\left\{#1\right\}}
\newcommand{\To}{\Longrightarrow}
\RequirePackage[centerlast,small,sc]{caption}
\setlength{\captionmargin}{20pt}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\dbltopfraction}{.85}
\renewcommand{\floatpagefraction}{0.75}
\renewcommand{\dblfloatpagefraction}{.75}

\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{20}
\setcounter{dbltopnumber}{9}


\lstset{captionpos=b,
        frame=tb,
        basicstyle=\scriptsize\ttfamily,
        showstringspaces=false,
        keepspaces=true}
\lstdefinestyle{matlab} {
        language=Matlab,
        keywordstyle=\color{blue},
        commentstyle=\color[rgb]{0.13,0.55,0.13}\em,
        stringstyle=\color[rgb]{0.7,0,0} }

\RequirePackage{bookmark}
\RequirePackage[toc,page]{appendix}
\renewcommand\appendixtocname{Παραρτήματα}
\renewcommand\appendixname{Παράρτημα}
\renewcommand\appendixpagename{Παραρτήματα}
\pdfstringdefDisableCommands{
   \let\\\space
}


\def\@supervisor{}              \def\supervisor#1{\gdef\@supervisor{#1}}
\def\@epitropiF{}               \def\epitropiF#1{\gdef\@epitropiF{#1}}
\def\@epitropiS{}               \def\epitropiS#1{\gdef\@epitropiS{#1}}
\def\@subtitle{}                    \def\subtitle#1{\gdef\@subtitle{#1}}
\def\@translator{}              \def\translator#1{\gdef\@translator{#1}}
\def\@institution{}             \def\institution#1{\gdef\@institution{#1}}
\def\@department{}              \def\department#1{\gdef\@department{#1}}
\def\@division{}                \def\division#1{\gdef\@division{#1}}
\def\@lab{}                     \def\lab#1{\gdef\@lab{#1}}
\def\@other{}                   \def\other#1{\gdef\@other{#1}}
\def\@dedication{}              \def\dedication#1{\def\@dedication{#1}}
\def\@uppertitleback{}          \long\def\uppertitleback#1{\def\@uppertitleback{#1}}
\def\@middletitleback{}         \long\def\middletitleback#1{\def\@middletitleback{#1}}
\def\@lowertitleback{}          \long\def\lowertitleback#1{\def\@lowertitleback{#1}}
\def\@approval{}                \long\def\approval#1{\def\@approval{#1}}
\def\@mysig{}                   \long\def\mysig#1{\def\@mysig{#1}}
\def\@authors{}                   \long\def\authors#1{\gdef\@authors{#1}}
                          \def\url#1{\gdef\@url{\texttt{#1}}}
                          \def\TRnumber#1{\gdef\@TRnumber{#1}}
\def\@trurl{}             \def\trurl#1{\gdef\@trurl{\texttt{#1}}}
\def\@trftp{}             \def\trftp#1{\gdef\@trftp{\texttt{#1}}}




\newcommand{\aspecialcell}[2][c]{ 
\begin{tabular}[#1]{@{}c@{}}#2\end{tabular}}

 \renewcommand{\maketitle}{
     \begin{titlepage}
        \let\footnotesize\small
        \let\footnoterule\relax
        \renewcommand{\thefootnote}{\fnsymbol{footnote}}
        \new@tpage
        \begin{center}

        \begin{minipage}{2.5cm}
            \includegraphics[width=2.5cm]{pyrforos}
        \end{minipage}


        \begin{minipage}{15cm}
        \begin{center}
          \textsc{
            \huge{\@institution} \\
            \large{\@department \\
            \@division} \\}
            %\@other

        \end{center}
        \end{minipage}
        %\hfill %\hspace{0.5cm}

        %
        \vfill
        %

           % \fbox{\fbox{%\parbox{14cm}{
                %\vspace{1mm}\hspace{1mm}
                %\begin{minipage}{5cm}
                %    \@ifundefined{@TRnumber}{ΕΣΒΓΔ-ΔΙΠΛ}{\@TRnumber}
                %\end{minipage}
                %\hfill
                %\begin{minipage}{5cm}
                %    \flushright
                %    \@date
                %\end{minipage}
                %
                %\vspace{5mm}
                %

                 \begin{center}
                      \LARGE \bfseries \@title
                 \end{center}
                 \ifx\@subtitle\@empty\else
                 \begin{center}
                     \large \@subtitle
                 \end{center}
                 \fi
                %
                \vspace{5mm}
                %
                \begin{center}
                    \huge{\textsc{\@translator}}\\
                    \vspace{3mm}
                    \normalsize{\by}\\
                    \vspace{3mm}
                    \large{\textbf{\@authors}}
                \end{center}
                %
                \vspace{5mm}
                %
                \hspace{1mm}
    \end{center}

           \vfill

                \begin{minipage}{15cm}
                \begin{tabbing}
                    \large \textbf{\supervisorname :} \=\@supervisor\\
                    \>Καθηγητής Ε.Μ.Π.
                \end{tabbing}
                \end{minipage}
                \vspace{1mm}
%         %    % }}%}
%         %
%         %     %
            \vfill
%         %     %
%         %
%         %     %\begin{figure}[ht] \center\leavevmode
%         %     %\epsfxsize=8cm
%         %     %\epsfbox{D:/thesis/figures/cover.eps}
%         %     %\end{figure}
%         %
            \begin{center}
                %\Large \textsc{{\bfseries \@translator}}\\[12pt]
                \textsc{\lab}\\
                Αθήνα, Ιούνιος 2018
            \end{center}
            %
            \cleardoublepage

            \if@twoside\new@tpage
                \noindent
                \begin{minipage}[t]{\textwidth}
                    \@uppertitleback
                \end{minipage}
                \par
                \vfill
               \begin{center}
                    \LARGE \bfseries \@title
                \end{center}
                \ifx\@subtitle\@empty\else
                \begin{center}
                    \Large \@subtitle
                \end{center}
                \fi

                \vspace{5mm}
                %
                \begin{center}
                    %\huge{\textsc{\@translator}}\\
                    \vspace{3mm}
                    \normalsize{του}\\
                    \vspace{3mm}
                    \large{\textbf{\@authors}}
                \end{center}
                %
                \vspace{5mm}
                %
                \hspace{1mm}


           \vfill

                \begin{minipage}{15cm}
                \begin{tabbing}
                    \large \textbf{\supervisorname :} \=\@supervisor\\
                    \>Καθηγητής Ε.Μ.Π.
                \end{tabbing}
                \end{minipage}
                \vspace{1mm}
           \vfill

                \begin{minipage}{\textwidth}
                     \@approval
                \end{minipage}

            \vfill
            \begin{center}
                %\Large \textsc{{\bfseries \@translator}}\\[12pt]
                %\textsc{\@lab}\\
                Αθήνα, Ιούνιος 2018
            \end{center}
            %
            \fi
           \new@tpage
           \begin{minipage}[b]{\textwidth}
             \@mysig
           \end{minipage}

            \cleardoublepage
            \if@twoside\new@tpage
                \noindent
                \begin{minipage}[t]{\textwidth}
                    \@uppertitleback
                \end{minipage}
                \par
                \vfill
                \noindent
                \begin{minipage}{\textwidth}
                    \@middletitleback
                \end{minipage}
                \par
                \vfill
                \noindent
                \begin{minipage}[b]{\textwidth}
                    \@lowertitleback
                \end{minipage}
            \fi
        %    \ifx\@dedication\@empty\else \new@tpage
        %        {\centering \Large \@dedication \par}
        %        \if@twoside \newt@page \fi
        %    \fi
        % \new@tpage
        %   \begin{minipage}[b]{\textwidth}
        %    \@mysig
        %   \end{minipage}
     \end{titlepage}
     %
         \renewcommand{\thefootnote}{\arabic{footnote}}
         \setcounter{footnote}{0}
         %
         \gdef\@thanks{}\gdef\@authors{}\gdef\@translator{}\gdef\@institution{}
         \gdef\@department{}\gdef\@division{}\gdef\@lab{}\gdef\@other{}
       \gdef\@uppertitleback{}\gdef\@lowertitleback{}\gdef\@dedication{}%
       \gdef\@title{}\gdef\@subtitle{}\let\maketitle\relax%
     }
     \mysig{
     \vspace{15cm}
     \textit{(Υπογραφή)}\\\\\\
     .........................................\\
     \large{\textbf{\textsc{\@author}}}\\
     \large{Διπλωματούχος Ηλεκτρολόγος Μηχανικός και Μηχανικός
     Υπολογιστών Ε.Μ.Π.}\\
     \copyright\ \the\year -- All rights reserved
     }


     \uppertitleback{
         \begin{minipage}{2cm}
             \includegraphics[width=2cm]{pyrforos}
         \end{minipage}
         \hspace{0.5cm}
         \begin{minipage}{12cm}
             \@institution \\
             \@department \\
             \@division \\
             \@lab
         \end{minipage}
     }

     \approval{
         Εγκρίθηκε από την τριμελή εξεταστική επιτροπή στις 15 Ιουνίου 2018.
         \begin{tabbing}
         aaaaaaaaaaaaaaaaaaaaaaaaaa\=aaaaaaaaaaaaaaaaaaaaaa\=\kill
         \textit{(Υπογραφή)}\> \textit{(Υπογραφή)}\>  \textit{(Υπογραφή)}\\\\\\
         ........................................\>  ..........................\>  ...................................\\
         \@supervisor\>         \@epitropiF\>    \@epitropiS\\
         Καθηγητής \>     Αναπληρωτής\>      Καθηγήτρια\\
         Ε.Μ.Π\> Καθηγητής  \> Ε.Μ.Π \\
         \> Ε.Μ.Π \\
         \\\\\\\\
         \end{tabbing}

     }

     \middletitleback{
         Copyright \copyright\ \ \@author, \the\year.\\
         Με επιφύλαξη παντός δικαιώματος. All rights reserved\\[12pt]
         Απαγορεύεται η αντιγραφή, αποθήκευση και διανομή της παρούσας εργασίας, εξ
         ολοκλήρου ή τμήματος αυτής, για εμπορικό σκοπό.  Επιτρέπεται η ανατύπωση,
         αποθήκευση και διανομή για σκοπό μη κερδοσκοπικό, εκπαιδευτικής ή
         ερευνητικής φύσης, υπό την προϋπόθεση να αναφέρεται η πηγή προέλευσης και να
         διατηρείται το παρόν μήνυμα.  Ερωτήματα που αφορούν τη χρήση της εργασίας
         για κερδοσκοπικό σκοπό πρέπει να απευθύνονται προς τον
         συγγραφέα.
     }
     % Names
     \newcommand{\keywordsname}{Λέξεις Κλειδιά}
     \newcommand{\keywordsnameeng}{Keywords}
     \newcommand{\draftname}{Προσχέδιο}
     \newcommand{\acknowledgementsname}{Ευχαριστίες}
     \newcommand{\supervisorname}{Επιβλέπων}
     \newcommand{\pagesname}{Σελίδες}
     \newcommand{\urlname}{URL}
     \newcommand{\by}{του}

     %More Names
     \institution{Εθνικό Μετσόβιο Πολυτεχνείο}
     \translator{Διπλωματική Εργασία}
     \supervisor  {Ανδρέας Σταφυλοπάτης}
     \epitropiF {Γιώργος Στάμου}
     \epitropiS {Κωνσταντίνα Νικήτα}
     \department{Σχολή Ηλεκτρολόγων Μηχανικών και Μηχανικών Υπολογιστών}
     \division{Τομέας Τεχνολογίας Πληροφορικής και Υπολογιστών}
     \lab{Εργαστήριο Ευφυών  Συστημάτων (ΕΕΥΣ)}
     \other{Ζωγράφου 157 73, Αθήνα}
     \authors     {Χριστόδουλου Θ. Μπενετάτου}
     \author     {Χριστόδουλου Θ. Μπενετάτου}
\newenvironment{abstract}
{
  \btypeout{Περίληψη}
  \thispagestyle{empty}
  \null\vfil
  \begin{center}
    \setlength{\parskip}{0pt}
    \bigskip
    {\chapter*{Περίληψη} \par}
  \end{center}
}
{
  \vfil\vfil\vfil\null
  \cleardoublepage
}
\addtocounter{secnumdepth}{1}
\newenvironment{abstracteng}
{
  \btypeout{Abstract}
  \thispagestyle{empty}
  \null\vfil
  \begin{center}
    \setlength{\parskip}{0pt}
    \bigskip
    {\chapter*{Abstract} \par}
  \end{center}
}
{
  \vfil\vfil\vfil\null
  \cleardoublepage
}
\addtocounter{secnumdepth}{1}
\setcounter{tocdepth}{6}
\newcounter{dummy}
\newcommand\addtotoc[1]{
\refstepcounter{dummy}
\addcontentsline{toc}{chapter}{#1}}
\renewcommand\tableofcontents{
\btypeout{Περιεχόμενα}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}
    \@starttoc{toc}
    \if@restonecol\twocolumn\fi
   \cleardoublepage
}\end{spacing}
}
\renewcommand\listoffigures{
\btypeout{Κατάλογος Εικόνων}
\addtotoc{Κατάλογος Εικόνων}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}
              {\MakeUppercase\listfigurename}}
    \@starttoc{lof}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
}\end{spacing}
}
\renewcommand\listoftables{
\btypeout{Κατάλογος Πινάκων}
\addtotoc{Κατάλογος Πινάκων}
\begin{spacing}{1}{
    \setlength{\parskip}{1pt}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename
      \@mkboth{
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}
    \@starttoc{lot}
    \if@restonecol\twocolumn\fi
    \cleardoublepage
}\end{spacing}
}
\newcommand\listsymbolname{Συντομεύσεις}
\RequirePackage{longtable}
\newcommand\listofsymbols[2]{
\btypeout{\listsymbolname}
\addtotoc{\listsymbolname}
    \chapter*{\listsymbolname
      \@mkboth{
          \MakeUppercase\listsymbolname}{\MakeUppercase\listsymbolname}}
\begin{longtable}[c]{#1}#2\end{longtable}\par
    \cleardoublepage
}
\newcommand\listconstants{Φυσικές Σταθερές}
\RequirePackage{longtable}
\newcommand\listofconstants[2]{
\btypeout{\listconstants}
\addtotoc{\listconstants}
    \chapter*{\listconstants
      \@mkboth{
          \MakeUppercase\listconstants}{\MakeUppercase\listconstants}}
\begin{longtable}[c]{#1}#2\end{longtable}\par
    \cleardoublepage
}
\newcommand\listnomenclature{Σύμβολα}
\RequirePackage{longtable}
\newcommand\listofnomenclature[2]{
\btypeout{\listnomenclature}
\addtotoc{\listnomenclature}
    \chapter*{\listnomenclature
      \@mkboth{
          \MakeUppercase\listnomenclature}{\MakeUppercase\listnomenclature}}
\begin{longtable}[c]{#1}#2\end{longtable}\par
    \cleardoublepage
}
\newcommand\acknowledgements[1]{
\btypeout{Ευχαριστίες}
\addtotoc{Ευχαριστίες}
\thispagestyle{plain}
\begin{center}{\huge{\textit{Ευχαριστίες}} \par}\end{center}
{\normalsize #1}
\vfil\vfil\null

}
\newcommand\dedicatory[1]{
\btypeout{Αφιέρωση}
\thispagestyle{plain}
\null\vfil
\vskip 60\p@
\begin{center}{\Large \sl #1}\end{center}
\vfil\null
\cleardoublepage
}
\renewcommand\backmatter{
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \addtotoc{\bibname}
  \btypeout{\bibname}
  \@mainmatterfalse}
\endinput



%%
%% End of file `Thesis.cls'.
