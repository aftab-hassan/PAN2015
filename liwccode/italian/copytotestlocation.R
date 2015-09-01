#right now, testDataEnglish.csv and dataExtr1.csv are in the intermediateoutput path : C:\\Users\\arroju15\\pansubmission\\FinalCode\\testOutput
#copy this to C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\

#dftestdataenglish = read.csv("C:\\Users\\arroju15\\pansubmission\\FinalCode\\testOutput\\testDataEnglish.csv")
#write.csv(dftestdataenglish,"C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\testDataEnglish.csv",row.names=FALSE)

dfdataExtr1 = read.csv("C:\\Users\\arroju15\\pansubmission\\FinalCode\\IntermediatetestOutputItalian\\dataExtr1.csv")
write.csv(dfdataExtr1,"C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\italian\\testdataExtr1.csv",row.names=FALSE)

#print("reading from C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\testDataEnglish.csv")
#df = read.csv("C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\testDataEnglish.csv")
#print(df[1,])

#print("reading from C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\testdataExtr1.csv")
#df = read.csv("C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\english\\testdataExtr1.csv")
#print(df[1,])