#readtestDataEnglishdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputItalian\\testDataItalian.csv') == TRUE)
{
	cat(paste("IntermediatetestOutputItalian/testDataItalian.csv exists\n"))
	df =read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputItalian\\testDataItalian.csv')
	print(df[1,1])
}else
{
	cat(paste("IntermediatetestOutputItalian/testDataItalian.csv does not exist\n"))
}