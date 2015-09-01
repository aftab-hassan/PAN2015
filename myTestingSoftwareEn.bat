echo off
set testpath=%2 
set trainoutput=%4 
set testoutput=%6
set intermediateoutput=C:\Users\arroju15\pansubmission\FinalCode\intermediatetestoutput

cd C:\Users\arroju15\pansubmission\FinalCode\src
javac extraction1\User.java
javac extraction1\MainTest.java
java extraction1.MainTest %testpath% %intermediateoutput% "testDataEnglish.csv"
cd..
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\readtestDataEnglishdotcsv.R"
echo "1-bat"
echo.
echo.

python Extraction1Test.py %intermediateoutput% "testDataEnglish.csv" "dataExtr1.csv"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\readdataExtr1dotcsv.R"
echo "2-bat"
echo.
echo.

python testModel.py %intermediateoutput% "testDataEnglish.csv" %intermediateoutput% "resultsAgeGender.csv" %trainoutput%
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\readresultsAgeGenderdotcsv.R"
echo "3-bat"
echo.
echo.

set path1=%intermediateoutput%\testDataEnglish.csv
python adjustForR.py %path1% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english" testDataEnglish.csv %intermediateoutput%\resultsAgeGender.csv
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\readtestDataEnglishfromliwccode.R"
echo "4-bat"
echo.
echo.

Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\copytotestlocation.R"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\readtestdataExtr1fromliwccode.R"
echo "5-bat"
echo.
echo.

Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\generateLIWCtest.R"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\readtestplusliwcdotcsv.R"
echo "6-bat"
echo.
echo.

java -jar "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\englishmyjar.jar" > "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\commaseparatedresults.csv" 
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\readcommaseparatedresultsdotcsv.R"
echo "7-bat"
echo.
echo.

Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\roundtotwo.R"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\readcsrfromintermediate.R"
echo "8-bat"
echo.
echo.

Rscript alterresultsAgeGender.R "en"
echo "9-bat"
echo.
echo.

echo "aft calling toxml.py"
python toxml.py "C:\Users\arroju15\pansubmission\FinalCode\intermediatetestoutput\resultsAgeGender.csv" "C:\Users\arroju15\pansubmission\FinalCode\intermediatetestoutput\commaseparatedresults.csv" %testoutput% "en"
echo "10-bat"
echo.
echo.