echo off
trainpath=$2
trainoutput=$4

#cd /cygdrive/c/users/arroju15/pansubmission/FinalCode/src
#javac extraction1/User.java
#javac extraction1/Main.java
javac "C:\Users\arroju15\pansubmission\FinalCode\src\extraction1\User.java"
javac "C:\Users\arroju15\pansubmission\FinalCode\src\extraction1\Main.java"
java extraction1.Main $trainpath $trainoutput "trainDataEnglish.csv"
#cd..

python "C:\Users\arroju15\pansubmission\FinalCode\Extraction1.py" $trainoutput "trainDataEnglish.csv" "dataExtr1.csv" 
python "C:\Users\arroju15\pansubmission\FinalCode\trainModel.py" $trainoutput "trainDataEnglish.csv"

path1=$trainoutput"/trainDataEnglish.csv"
path2=$trainoutput"/dataExtr1.csv"
echo $path1
echo $path2
cp $path1 /cygdrive/c/users/arroju15/pansubmission/FinalCode/liwccode/english
cp $path2 /cygdrive/c/users/arroju15/pansubmission/FinalCode/liwccode/english

Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\generateLIWCtrain.R"