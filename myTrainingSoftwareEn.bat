echo off
set trainpath=%2
set trainoutput=%4
set intermediateoutput="C:\Users\arroju15\pansubmission\FinalCode\intermediatetrainoutput"

cd src
javac extraction1\User.java
javac extraction1\Main.java
java extraction1.Main %trainpath% %intermediateoutput% "trainDataEnglish.csv"
cd ..



echo "minus one"
python Extraction1.py %intermediateoutput% "trainDataEnglish.csv" "dataExtr1.csv" 
python trainModel.py %trainoutput% %intermediateoutput% "trainDataEnglish.csv"
echo "zero"

set path1=%intermediateoutput%\trainDataEnglish.csv
echo "one"
set path2=%intermediateoutput%\dataExtr1.csv
echo "two"
echo %path1%
echo "three"
echo %path2%
echo "four"
copy %path1% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english"
echo "five"
copy %path2% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english"
echo "six"

Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\generateLIWCtrain.R" %trainoutput%
::copy "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\trainplusliwc.csv" %trainoutput%
echo "back to the batch file"