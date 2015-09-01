#readtestDataEnglishfromliwccode.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\dutch\\testDataDutch.csv') == TRUE)
{
	cat(paste("liwccode/dutch/testDataDutch.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\dutch\\testDataDutch.csv')
	print(df[1,1])
}else
{
	cat(paste("liwccode/dutch/testDataDutch.csv does not exist\n"))
}