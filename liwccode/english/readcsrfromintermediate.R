#readcsrfromintermediate.R
#readcommaseparatedresultsdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\intermediatetestoutput\\commaseparatedresults.csv') == TRUE)
{
	cat(paste("intermediatetestoutput/commaseparatedresults.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\intermediatetestoutput\\commaseparatedresults.csv')
	print(df[1,])
}else
{
	cat(paste("intermediatetestoutput/commaseparatedresults.csv does not exist\n"))
}