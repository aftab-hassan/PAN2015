echo off
set trainpath=%2
set trainoutput=%4
set intermediateoutput="C:\Users\arroju15\pansubmission\FinalCode\IntermediatetrainOutputDutch"

cd src
javac extraction1\User.java
javac extraction1\Main.java
java extraction1.Main %trainpath% %intermediateoutput% "trainDataDutch.csv"
cd ..


python Extraction1.py %intermediateoutput% "trainDataDutch.csv" "dataExtr1.csv" 
python trainModelwoAge.py %trainoutput% %intermediateoutput% "trainDataDutch.csv"

set path1=%intermediateoutput%\trainDataDutch.csv
set path2=%intermediateoutput%\dataExtr1.csv

copy %path1% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch"
copy %path2% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\generateLIWCtrain.R" %trainoutput%
copy "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\trainplusliwc.csv" %trainoutput%
