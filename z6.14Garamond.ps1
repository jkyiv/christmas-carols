$regexGoudyOlSt = [regex]'(GoudyOlSt BT)';
$regexLayoutBlock = [regex]'\\layout\s*{';
$regexPageWidth = [regex]'(?<=paper-width\s*=\s*)\d*(?:\.\d*)?\\in';
$regexPageHeight = [regex]'(?<=paper-height\s*=\s*)\d*(?:\.\d*)?\\in';
$regexMargin = [regex]'(?<=(?:bottom|top)-margin\s*=\s*)\d*(?:\.\d*)?\\in';
$regexInnerMargin = [regex]'(?<=inner-margin\s*=\s*)\d*(?:\.\d*)?\\in';
$regexOuterMargin = [regex]'(?<=outer-margin\s*=\s*)\d*(?:\.\d*)?\\in';
$regexTopMargin = [regex]'(?<=top-margin\s*=\s*)\d*(?:\.\d*)?\\in';
$regexBottomMargin = [regex]'(?<=bottom-margin\s*=\s*)\d*(?:\.\d*)?\\in';
$regexGlobal = [regex]'global\s+=\s+\{';

$regexStaffSize = [regex]'(?<=#\(set-global-staff-size\s+)\d*(?:\.\d*)?';
$regexSecondStaff = [regex]'(?<="Garamond Premier Pro" \(/ )\d*(?:\.\d*)?';
$regexAbsFont85 = [regex]'(?<=\\abs-fontsize\s+#)8\.5';
$regexAbsFont15 = [regex]'(?<=\\abs-fontsize\s+#)15';
$regexAbsFont105 = [regex]'(?<=\\abs-fontsize\s+#)10\.5';
$regexAbsFont9 = [regex]'(?<=\\abs-fontsize\s+#)9';
$regex614 = [regex]'(\s|^)%6\.14g?\s*';

$files = (ls -filter *.ly);
foreach ($_ in $files) {
  if($_.Name -eq 'Util.ly') {
    continue;
  }
  echo $_.Name
  $f = Get-Content $_ -Encoding UTF8;
  $f = $f -replace $regex614,'$1';
  $f = $f -replace $regexGoudyOlSt,"Garamond Premier Pro";
  $f = $f -replace "%IF_NOT_6.14","%{";
  $f = $f -replace "%END_IF_NOT_6.14","%}";
  $f = $f -replace "%{IF_6.14","%IF_6.14";
  $f = $f -replace "%}%END_IF_6.14","%END_IF_6.14";
  $f = $f -replace $regexLayoutBlock,"\layout {
\context {
  \Lyrics
  \override LyricText #'font-size = #1
}";
  $f = $f -replace $regexPageWidth,"6.14\in";
  $f = $f -replace $regexPageHeight,"9.21\in";
#  $f = $f -replace $regexStaffSize,"18";
#  $f = $f -replace $regexSecondStaff,"18";
#  $f = $f -replace $regexAbsFont15,"18";
#  $f = $f -replace $regexAbsFont85,"10.5";
#  $f = $f -replace $regexAbsFont105,"12.5";
#  $f = $f -replace $regexAbsFont9,"11";
  
  $f = $f -replace $regexGlobal,'$&
\override Score.BarNumber #''break-visibility = #''#(#f #f #f)';
  
#  $f = $f -replace $regexInnerMargin,"1\in";
  $f = $f -replace $regexOuterMargin,"0.315\in";
  $content = $f -replace $regexInnerMargin,"0.815\in";
  # if only there were 150 or fewer pages...
  #  $content = $f -replace $regexInnerMargin,"0.43\in";
#  if($content -notmatch $regexBottomMargin) {
#    $content = $content -replace $regexOuterMargin,'$&
#  bottom-margin = 0.25\in'
#  }
#  if ($content -notmatch $regexTopMargin) {
#    $content = $content -replace $regexOuterMargin,'$&
#  top-margin = 0.25\in'
#  }
  $content | out-file ("6.14Garamond\" + $_.Name) -Encoding UTF8;
}