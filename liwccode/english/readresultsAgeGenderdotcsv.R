#readresultsAgeGenderdotcsv.R
if(file.exists('C:\\Users\\arroju15\\pansubmission\\FinalCode\\intermediatetestoutput\\resultsAgeGender.csv') == TRUE)
{
	cat(paste("intermediatetestoutput/resultsAgeGender.csv exists\n"))
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\intermediatetestoutput\\resultsAgeGender.csv')
	print(df[1,])
}else
{
	cat(paste("intermediatetestoutput/resultsAgeGender.csv does not exist\n"))
}