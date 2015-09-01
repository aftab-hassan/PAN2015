echo off
set testpath=%2 
set trainoutput=%4 
set testoutput=%6
set intermediateoutput=C:\Users\arroju15\pansubmission\FinalCode\IntermediatetestOutputDutch

cd C:\Users\arroju15\pansubmission\FinalCode\src
javac extraction1\User.java
javac extraction1\MainTest.java
java extraction1.MainTest %testpath% %intermediateoutput% "testDataDutch.csv"
cd..
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\readtestDataDutchdotcsv.R"
echo "1-bat"
echo.
echo.

cd C:\Users\arroju15\pansubmission\FinalCode
python Extraction1Test.py %intermediateoutput% "testDataDutch.csv" "dataExtr1.csv"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\readdataExtr1dotcsv.R"
echo "2-bat"
echo.
echo.

python testModelwoAge.py %intermediateoutput% "testDataDutch.csv" %intermediateoutput% "resultsAgeGender.csv" %trainoutput%
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\readresultsAgeGenderdotcsv.R"
echo "3-bat"
echo.
echo.

set path1=%intermediateoutput%\testDataDutch.csv
python adjustForRwoAge.py %path1% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch" testDataDutch.csv %intermediateoutput%\resultsAgeGender.csv
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\readtestDataDutchfromliwccode.R"
echo "4-bat"
echo.
echo.

Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\copytotestlocation.R"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\readtestdataExtr1fromliwccode.R"
echo "5-bat"
echo.
echo.

Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\generateLIWCtest.R"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\readtestplusliwcdotcsv.R"
echo "6-bat"
echo.
echo.

java -jar "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\dutchmyjar.jar" > "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\commaseparatedresults.csv" 
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\readcommaseparatedresultsdotcsv.R"
echo "7-bat"
echo.
echo.

Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\roundtotwo.R"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\readcsrfromintermediate.R"
echo "8-bat"
echo.
echo.

Rscript alterresultsAgeGender.R "nl"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\dutch\readresultsAgeGenderdotcsv.R"
echo "9-bat"
echo.
echo.

python toxml.py "C:\Users\arroju15\pansubmission\FinalCode\IntermediatetestOutputDutch\resultsAgeGender.csv" "C:\Users\arroju15\pansubmission\FinalCode\IntermediatetestOutputDutch\commaseparatedresults.csv" %testoutput% "nl"
echo "10-bat"