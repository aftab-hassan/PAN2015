echo off
set testpath=%2 
set trainoutput=%4 
set testoutput=%6
set intermediateoutput=C:\Users\arroju15\pansubmission\FinalCode\IntermediatetestOutputItalian
echo "1-bat"

cd C:\Users\arroju15\pansubmission\FinalCode\src
javac extraction1\User.java
javac extraction1\MainTest.java
java extraction1.MainTest %testpath% %intermediateoutput% "testDataItalian.csv"
cd..
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\readtestDataItaliandotcsv.R"
echo "2-bat"
echo.
echo.

python Extraction1Test.py %intermediateoutput% "testDataItalian.csv" "dataExtr1.csv"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\readdataExtr1dotcsv.R"
echo "3-bat"
echo.
echo.

python testModelwoAge.py %intermediateoutput% "testDataItalian.csv" %intermediateoutput% "resultsAgeGender.csv" %trainoutput%
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\readresultsAgeGenderdotcsv.R"
echo "4-bat"
echo.
echo.

set path1=%intermediateoutput%\testDataItalian.csv
python adjustForRwoAge.py %path1% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian" testDataItalian.csv %intermediateoutput%\resultsAgeGender.csv
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\readtestDataItalianfromliwccode.R"
echo "5-bat"
echo.
echo.

Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\copytotestlocation.R"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\readtestdataExtr1fromliwccode.R"
echo "6-bat"
echo.
echo.

Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\generateLIWCtest.R"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\readtestplusliwcdotcsv.R"
echo "7-bat"
echo.
echo.

java -jar "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\italianmyjar.jar" > "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\commaseparatedresults.csv" 
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\readcommaseparatedresultsdotcsv.R"
echo "8-bat"
echo.
echo.

Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\roundtotwo.R"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\readcsrfromintermediate.R"
echo "9-bat"
echo.
echo.

Rscript alterresultsAgeGender.R "it"
Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\italian\readresultsAgeGenderdotcsv.R"
echo "10-bat"
echo.
echo.

python toxml.py "C:\Users\arroju15\pansubmission\FinalCode\IntermediatetestOutputItalian\resultsAgeGender.csv" "C:\Users\arroju15\pansubmission\FinalCode\IntermediatetestOutputItalian\commaseparatedresults.csv" %testoutput% "it"
echo "11-bat"