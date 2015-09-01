#readresultsAgeGenderdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputItalian\\resultsAgeGender.csv') == TRUE)
{
	cat(paste("IntermediatetestOutputItalian/resultsAgeGender.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputItalian\\resultsAgeGender.csv')
	print(df[1,])
}else
{
	cat(paste("IntermediatetestOutputItalian/resultsAgeGender.csv does not exist\n"))
}