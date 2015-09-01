#readdataExtr1dotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputItalian\\dataExtr1.csv') == TRUE)
{
	cat(paste("IntermediatetestOutputItalian/dataExtr1.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputItalian\\dataExtr1.csv')
	print(df[1,1])
}else
{
	cat(paste("IntermediatetestOutputItalian/dataExtr1.csv does not exist\n"))
}