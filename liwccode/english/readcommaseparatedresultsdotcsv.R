#readcommaseparatedresultsdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\commaseparatedresults.csv') == TRUE)
{
	cat(paste("liwccode/english/commaseparatedresults.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\commaseparatedresults.csv')
	print(df[1,])
}else
{
	cat(paste("liwccode/english/commaseparatedresults.csv does not exist\n"))
}