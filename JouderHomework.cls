\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{JouderHomework}[2022/08/04 v0.3 JouderHomework document class]

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=JOUDER, prefix=JOUDER@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{JOUDER}{#1}}

\PassOptionsToPackage{math-style=TeX, mathrm=sym}{unicode-math}
\PassOptionsToPackage{no-math}{fontspec}

\DeclareStringOption[newcm]{fonten}
\DeclareStringOption[founder]{fontcn}
\DeclareStringOption[cn]{lang}

\DeclareVoidOption{newcm}{\ekv{fonten=newcm}}
\DeclareVoidOption{stixtwo}{\ekv{fonten=stixtwo}}
\DeclareVoidOption{libertinus}{\ekv{fonten=libertinus}}
\DeclareVoidOption{concrete}{\ekv{fonten=concrete}}
\DeclareVoidOption{cm}{\ekv{fonten=cm}}
\DeclareVoidOption{euler}{\ekv{fonten=euler}}

\DeclareVoidOption{ctex}{\ekv{fontcn=ctex}}
\DeclareVoidOption{founder}{\ekv{fontcn=founder}}

\DeclareVoidOption{cn}{\ekv{lang=cn}}
\DeclareVoidOption{en}{\ekv{lang=en}}

\ProcessKeyvalOptions*\relax

\LoadClass[a4paper]{article}

\RequirePackage{amsmath}
\RequirePackage{geometry}
\RequirePackage{tikz}
\RequirePackage{enumitem}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage[per-mode=symbol]{siunitx}

% 中文字体设置
\ifdefstring{\JOUDER@fontcn}{ctex}{
    \RequirePackage{ctex}
}{\relax}

\ifdefstring{\JOUDER@fontcn}{founder}{
    \RequirePackage[fontset=none]{ctex}
    \setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01}
    \setCJKsansfont[BoldFont={FZHei-B01}]{FZKai-Z03}
    \setCJKmonofont[BoldFont={FZHei-B01}]{FZFangSong-Z02}
    \setCJKfamilyfont{zhsong}{FZShuSong-Z01}
    \setCJKfamilyfont{zhhei}{FZHei-B01}
    \setCJKfamilyfont{zhkai}[BoldFont={FZHei-B01}]{FZKai-Z03}
    \setCJKfamilyfont{zhfs}[BoldFont={FZHei-B01}]{FZFangSong-Z02}
    \newcommand*{\songti}{\CJKfamily{zhsong}}
    \newcommand*{\heiti}{\CJKfamily{zhhei}}
    \newcommand*{\kaishu}{\CJKfamily{zhkai}}
    \newcommand*{\fangsong}{\CJKfamily{zhfs}}
}{\relax}

% 英文字体设置
\ifdefstring{\JOUDER@fonten}{newcm}{
    \RequirePackage[default]{fontsetup}
}{\relax}

\ifdefstring{\JOUDER@fonten}{stixtwo}{
    \RequirePackage[stixtwo]{fontsetup}
}{\relax}

\ifdefstring{\JOUDER@fonten}{libertinus}{
    \RequirePackage[libertinus]{fontsetup}
}{\relax}

\ifdefstring{\JOUDER@fonten}{concrete}{
    % \PassOptionsToPackage{math-style=upright}{unicode-math}
    \RequirePackage[concrete]{fontsetup}
}{\relax}

\ifdefstring{\JOUDER@fonten}{euler}{
    \PassOptionsToPackage{math-style=upright, mathrm=text}{unicode-math}
    \RequirePackage[concrete]{fontsetup}
    \setmathfont{euler.otf}
}{\relax}

\ifdefstring{\JOUDER@fonten}{cm}{
    \RequirePackage[OT1]{fontenc}
    \RequirePackage{amsfonts}
    \renewcommand{\rmdefault}{cmr}
    \renewcommand{\sfdefault}{cmss}
    \renewcommand{\ttdefault}{cmtt}
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

\ctexset{
    punct=kaiming,
}

\usetikzlibrary{shapes.multipart}

\geometry{scale=0.8}
\linespread{1.5}
\setlength{\parskip}{0.8em}
\setlist{labelindent=\parindent, before=\setlength{\itemsep}{0pt}\setlength{\partopsep}{0pt}\setlength{\parsep}{\parskip}}

% \newcommand{\spare}{\begin{center}\vspace*{-2.5em}\rule{\textwidth}{1.5pt}\vspace*{-2em}\end{center}}

\newcommand{\spare}{\begin{center}\vspace*{-2.5em}\tikz{\draw[very thick,line cap=round] (0,0) to (\textwidth-1.2,0);}\vspace*{-2em}\end{center}}

\newenvironment{problem}[1]{\setlength{\parindent}{0cm}\textbf{\problemlabel{} #1}\setlength{\parskip}{0em}\quad}{\par}
\newenvironment{solution}{\setlength{\parindent}{0cm}\setlength{\parskip}{0em}\textbf{\solutionlabel}\quad\kaishu}{\par}