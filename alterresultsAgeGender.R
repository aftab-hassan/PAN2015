#C:\\Users\\arroju15\\pansubmission\\FinalCode\\intermediatetestoutput\\resultsAgeGender.csv
#Duh! code is bad, but I don't want to take ay chances at this point by taking the intermediate path as argument, and appending to get the path

args = commandArgs(TRUE)
lang = args[1]

if(lang=="en")
{
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\intermediatetestoutput\\resultsAgeGender.csv')
	df$id = df$userId
	df$age_group = df$age
	df$userId = NULL
	df$age = NULL
	df$age_group = as.character(df$age_group)
	df$age_group = tolower(df$age_group)
	df$gender = as.character(df$gender)
	df[which(df$gender=="M"),"gender"] = "male"
	df[which(df$gender=="F"),"gender"] = "female"
	write.csv(df,'C:\\Users\\arroju15\\pansubmission\\FinalCode\\intermediatetestoutput\\resultsAgeGender.csv',row.names=FALSE)
}else if(lang=="es")
{
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputSpanish\\resultsAgeGender.csv')
	df$id = df$userId
	df$age_group = df$age
	df$userId = NULL
	df$age = NULL
	df$age_group = as.character(df$age_group)
	df$age_group = tolower(df$age_group)
	df$gender = as.character(df$gender)
	df[which(df$gender=="M"),"gender"] = "male"
	df[which(df$gender=="F"),"gender"] = "female"
	write.csv(df,'C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputSpanish\\resultsAgeGender.csv',row.names=FALSE)
}else if(lang=="it")
{
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputItalian\\resultsAgeGender.csv')
	df$id = df$userId
	df$userId = NULL
	df$gender = as.character(df$gender)
	df[which(df$gender=="M"),"gender"] = "male"
	df[which(df$gender=="F"),"gender"] = "female"
	write.csv(df,'C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputItalian\\resultsAgeGender.csv',row.names=FALSE)
}else if(lang=="nl")
{
	df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputDutch\\resultsAgeGender.csv')
	df$id = df$userId
	df$userId = NULL
	df$gender = as.character(df$gender)
	df[which(df$gender=="M"),"gender"] = "male"
	df[which(df$gender=="F"),"gender"] = "female"
	write.csv(df,'C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputDutch\\resultsAgeGender.csv',row.names=FALSE)
}