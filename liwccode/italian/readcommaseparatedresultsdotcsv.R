#readcommaseparatedresultsdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\italian\\commaseparatedresults.csv') == TRUE)
{
	cat(paste("liwccode/italian/commaseparatedresults.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\italian\\commaseparatedresults.csv')
	print(df[1,])
}else
{
	cat(paste("liwccode/italian/commaseparatedresults.csv does not exist\n"))
}