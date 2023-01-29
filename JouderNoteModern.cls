\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{JouderNoteModern}[2022/08/04 v0.1 JouderBook document class]

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=JOUDER, prefix=JOUDER@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{JOUDER}{#1}}

\PassOptionsToPackage{math-style=TeX, mathrm=sym}{unicode-math}
\PassOptionsToPackage{no-math}{fontspec}

\DeclareStringOption[zzAw]{fonten}
\DeclareStringOption[zzAw]{fontcn}
\DeclareStringOption[cn]{lang}

\DeclareVoidOption{zzAw}{\ekv{fonten=newcm}}

\DeclareVoidOption{zzAw}{\ekv{fontcn=founder}}

\DeclareVoidOption{cn}{\ekv{lang=cn}}
\DeclareVoidOption{en}{\ekv{lang=en}}

\ProcessKeyvalOptions*\relax

\LoadClass[a4paper, 12pt]{article}

\RequirePackage{amsmath}
\RequirePackage{geometry}
\RequirePackage{tikz}
\RequirePackage{enumitem}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage[per-mode=symbol]{siunitx}
\RequirePackage{indentfirst}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xcolor}
  \definecolor{blue}{HTML}{2274A5}
\RequirePackage[absolute]{textpos}
  \TPGrid{16}{16}
\RequirePackage{mdframed}
  \mdfdefinestyle{JouderNote}{
    topline=false,
    bottomline=false,
    rightline=false,
    backgroundcolor=blue!20,
    linecolor=blue,
    linewidth=3pt
  }

\newcommand\pagebar{%
  \begin{textblock}{1}[0,0](0,0)%
    \tikz \node[fill=blue,minimum width=\TPHorizModule,minimum height=16\TPVertModule] {};%
  \end{textblock}%
}

\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\pagestyle{fancy}
\fancyfoot[L]{
    \pagebar
}
\fancyfoot[r]{
    \thepage
}

\fancypagestyle{plain}{
    \fancyhf{}
    \pagestyle{fancy}
    \fancyfoot[L]{
        \pagebar
    }
    \fancyfoot[r]{
        \thepage
    }
}

% 中文字体设置
\ifdefstring{\JOUDER@fontcn}{zzAw}{
    \RequirePackage[punct=kaiming, fontset=none]{ctex}
    \setCJKmainfont[BoldFont={FZFW ZhuZi A YuanS B}]{FZFW ZhuZi A YuanS M}
    \setCJKsansfont[BoldFont={FZFW ZhuZi A YuanS B}]{FZFW ZhuZi A YuanS M}
    \setCJKmonofont[BoldFont={FZFW ZhuZi A YuanS B}]{FZFW ZhuZi A YuanS M}
    \setCJKfamilyfont{zhyuan}[BoldFont={FZFW ZhuZi A YuanS B}]{FZFW ZhuZi A YuanS M}
    \newcommand*{\yuanti}{\CJKfamily{zhyuan}}
}{\relax}

% 英文字体设置

\ifdefstring{\JOUDER@fonten}{zzAw}{
    \RequirePackage[default]{fontsetup}
    \setmainfont[BoldFont={FZFW ZhuZi A YuanS B}]{FZFW ZhuZi A YuanS M}
    \setsansfont[BoldFont={FZFW ZhuZi A YuanS B}]{FZFW ZhuZi A YuanS M}
}{\relax}

% 语言设置
\ifdefstring{\JOUDER@lang}{cn}{
    \newcommand{\problemlabel}{题}
    \newcommand{\solutionlabel}{解}
}{\relax}

\ifdefstring{\JOUDER@lang}{en}{
    \newcommand{\problemlabel}{Problem}
    \newcommand{\solutionlabel}{Solution}
}{\relax}

\usetikzlibrary{shapes.multipart}

\geometry{a4paper, left=1.5in, right=1in, top=1.2in, bottom=1.2in}
\linespread{1.3}
% \setlength{\parskip}{0.25em}
\setlist{labelindent=\parindent, before=\setlength{\itemsep}{0pt}\setlength{\partopsep}{0pt}\setlength{\parsep}{\parskip}}

% \newcommand{\spare}{\begin{center}\vspace*{-2.5em}\rule{\textwidth}{1.5pt}\vspace*{-2em}\end{center}}

\newcommand{\spare}{\begin{center}\vspace*{-2.5em}\tikz{\draw[very thick,line cap=round] (0,0) to (\textwidth-1.2,0);}\vspace*{-2em}\end{center}}

\newenvironment{problem}[1]{\setlength{\parindent}{0cm}\textbf{\problemlabel{} #1}\setlength{\parskip}{0em}\quad}{\par}
\newenvironment{solution}{\setlength{\parindent}{0cm}\setlength{\parskip}{0em}\textbf{\solutionlabel}\quad\kaishu}{\par}
\newenvironment{note}{\begin{mdframed}[style=JouderNote]}{\end{mdframed}}

\RequirePackage{amsthm}
\RequirePackage{thmtools}
\declaretheorem[numberwithin=section, name=定理]{theorem}
\declaretheorem[numberwithin=section, name=定义]{definition}
\declaretheorem[numberwithin=section, name=例]{example}

\setcounter{secnumdepth}{4}