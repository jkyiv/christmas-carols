$regexGoudyOlSt = [regex]'(GoudyOlSt BT)';
$regexLayoutBlock = [regex]'\\layout\s*{';
$regexPageWidth = [regex]'(?<=paper-width\s*=\s*)\d*(?:\.\d*)?\\in';
$regexPageHeight = [regex]'(?<=paper-height\s*=\s*)\d*(?:\.\d*)?\\in';
$regexMargin = [regex]'(?<=(top|bottom)-margin\s*=\s*)\d*(?:\.\d*)?\\in';
$regexTopMargin = [regex]'(?<=top-margin\s*=\s*)\d*(?:\.\d*)?\\in';
$regexInnerMargin = [regex]'(?<=inner-margin\s*=\s*)\d*(?:\.\d*)?\\in';
$regexOuterMargin = [regex]'(?<=outer-margin\s*=\s*)\d*(?:\.\d*)?\\in';
$regexStaffSize = [regex]'(?<!^\s*%.*#\(set-global-staff-size\s+)(?<=#\(set-global-staff-size\s+)\d*(?:\.\d*)?';
$regexSecondStaff = [regex]'(?<!^\s*%.*"Garamond Premier Pro" \(/ )(?<="Garamond Premier Pro" \(/ )\d*(?:\.\d*)?';
$regexAbsFont85 = [regex]'(?<=\\abs-fontsize\s+#)8\.5';
$regexAbsFont15 = [regex]'(?<=\\abs-fontsize\s+#)15';
$regexAbsFont105 = [regex]'(?<=\\abs-fontsize\s+#)10\.5';
$regexAbsFont9 = [regex]'(?<=\\abs-fontsize\s+#)9';
$regex8511 = [regex]'(\s|^)%8\.5x11g?\s*';

$files = (ls -filter *.ly);
foreach ($_ in $files) {
  if($_.Name -eq 'Util.ly') {
    continue;
  }
  echo $_.Name
  $f = Get-Content $_ -Encoding UTF8;
  $f = $f -replace $regexGoudyOlSt,"Garamond Premier Pro";
  $f = $f -replace $regexPageWidth,"8.5\in";
  $f = $f -replace $regexPageHeight,"11\in";
  $f = $f -replace $regexStaffSize,"18";
  $f = $f -replace $regexSecondStaff,"18";
  $f = $f -replace $regexAbsFont15,"18";
  $f = $f -replace $regexAbsFont85,"10.5";
  $f = $f -replace $regexAbsFont105,"12.5";
  $f = $f -replace $regexAbsFont9,"11";
  
  $f = $f -replace $regexInnerMargin,"1\in";
  $f = $f -replace $regexOuterMargin,"0.75\in";
  $f = $f -replace $regexMargin,"0.25\in";
  $f = $f -replace $regexTopMargin,"0.26\in";
  $f = $f -replace $regexLayoutBlock,"\layout {
  \context {
    \Lyrics
    \override LyricText #'font-size = #1.3
  }";
  $content = $f -replace $regex8511,'$1';
  $content | out-file ("8.5garamond\" + $_.Name) -Encoding UTF8;
}