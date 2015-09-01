echo off
testpath=$2
testoutput=$4
intermediateoutput="C:\Users\arroju15\pansubmission\FinalCode\testOutput"
java -jar ExtTrain.jar $testpath $intermediateoutput "testDataEnglish.csv"