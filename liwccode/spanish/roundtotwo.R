df = read.csv("C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\spanish\\commaseparatedresults.csv")

for(i in 1:nrow(df))
{
	for(j in 1:ncol(df))
	{
		df[i,j]	= round(df[i,j],2)
	}
}

write.csv(df,"C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\spanish\\commaseparatedresults.csv",row.names=FALSE)
write.csv(df,"C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputSpanish\\commaseparatedresults.csv",row.names=FALSE)