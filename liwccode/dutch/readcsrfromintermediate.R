#readcsrfromintermediate.R
#readcommaseparatedresultsdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputDutch\\commaseparatedresults.csv') == TRUE)
{
	cat(paste("IntermediatetestOutputDutch/commaseparatedresults.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputDutch\\commaseparatedresults.csv')
	print(df[1,])
}else
{
	cat(paste("IntermediatetestOutputDutch/commaseparatedresults.csv does not exist\n"))
}