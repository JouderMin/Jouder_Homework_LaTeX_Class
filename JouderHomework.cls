\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{JouderHomework}[2022/08/04 v0.1 JouderHomework document class]

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=JOUDER, prefix=JOUDER@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{JOUDER}{#1}}

\PassOptionsToPackage{math-style=ISO, mathrm=sym}{unicode-math}

\DeclareStringOption[newcm]{fonten}
\DeclareStringOption[founder]{fontcn}

\DeclareVoidOption{newcm}{\ekv{fonten=newcm}}
\DeclareVoidOption{stixtwo}{\ekv{fonten=stixtwo}}
\DeclareVoidOption{concrete}{\ekv{fonten=concrete}}

\DeclareVoidOption{ctex}{\ekv{fontcn=ctex}}
\DeclareVoidOption{founder}{\ekv{fontcn=founder}}

\ProcessKeyvalOptions*\relax

\LoadClass[a4paper]{article}

\RequirePackage{amsmath}
\RequirePackage{geometry}
\RequirePackage{tikz}

% 英文字体设置
\ifdefstring{\JOUDER@fonten}{newcm}{
    \RequirePackage[default]{fontsetup}
}{\relax}

\ifdefstring{\JOUDER@fonten}{stixtwo}{
    \RequirePackage[stixtwo]{fontsetup}
}{\relax}

\ifdefstring{\JOUDER@fonten}{concrete}{
    % \PassOptionsToPackage{math-style=upright}{unicode-math}
    \RequirePackage[concrete]{fontsetup}
}{\relax}

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

\ctexset{
    punct=kaiming,
}


\geometry{scale=0.8}
\linespread{1.5}
\setlength{\parskip}{0.8em}

% \newcommand{\spare}{\begin{center}\vspace*{-2.5em}\rule{\textwidth}{1.5pt}\vspace*{-2em}\end{center}}

\newcommand{\spare}{\begin{center}\vspace*{-2.5em}\tikz{\draw[very thick,line cap=round] (0,0) to (\textwidth-1.2,0);}\vspace*{-2em}\end{center}}

\newenvironment{problem}[1]{\setlength{\parindent}{0cm}\textbf{题 #1}\setlength{\parskip}{0em}\quad}{\\}
\newenvironment{solution}{\setlength{\parindent}{0cm}\setlength{\parskip}{0em}\textbf{解}\quad\it}{}