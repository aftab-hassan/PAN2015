#readtestplusliwcdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\italian\\testplusliwc.csv') == TRUE)
{
	cat(paste("liwccode/italian/testplusliwc.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\italian\\testplusliwc.csv')
	print(df[1,])
}else
{
	cat(paste("liwccode/italian/testplusliwc.csv does not exist\n"))
}

