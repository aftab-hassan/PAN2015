args = commandArgs(TRUE)

path = paste0(args[1],"\\trainplusliwc.csv");
print(path)
df = read.csv(path)
print(nrow(df))
print(ncol(df))
print(df[1,])