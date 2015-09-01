echo off
set trainpath=%1
set trainoutput=%2
javac Main.java
java Main %trainpath% %trainoutput% "trainDataEnglish.csv"
python Extraction1.py %trainoutput% "trainDataEnglish.csv" "dataExtr1.csv" 
python trainModel.py %trainoutput% "trainDataEnglish.csv"