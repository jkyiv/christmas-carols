$regexGoudyOlSt = [regex]'(GoudyOlSt BT)';
$regexLayoutBlock = [regex]'\\layout\s*{';
$regexPageWidth = [regex]'(?<=paper-width\s*=\s*)\d*(?:\.\d*)?\\in';
$regexPageHeight = [regex]'(?<=paper-height\s*=\s*)\d*(?:\.\d*)?\\in';
$regexInnerMargin = [regex] 'inner-margin\s*=\s*\d*(?:\.\d*)?\\in';
$regexOuterMargin = [regex] 'outer-margin\s*=\s*\d*(?:\.\d*)?\\in';
$regexTopMargin = [regex] '(?<=(?:top|bottom)-margin\s*=\s*)\d*(?:\.\d*)?\\in';
$regexTwoSided = [regex] '(?<=two-sided\s*=\s*##)t';
$regexFillHeader = [regex] '\\fill-line{\\headerLine[^}]*}[^\n]*\n[^\n]*\n';
$regex614 = [regex]'(\s|^)%6\.14g?\s*';
$files = (ls -filter *.ly);
foreach ($_ in $files) {
  if($_.Name -eq 'Util.ly') {
    continue;
  }
  echo $_.Name
  $f = Get-Content $_ -Encoding UTF8 -Delimiter `0;
  $f = $f -replace $regex614,'$1';
  $f = $f -replace $regexGoudyOlSt,"Garamond Premier Pro";
  $f = $f -replace $regexLayoutBlock,"\layout {
  \context {
    \Lyrics
    \override LyricText #'font-size = #1
  }";
  $f = $f -replace $regexPageWidth,"5.26\in";
  $f = $f -replace $regexPageHeight,"8.4\in";
  $f = $f -replace $regexInnerMargin,"left-margin = 0.09\in";
  $f = $f -replace $regexOuterMargin,"right-margin = 0.01\in";
  
  $f = $f -replace $regexTopMargin,"0.0\in";
  $f = $f -replace $regexTwoSided,"f";
  $f = $f -replace $regexFillHeader,'$0  oddHeaderMarkup = ""
  evenHeaderMarkup = ""
';
  $f | out-file ("playbook\" + $_.Name) -Encoding UTF8;
}