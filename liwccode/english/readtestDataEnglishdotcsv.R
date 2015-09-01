#readtestDataEnglishdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\intermediatetestoutput\\testDataEnglish.csv') == TRUE)
{
	cat(paste("intermediatetestoutput/testDataEnglish.csv exists\n"))
	df =read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\intermediatetestoutput\\testDataEnglish.csv')
	print(df[1,1])
}else
{
	cat(paste("intermediatetestoutput/testDataEnglish.csv does not exist\n"))
}