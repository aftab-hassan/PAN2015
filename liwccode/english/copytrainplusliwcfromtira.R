args = commandArgs(TRUE)

path = paste0(args[1],"\\trainplusliwc.csv");
df = read.csv(path)
write.csv(df,'C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\trainplusliwc.csv',row.names=FALSE)
cat(paste("copied",path,"to liwccode-english-trainplusliwc.csv"))