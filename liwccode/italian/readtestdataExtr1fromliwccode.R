#readtestdataExtr1fromliwccode.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\italian\\testdataExtr1.csv') == TRUE)
{
	cat(paste("liwccode/italian/testdataExtr1.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\italian\\testdataExtr1.csv')
	print(df[1,1])
}else
{
	cat(paste("liwccode/italian/testdataExtr1.csv does not exist\n"))
}