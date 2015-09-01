echo off
set testpath=%2 ::"C:\Users\arroju15\pansubmission\testFolder"
set trainoutput=%4 ::"C:\Users\arroju15\pansubmission\Output"
set testoutput=%6 ::"C:\Users\arroju15\pansubmission\testOUtput"
set intermediateoutput=C:\Users\arroju15\pansubmission\FinalCode\testOutput
::I think 'trainoutput' above is not needed, the resultsAgeGender.csv we are writing there is not output of training, it's part of final result
::I think even intermediateoutput is not needed, Rscript can directly read from where java and python are outputting

cd C:\Users\arroju15\pansubmission\FinalCode\src
javac extraction1\User.java
javac extraction1\MainTest.java
java extraction1.MainTest %testpath% %intermediateoutput% "testDataEnglish.csv"
cd..
echo "1-bat"