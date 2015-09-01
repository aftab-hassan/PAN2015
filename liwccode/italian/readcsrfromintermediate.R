#readcsrfromintermediate.R
#readcommaseparatedresultsdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputItalian\\commaseparatedresults.csv') == TRUE)
{
	cat(paste("IntermediatetestOutputItalian/commaseparatedresults.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputItalian\\commaseparatedresults.csv')
	print(df[1,])
}else
{
	cat(paste("IntermediatetestOutputItalian/commaseparatedresults.csv does not exist\n"))
}