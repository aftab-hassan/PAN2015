#readtestDataEnglishdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputDutch\\testDataDutch.csv') == TRUE)
{
	cat(paste("IntermediatetestOutputDutch/testDataDutch.csv exists\n"))
	df =read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputDutch\\testDataDutch.csv')
	print(df[1,1])
}else
{
	cat(paste("IntermediatetestOutputDutch/testDataDutch.csv does not exist\n"))
}