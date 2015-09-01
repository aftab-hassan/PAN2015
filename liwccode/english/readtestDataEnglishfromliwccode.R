#readtestDataEnglishfromliwccode.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\testDataEnglish.csv') == TRUE)
{
	cat(paste("liwccode/english/testDataEnglish.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\testDataEnglish.csv')
	print(df[1,1])
}else
{
	cat(paste("liwccode/english/testDataEnglish.csv does not exist\n"))
}