echo off
set trainpath=%2
set trainoutput=%4
set intermediateoutput="C:\Users\arroju15\pansubmission\FinalCode\IntermediatetrainOutputSpanish"

cd src
javac extraction1\User.java
javac extraction1\Main.java
java extraction1.Main %trainpath% %intermediateoutput% "trainDataSpanish.csv"
cd ..

python Extraction1.py %intermediateoutput% "trainDataSpanish.csv" "dataExtr1.csv" 
python trainModel.py %trainoutput% %intermediateoutput% "trainDataSpanish.csv"

set path1=%intermediateoutput%\trainDataSpanish.csv
set path2=%intermediateoutput%\dataExtr1.csv

copy %path1% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\spanish"
copy %path2% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\spanish"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\spanish\generateLIWCtrain.R" %trainoutput%
::copy "C:\Users\arroju15\pansubmission\FinalCode\liwccode\spanish\trainplusliwc.csv" %trainoutput%
