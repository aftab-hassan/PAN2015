echo off
set trainpath=%2
set trainoutput=%4
set intermediateoutput="C:\Users\arroju15\pansubmission\FinalCode\IntermediatetrainOutputItalian"

cd src
javac extraction1\User.java
javac extraction1\Main.java
java extraction1.Main %trainpath% %intermediateoutput% "trainDataItalian.csv"
cd ..

python Extraction1.py %intermediateoutput% "trainDataItalian.csv" "dataExtr1.csv"
python trainModelwoAge.py %trainoutput% %intermediateoutput% "trainDataItalian.csv"

set path1=%intermediateoutput%\trainDataItalian.csv
set path2=%intermediateoutput%\dataExtr1.csv

copy %path1% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian"
copy %path2% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\generateLIWCtrain.R" %trainoutput%
copy "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\trainplusliwc.csv" %trainoutput%
