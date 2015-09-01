#readtestDataEnglishfromliwccode.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\italian\\testDataItalian.csv') == TRUE)
{
	cat(paste("liwccode/italian/testDataItalian.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\italian\\testDataItalian.csv')
	print(df[1,1])
}else
{
	cat(paste("liwccode/italian/testDataItalian.csv does not exist\n"))
}