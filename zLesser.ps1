$regexPageNum = [regex] '(?<=first-page-number\s+=\s+\#)(\d+)';
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
$regex8511 = [regex]'(\s|^)%8\.5x11\s*';
$regex69 = [regex]'(\s|^)%6x9\s*';

$map = @{14 = 1; 12 = 2; 13 = 3; 15 = 4; 16 = 5; 17 = 6; 18 = 7; 20 = 8; 21 = 9; 22 = 10; 23 = 11; 24 = 12; 26 = 14; 28 = 16; 30 = 18; 32 = 20; 33 = 21; 34 = 22; 35 = 23; 39 = 24; 40 = 25; 41 = 26; 42 = 27; 46 = 28; 47 = 29; 48 = 30; 49 = 31; 50 = 32; 52 = 34; 54 = 36; 55 = 37; 56 = 38; 58 = 40; 60 = 42; 63 = 44; 64 = 45; 65 = 46; 66 = 47; 67 = 48; 69 = 49; 72 = 50; 73 = 51; 74 = 52; 75 = 53; 76 = 54; 78 = 56; 85 = 57; 80 = 58; 89 = 62; 95 = 63; 92 = 64; 96 = 66; 98 = 67; 100 = 68; 104 = 69; 105 = 70; 106 = 71; 107 = 72; 113 = 73; 108 = 74; 110 = 76; 111 = 77; 114 = 78; 112 = 80; 116 = 81; 124 = 82; 143 = 84; 147 = 85; 144 = 86; 148 = 88; 152 = 89; 162 = 90; 171 = 91; 175 = 92; 176 = 93; 174 = 94; 177 = 95; 172 = 96; 182 = 97; 180 = 98; 201 = 100; };
foreach($_ in $map.GetEnumerator()) {
    $oldPage = [string]$_.Name;
    $newPage = [string]$_.Value;
    
    if($oldPage.Length -eq 1) { $oldPage = '00' + $oldPage; }
        elseif($oldPage.Length -eq 2) { $oldPage = '0' + $oldPage; }
    if($newPage.Length -eq 1) { $newPage = '00' + $newPage; }
        elseif($newPage.Length -eq 2) { $newPage = '0' + $newPage; }
    
    $file = (ls -filter ($oldPage + '*.ly'));
    while($file -eq $null) {
        $oldPage = [string]($oldPage - 1);
        if($oldPage.Length -eq 1) { $oldPage = '00' + $oldPage; }
            elseif($oldPage.Length -eq 2) { $oldPage = '0' + $oldPage; }
        $file = (ls -filter ($oldPage + '*.ly'));
    }
    $newName = $file.Name -replace $oldPage,$newPage;
    echo $newName;
    $f = Get-Content $file -Encoding UTF8;
    $f = $f -replace $regexOuterMargin,"0.37\in";
    $f = $f -replace $regexInnerMargin,"0.44\in";
    $f = $f -ireplace $regexPageNum, $newPage;
    $f = $f -replace "%IF_NOT_LESSER","%{";
    $f = $f -replace "%END_IF_NOT_LESSER","%}";
    $f = $f -replace "%{IF_LESSER","%IF_LESSER";
    $f = $f -replace "%}%END_IF_LESSER","%END_IF_LESSER";
    $f = $f -replace $regexGoudyOlSt,"Garamond Premier Pro";
    $f = $f -replace $regexLayoutBlock,"\layout {
\context {
  \Lyrics
  \override LyricText #'font-size = #1.3
}";
  $content = $f -replace $regex69,'$1';
  $content | out-file ("Lesser\" + $newName) -Encoding UTF8;
}