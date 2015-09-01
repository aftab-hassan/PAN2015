df = read.csv("C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\commaseparatedresults.csv")

for(i in 1:nrow(df))
{
	for(j in 1:ncol(df))
	{
		df[i,j]	= round(df[i,j],2)
	}
}

write.csv(df,"C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\commaseparatedresults.csv",row.names=FALSE)
write.csv(df,"C:\\Users\\arroju15\\pansubmission\\FinalCode\\intermediatetestoutput\\commaseparatedresults.csv",row.names=FALSE)