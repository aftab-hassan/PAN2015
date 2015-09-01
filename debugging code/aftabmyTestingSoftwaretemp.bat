::./aftabmytestingsoftwaretemp.bat -c $inputdataset -r $inputrun -o $outputDir
::aftabmyTestingSoftwaretemp.bat -i "E:\author-profiling\pan15-author-profiling-training-dataset-english-2015-04-23" -o "C:\Users\arroju15\pansubmission\FinalCode\aftabtestoutput"

echo off
set testpath=%2
::set trainoutput=%4 ::"C:\Users\arroju15\pansubmission\Output"
set testoutput=%4
set intermediateoutput="C:\Users\arroju15\pansubmission\FinalCode\intermediatetestoutput"
::I think 'trainoutput' above is not needed, the resultsAgeGender.csv we are writing there is not output of training, it's part of final result
::I think even intermediateoutput is not needed, Rscript can directly read from where java and python are outputting

set trainoutput = %testoutput%

echo "1.1-bat"
cd C:\\Users\\arroju15\\pansubmission\\FinalCode\\src
chdir
echo "1.2-bat"
javac extraction1\User.java
echo "1.3-bat"
javac extraction1\MainTest.java
echo "1.4-bat"
java extraction1.MainTest %testpath% %intermediateoutput% "testDataEnglish.csv"
echo "1.5-bat"
cd..
echo "1.6-bat"

::python Extraction1Test.py %intermediateoutput% "testDataEnglish.csv" "dataExtr1.csv"
::python testModel.py %intermediateoutput% "testDataEnglish.csv" %intermediateoutput% "resultsAgeGender.csv" %trainoutput%
::echo "2-bat"

::set path1=%intermediateoutput%\testDataEnglish.csv
::python adjustForR.py %path1% "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english" testDataEnglish.csv %intermediateoutput%\resultsAgeGender.csv
::echo "3-bat"

::right now, testDataEnglish.csv and dataExtr1.csv are in the intermediateoutput path : C:\Users\arroju15\pansubmission\FinalCode\testOutput
::copy this to C::\Users\arroju15\pansubmission\FinalCode\liwccode\english\
::Rscript copytotestlocation.R
::echo "4-bat"

::uncomment these
::Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\generateLIWCtest.R"
::java -jar "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\englishmyjar.jar" > "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\commaseparatedresults.csv" 
::Rscript "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\roundtotwo.R"
::copy "C:\Users\arroju15\pansubmission\FinalCode\liwccode\english\commaseparatedresults.csv" "C:\Users\arroju15\pansubmission\FinalCode\testOutput\commaseparatedresults.csv" 

::Mounica, did I delete anything from the next line by mistake. just check
::python toxml.py %intermediateoutput%\resultsAgeGender.csv %intermediateoutput%\commaseparatedresults.csv %testoutput% "en"