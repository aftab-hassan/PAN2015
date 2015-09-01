echo off
set testpath=%2 
set trainoutput=%4 
set testoutput=%6
set intermediateoutput=C:\Users\arroju15\pansubmission\FinalCode\IntermediatetestOutputSpanish
echo "1-bat"

cd C:\Users\arroju15\pansubmission\FinalCode\src
javac extraction1\User.java
javac extraction1\MainTest.java
java extraction1.MainTest %testpath% %intermediateoutput% "testDataSpanish.csv"
cd..
echo "2-bat"

python Extraction1Test.py %intermediateoutput% "testDataSpanish.csv" "dataExtr1.csv"
python testModel.py %intermediateoutput% "testDataSpanish.csv" %intermediateoutput% "resultsAgeGender.csv" %trainoutput%
echo "3-bat"

set path1=%intermediateoutput%\testDataspanish.csv
python adjustForR.py %path1% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\spanish" testDataspanish.csv %intermediateoutput%\resultsAgeGender.csv
echo "4-bat"

Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\spanish\copytotestlocation.R"
echo "5-bat"

Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\spanish\generateLIWCtest.R"
java -jar "C:\Users\arroju15\pansubmission\FinalCode\liwccode\spanish\spanishmyjar.jar" > "C:\Users\arroju15\pansubmission\FinalCode\liwccode\spanish\commaseparatedresults.csv" 
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\spanish\roundtotwo.R"
echo "6-bat"

Rscript alterresultsAgeGender.R "es"
echo "7-bat"
echo.
echo.

python toxml.py "C:\Users\arroju15\pansubmission\FinalCode\IntermediatetestOutputSpanish\resultsAgeGender.csv" "C:\Users\arroju15\pansubmission\FinalCode\IntermediatetestOutputSpanish\commaseparatedresults.csv" %testoutput% "es"
echo "8-bat"