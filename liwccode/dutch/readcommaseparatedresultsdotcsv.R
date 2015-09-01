#readcommaseparatedresultsdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\dutch\\commaseparatedresults.csv') == TRUE)
{
	cat(paste("liwccode/dutch/commaseparatedresults.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\dutch\\commaseparatedresults.csv')
	print(df[1,])
}else
{
	cat(paste("liwccode/dutch/commaseparatedresults.csv does not exist\n"))
}