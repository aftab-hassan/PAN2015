#readresultsAgeGenderdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputDutch\\resultsAgeGender.csv') == TRUE)
{
	cat(paste("IntermediatetestOutputDutch/resultsAgeGender.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputDutch\\resultsAgeGender.csv')
	print(df[1,])
}else
{
	cat(paste("IntermediatetestOutputDutch/resultsAgeGender.csv does not exist\n"))
}