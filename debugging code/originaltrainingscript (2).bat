echo off
set trainpath=%2
set trainoutput=%4

cd src
javac extraction1\User.java
javac extraction1\Main.java
java extraction1.Main %trainpath% %trainoutput% "trainDataEnglish.csv"
cd ..

echo "minus one"
python Extraction1.py %trainoutput% "trainDataEnglish.csv" "dataExtr1.csv" 
python trainModel.py %trainoutput% "trainDataEnglish.csv"
echo "zero"

set path1=%trainoutput%/trainDataEnglish.csv
echo "one"
set path2=%trainoutput%/dataExtr1.csv
echo "two"
echo %path1%
echo "three"
echo %path2%
echo "four"
copy %path1% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english"
echo "five"
copy %path2% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english"
echo "six"

::Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\generateLIWCtrain.R"