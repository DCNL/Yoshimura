\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{bta}[2023/12/11 v0.1 卒論概要(拓殖大学情報工学科)]
\newif\if卒論\卒論true
\newif\if概要\概要false
\newif\ifProof\Prooffalse
\DeclareOption{abstract}{\卒論false\概要true}
\DeclareOption{proof}{\Prooftrue}
\ProcessOptions\relax

\if卒論
\LoadClassWithOptions{jsreport}
\RequirePackage[top=25mm,hmargin=15mm,bottom=20mm]{geometry}
\else
\newlength\@colw
\setlength{\@colw}{180mm}
\addtolength{\@colw}{-\parskip}
\ifProof
\LoadClass[dvipdfmx,uplatex,a4paper,10pt]{jsarticle}
\RequirePackage[top=25mm,left=15mm,width=0.5\@colw,bottom=20mm]{geometry}
\else
\LoadClass[dvipdfmx,uplatex,twocolumn,a4paper,10pt]{jsarticle}
\RequirePackage[top=25mm,hmargin=15mm,bottom=20mm]{geometry}
\fi
\fi
\RequirePackage[dvipdfmx]{graphicx}
\RequirePackage{caption3}
\RequirePackage{otf}
\RequirePackage{comment}
%\RequirePackage{overcite}
\RequirePackage{xcolor}
\RequirePackage{ulem}
\RequirePackage{ascmac}
\RequirePackage[dvipdfmx,hidelinks]{hyperref}
\RequirePackage{pxjahyper}
% プログラムリストを入れるための設定
\RequirePackage{listings,jvlisting}
\RequirePackage{jlisting}
\lstset{
  basicstyle={\ttfamily},
  identifierstyle={\small},
  commentstyle={\smallitshape},
  keywordstyle={\small\bfseries},
  ndkeywordstyle={\small},
  stringstyle={\small\ttfamily},
  frame={tb},
  breaklines=true,
  columns=[l]{fullflexible},
  numbers=left,
  xrightmargin=0zw,
  xleftmargin=3zw,
  numberstyle={\scriptsize},
  stepnumber=1,
  numbersep=1zw,
  lineskip=-0.5ex
}

\renewcommand{\labelenumi}{(\theenumi)}

\captionsetup{justification=centering,singlelinecheck=false,belowskip=0pt}
\if概要
\pagestyle{empty}
\renewcommand{\normalsize}{%
    \@setfontsize\normalsize\@xpt{13}%
  \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize
\renewcommand{\scriptsize}{\@setfontsize\scriptsize\@viipt\@viiipt}
\renewcommand{\tiny}{\@setfontsize\tiny\@vpt\@vipt}
\renewcommand{\large}{\@setfontsize\large\@xipt{15}}
\renewcommand{\Large}{\@setfontsize\Large\@xiipt{19}}
\renewcommand{\LARGE}{\@setfontsize\LARGE\@xivpt{21}}
\renewcommand{\huge}{\@setfontsize\huge\@xviipt{25}}
\renewcommand{\Huge}{\@setfontsize\Huge\@xxpt{28}}
\fi

\if卒論
\def\author#1#2{\def\@author{#2}}

\def\supervisor#1#2{%
  #1 & #2 \\
}
\def\supervised#1{
    \def\@supervised{
        指導教員%
        \begin{tabular}[t]{ll}
        #1
        \end{tabular}
    }
}

\renewcommand{\maketitle}{%
    \begin{titlepage}%
        \let\footnotesize\small
        \let\footnoterule\relax
        \let\footnote\thanks
        \null\vfil
        
        \begin{center}%
            卒業論文
            \vskip 60\jsc@mpt
            {\LARGE \@title \par}%
            \vskip 6em%
            2024年度
            \vskip 6em%
            拓殖大学工学部情報工学科
            \par
            {\Large
                \lineskip .75em
                \begin{tabular}[t]{c}%
                    \@author
                \end{tabular}\par
            }%
            \vskip 6em
            {\large \@supervised\par}%
        \end{center}%
      
        \par
        \@thanks\vfil\null
    \end{titlepage}%
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
}%

\else

\def\author#1#2{\def\@author{#1 #2}}
\def\supervisor#1#2{%
  #1 & #2 \\}
\def\supervised#1{\def\@supervised{
    指導教員 \begin{tabular}[t]{ll}
      #1
\end{tabular}}}


\renewcommand{\maketitle}{
  \ifnum \col@number=\@ne \@maketitle
  \else \twocolumn[\@maketitle]%
  \fi
  \thispagestyle{empty}\@thanks
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\p@thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
%%
  \global\let\@subtitle\@empty
  \global\let\@supervisor\@empty
%%
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
%%
  \global\let\date\relax
  \global\let\and\relax
}

\fi

\setcounter{topnumber}{4} % 頁上部の最大float数
\setcounter{bottomnumber}{2} % 頁下部の 〃 
\setcounter{totalnumber}{6} % １頁の 〃 
\setcounter{dbltopnumber}{4} % twocolumn時の頁上部の最大float数 
\renewcommand\topfraction{1} % 頁上部のfloatで占める最大の割合 
\renewcommand\bottomfraction{1} % 頁下部の 〃 
\renewcommand\textfraction{0} % １頁のテキスト部の占める最小割合 
\renewcommand\floatpagefraction{1} % floatが単独頁になるときの最小割合 
\renewcommand\dbltopfraction{1} % twocolumn時の topfraction 
\renewcommand\dblfloatpagefraction{1} % twocolumn時の floatpagefraction

\newcommand{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand{\etitle}[1]{\def\@etitle{#1}}
\newcommand{\esubtitle}[1]{\def\@esubtitle{#1}}
\newcommand{\major}[1]{\def\@major{#1}}
%\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\coexaminer}[1]{\def\@coexaminer{#1}}
\subtitle{\mbox{}}
\esubtitle{}
\coexaminer{}


\if卒論
\else
\def\@maketitle{%
  \begin{minipage}{\@colw}
  \vtop to 14mm {
      \centering\LARGE\sf\@title
  }
  \vtop to 6mm {\large
    \@author \hfill \@supervised\par
  }
  \end{minipage}

}%
\fi


\if卒論
\else
\newcommand{\chapter}{\@startsection{section}{1}{\z@}%
{.001\Cvs \@plus.5\Cdp \@minus.2\Cdp}%
{.3\Cdp}%
{\reset@font\Large\sffamily}}

\renewcommand{\section}{\@startsection{subsection}{2}{\z@}%
{.001\Cvs \@plus.5\Cdp \@minus.2\Cdp}%
{.3\Cdp}%
  {\reset@font\large\sffamily}}

\renewcommand{\subsection}{\@startsection{subsubsection}{3}{\z@}%
  {\z@ \@plus.5\Cdp \@minus \z@}%
  {\z@}%
  {\reset@font\normalsize\sffamily}}

\renewcommand{\subsubsection}{\@startsection{paragraph}{4}{\z@}%
  {\z@}
  {\z@}
  {\reset@font\normalsize\sffamily}}
\fi

\newcommand{\figref}[1]{図\ref{#1}}
\newcommand{\tabref}[1]{表\ref{#1}}

% \renewcommand\citeform[1]{#1)}
% \def\@biblabel#1{#1)}

\def\：{：}


\def\urlj#1{%
   \normalfont \nobreak{\url{#1}}\nobreak}
   
\def\urle#1{%
   \normalfont \nobreak{\url{#1}}\nobreak}
   
\def\refdatej#1{\normalfont （参照{#1}）\<}
\def\refdatee#1{\normalfont (accessed {#1})}
   
\def\doi#1{\normalfont DOI: #1}