﻿\version "2.14.2"
\include "util.ly"
\header {
  title = \markup{\override #'(font-name . "Garamond Premr Pro Smbd Subh"){ \abs-fontsize #15 \smallCapsOldStyle"Ad cantus lætitiæ"}}
  poet = \markup\oldStyleNum"13th Century Manuscript at Stuttgart"
  meter = \markup\oldStyleNum"English by George Ratcliffe Woodward (1848–1934)"
  composer = \markup\concat  {"As found in " \italic "Piæ Cantiones" \oldStyleNum", 1582"}
  tagline = \markup\concat { "from " \italic "The Cowley Carol Book" \oldStyleNum", 1919"}
}
\paper {
  %print-all-headers = ##f
  paper-height = 9\in
  paper-width = 6\in
  indent = 0\in
  %system-system-spacing = #'((basic-distance . 10) (padding . 0))
  %system-system-spacing =
  %  #'((basic-distance . 0)
  %     (minimum-distance . 0)
  %     (padding . -0.35)
  %     (stretchability . 100))
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  two-sided = ##t
  inner-margin = 0.5\in
  outer-margin = 0.25\in
  top-margin = 0.25\in
  bottom-margin = 0.25\in
  first-page-number = #146
  print-first-page-number = ##t
  headerLine = \markup{ \smallCapsOldStyle"christmas"}
  oddHeaderMarkup = \markup\fill-line{
     \abs-fontsize #8.5
     \combine 
        \fill-line{"" \on-the-fly #print-page-number-check-first
        \oldStylePageNum""
        }
        \fill-line{\headerLine}
  }
  evenHeaderMarkup = \markup {
     \abs-fontsize #8.5
     \combine
        \on-the-fly #print-page-number-check-first
        \oldStylePageNum""
        \fill-line{\headerLine}
  }
}
#(set-global-staff-size 15) \paper{ #(define fonts (make-pango-font-tree "GoudyOlSt BT" "Garamond Premier Pro" "Garamond Premier Pro" (/ 15 20))) }
global = {
  \key f \major
  \time 4/4
  \autoBeamOff
}

sopMusic = \relative c' {
  
}
sopWords = \lyricmode {
  
}

altoMusic = \relative c' {
  \oneVoice
  
  \partial 4 f4^"Alto" |
  a bes c a |
  bes8([ a] g4) f\fermata f |
  a bes c a |
  
  bes8[( a] g4) f\fermata b\rest |
  f d e c |
  d e f g |
  bes8[( a] g4) f2\fermata \bar "|." \break
  
  
  \once \override Score.RehearsalMark #'self-alignment-X = #LEFT
  \mark \markup \italic "The same, in English"
  \partial 4 f4^"Alto" |
  a bes c a |
  bes8([ a] g4) f\fermata f |
  a bes c a |
  
  bes8[( a] g4) f\fermata b\rest |
  f d e c |
  d e f g |
  bes8[( a] g4) f2\fermata \bar "|."
}
altoWords = \lyricmode {
  \set stanza = #"1. "
  Ad can -- tus læ -- ti -- ti -- æ
  Nos in -- vi -- tat ho -- di -- e
  Spes et a -- mor pa -- tri -- æ Cæ -- le -- stis.
  
  \set stanza = #"1. "
  Love and hope of heav’n -- ly __ rest,
  And the song of such as __ fest
  To -- day bid us do our best En -- deav -- or.
}
bassWords = \lyricmode {
  \set stanza = #"1. "
  Ad can -- tus læ -- ti -- ti -- æ
  Nos in -- vi -- tat ho -- di -- e
  Spes et a -- mor pa -- tri -- æ Cæ -- le -- stis.
  
  \set stanza = #"1. "
  Love and hope of heav’n -- ly rest,
  And the song of such as fest
  To -- day bid us do our __ best En -- deav -- or.
}
altoWordsII = \lyricmode {
%\markup\italic
  \set stanza = #"2. "
  Na -- tus est E -- ma -- nu -- el,
  Quod præ -- di -- xit Ga -- bri -- el,
  Un -- de sanc -- tus Da -- ni -- el Est te -- stis.
  
  \set stanza = #"2. "
  Born is our E -- man -- u -- el,
  As fore -- told by Ga -- bri -- el,
  E’en as doth Saint Dan -- i -- el As -- sev -- er.
}
altoWordsIII = \lyricmode {
  \set stanza = #"3. "
  Er -- go nos cum gau -- di -- o,
  No -- stra si -- mul con -- ti -- o
  Be -- ne -- di -- cat Do -- mi -- no Ju -- bi -- lo.
  
  \set stanza = #"3. "
  Where -- fore let th’as -- sem -- bly __ all
  Bless, in ca -- rol and cho -- ral,
  Je -- sus on this fes -- tiv -- al, And ev -- er.
}

bassWordsIII = \lyricmode {
  \set stanza = #"3. "
  Er -- go nos cum gau -- di -- o,
  No -- stra si -- mul con -- ti -- o
  Be -- ne -- di -- cat Do -- mi -- no Ju -- bi -- lo.
  
  \set stanza = #"3. "
  Where -- fore let th’as -- sem -- bly all
  Bless, in ca -- rol and cho -- ral,
  Je -- sus on this fes -- tiv -- al, And ev -- er.
}
altoWordsIV = \lyricmode {
  \set stanza = #"4. "
  \set ignoreMelismata = ##t
}
altoWordsV = \lyricmode {
  \set stanza = #"5. "
  \set ignoreMelismata = ##t
}
altoWordsVI = \lyricmode {
  \set stanza = #"6. "
  \set ignoreMelismata = ##t
}
tenorMusic = \relative c' {
  
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  \oneVoice
  
  d4\rest^"Basso" |
  f d e c |
  d e f\fermata r |
  f d e c |
  
  d e f\fermata f |
  a bes c a |
  bes8[( a] g4) f c |
  d( e) f2\fermata \bar "|."
  
  
  d4\rest^"Basso" |
  f d e c |
  d e f\fermata r |
  f d e c |
  
  d e f\fermata f |
  a bes c a |
  bes8[( a] g4) f c |
  d( e) f2\fermata \bar "|."
}

pianoRH = \relative c' {
  
}
pianoLH = \relative c' {
  
}

\score {
  <<
   \new ChoirStaff <<
    \new Staff = women <<
      \new Voice = "altos" { << \global \altoMusic >> }
    >>
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "altos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "basses" { << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignBelowContext = #"men" } \lyricsto "basses" \bassWordsIII
    \new Lyrics \with { alignBelowContext = #"men" } \lyricsto "basses" \altoWordsII
    \new Lyrics \with { alignBelowContext = #"men" } \lyricsto "basses" \bassWords
  >>
%    \new PianoStaff << \new Staff { \new Voice { \pianoRH } } \new Staff { \clef "bass" \pianoLH } >>
  >>
  \layout {
    \context {
      \Score
      %\override SpacingSpanner #'base-shortest-duration = #(ly:make-moment 1 8)
      %\override SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 4)
    }
    \context {
      % Remove all empty staves
      % \Staff \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t
    }
    \context {
      \Lyrics
      \override LyricText #'X-offset = #center-on-word
    }
  }
  \midi {
    \tempo 4 = 100
    \set Staff.midiInstrument = "flute"
  
    \context {
      \Voice
      \remove "Dynamic_performer"
    }
  }
}
