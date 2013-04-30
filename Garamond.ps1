$regexGoudyOlSt = [regex]'(GoudyOlSt BT)';
$regexLayoutBlock = [regex]'\\layout\s*{';
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
$regex69 = [regex]'(\s|^)%6x9\s*';

$files = (ls -filter *.ly);
foreach ($_ in $files) {
  if($_.Name -eq 'Util.ly') {
    continue;
  }
  echo $_.Name
  $f = Get-Content $_ -Encoding UTF8;
  $f = $f -replace $regexGoudyOlSt,"Garamond Premier Pro";
  $f = $f -replace $regexLayoutBlock,"\layout {
\context {
  \Lyrics
  \override LyricText #'font-size = #1.3
}";
  $content = $f -replace $regex69,'$1';
  $content | out-file ("Garamond\" + $_.Name) -Encoding UTF8;
}