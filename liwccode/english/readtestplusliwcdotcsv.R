#readtestplusliwcdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\testplusliwc.csv') == TRUE)
{
	cat(paste("liwccode/english/testplusliwc.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\testplusliwc.csv')
	print(df[1,])
}else
{
	cat(paste("liwccode/english/testplusliwc.csv does not exist\n"))
}

