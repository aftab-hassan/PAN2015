echo off
testpath=$2
testoutput=$4
intermediateoutput="C:\Users\arroju15\pansubmission\FinalCode\testOutput"

#cd C:\Users\arroju15\pansubmission\FinalCode\src
javac "C:\Users\arroju15\pansubmission\FinalCode\src\extraction1\User.java"
javac "C:\Users\arroju15\pansubmission\FinalCode\src\extraction1\MainTest.java"
java extraction1.MainTest $testpath $intermediateoutput "testDataEnglish.csv"
#cd..

python Extraction1Test.py $intermediateoutput "testDataEnglish.csv" "dataExtr1.csv"
python testModel.py $intermediateoutput "testDataEnglish.csv" $intermediateoutput "resultsAgeGender.csv"

path1=$intermediateoutput"\testDataEnglish.csv"
python adjustForR.py $path1 "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english" testDataEnglish.csv $intermediateoutput"\resultsAgeGender.csv"

cp $intermediateoutput"\dataExtr1.csv" "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\testdataExtr1.csv"


#testDataEnglish.csv should have age,gender, nusermentions.. and 0 for the five personality scores
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\generateLIWCtest.R"
java -jar "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\englishmyjar.jar" > "C:\Users\arroju15\pansubmission\FinalCode\testOutput\commaseparatedresults.csv" 

#Mounica, did I delete anything from the next line by mistake. just check
python toxml.py $intermediateoutput"\resultsAgeGender.csv" $intermediateoutput"\commaseparatedresults.csv" $testoutput "en"