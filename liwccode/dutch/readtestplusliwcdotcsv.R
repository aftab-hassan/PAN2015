#readtestplusliwcdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\dutch\\testplusliwc.csv') == TRUE)
{
	cat(paste("liwccode/dutch/testplusliwc.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\dutch\\testplusliwc.csv')
	print(df[1,])
}else
{
	cat(paste("liwccode/dutch/testplusliwc.csv does not exist\n"))
}

