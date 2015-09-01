rm(list=ls())

library('dplyr')
library('stringr')
library('cba')
library('RecordLinkage')
library('stringdist')
library('readr')
library('tm')

trim <- function(x) return(gsub("^ *|(?<= ) | *$", "", x, perl=T))

#helps skip a list of stop words fixed for the english language
skipWords <- function(x) removeWords(x, stopwords("spanish"))

grepcount = 0;
levenshteincount = 0;

ClosestMatch = function(stringVector,string){
  distance = levenshteinSim(string, stringVector);
  stringVector[distance == max(distance)]
}

# have to read two files because
# > df = read.csv('/home/aftab/Desktop/authorpan/dataExtr1.csv')
# > names(df)
# [1] "userId"        "status"        "nlinks"        "nusermentions" "nhashtags"    
# df = read.csv('/home/aftab/Desktop/authorpan/tweets.csv')
# > names(df)
# [1] "userId"        "status"        "nlinks"        "nusermentions" "nhashtags"     "nowhitestatus"
# > 
# > df = read.csv('/home/aftab/Desktop/authorpan/trainDataEnglish.csv')
# Warning message:
# In scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings,  :
#   EOF within quoted string
# > names(df)
#  [1] "userId"  "status"  "nTweets" "age"     "gender"  "openS"   "consS"   "agrS"    "extS"    "neuS"   
# > 


#empty data frame
featuresdf = as.data.frame(matrix(0, ncol=68, nrow=5000, dimnames=list(NULL, paste0('feature',1:68))))

#taking the words with categories file from the server, this is after removing the features part of the file at the top, 
#and replacing tabs with spaces
wordsandcategoriesdf <- read.table("C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\spanish\\inputfile", header=FALSE, sep = "|", quote = "")
#wordsandcategoriesdf <- read.table("/home/aftab/Desktop/authorpan/inputfile", header=FALSE, sep = "|", quote = "")
wordsandcategoriesdf$V1 = as.character(wordsandcategoriesdf$V1)

#wordsalonedf <- read.table("inputfileonlywords", header=FALSE, sep = "|", quote = "")
#wordsalonedf <- read.table("/home/aftab/Desktop/authorpan/inputfileonlywords", header=FALSE, sep = "|", quote = "")
#wordsalonedf$V1 = as.character(wordsalonedf$V1)

#only for getting the scores file with scores
#but can't use status from this file because status contains @username, #tags, httplink etc,
#so for status I use dataExtr1.csv
#scoresdf = read.csv('/home/aftab/Desktop/authorpan/trainDataEnglish.csv')
scoresdf <- read_csv("C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\spanish\\testDataspanish.csv")
scoresdf = scoresdf[,-which(names(scoresdf) == "status")]
scoresdf$age_group=0
scoresdf$gender=0
scoresdf$extroverted=0
scoresdf$stable=0
scoresdf$agreeable=0
scoresdf$conscientious=0
scoresdf$open=0

#this is just the input tweets file, will try and get a better file from manali
#basically turns it from the current string in the dataExtr1.csv to only useful words
df = read.csv('C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\spanish\\testdataExtr1.csv')
df$status = as.character(df$status)
df$nowhitestatus = NULL
df$age = NULL
df$gender = NULL
for(i in 1:nrow(df))
#for(i in 1:1)
{
	#print(i)
	df[i,"nowhitestatus"] = df[i,"status"]
	df[i,"nowhitestatus"] = trim(df[i,"nowhitestatus"])	
	df[i,"nowhitestatus"] = gsub("\t", "", df[i,"nowhitestatus"])
	df[i,"nowhitestatus"] = gsub("w/", "", df[i,"nowhitestatus"])
	df[i,"nowhitestatus"] = gsub("\\[pic\\]:", "", df[i,"nowhitestatus"])	
	df[i,"nowhitestatus"] = gsub("\\\"","", df[i,"nowhitestatus"])	
	df[i,"nowhitestatus"] = gsub("Just posted a photo","", df[i,"nowhitestatus"])	
	df[i,"nowhitestatus"] = gsub("(?!')[[:punct:]]", "", df[i,"nowhitestatus"] , perl=TRUE)
	df[i,"nowhitestatus"] = gsub("[0-9]", "", df[i,"nowhitestatus"])
	df[i,"nowhitestatus"] = gsub("others", "", df[i,"nowhitestatus"])
	df[i,"nowhitestatus"] = trim(df[i,"nowhitestatus"])	
	df[i,"nowhitestatus"] = skipWords(df[i,"nowhitestatus"])
	df[i,"nowhitestatus"] = trim(df[i,"nowhitestatus"])	
}
df = df[,-which(names(df) == "status")]
df$nowhitestatus = as.character(df$nowhitestatus)

#merging the two files
df = merge(df,scoresdf,by="userId")

#removing these weird characters, giving me problem/ people are tweeting he"ll instead of he'll
df$nowhitestatus = tolower(df$nowhitestatus)
df$nowhitestatus = gsub("”","",df$nowhitestatus)
df$nowhitestatus = gsub("’","",df$nowhitestatus)
df$nowhitestatus = gsub("“","",df$nowhitestatus)
df$nowhitestatus = gsub("‘","",df$nowhitestatus)
df$nowhitestatus = gsub("'","",df$nowhitestatus)

# test script
# nowhitestatus = c("this line for one","this line one two","this for three","this line for four","this line for five","this line for six","this line for seven")
# df = data.frame(nowhitestatus)
# df$nowhitestatus = as.character(df$nowhitestatus)

N = nrow(df)
totalwordfrequencydf = NULL

#for each user
#for(user in 1:1)
#for(user in 6:6)
for(user in 1:nrow(df))
{
	#cat(paste("user",user))

	tfidftable = NULL
	words = NULL
	termcount = NULL
	termfrequency = NULL
	documentfrequency = NULL

	allwords = tolower(strsplit(df[user,"nowhitestatus"],' ')[[1]])
	uniqueallwords = unique(allwords)
	uniqueallwords = uniqueallwords[nchar(uniqueallwords) > 0]

	#this is the tfidf table construction part, table name : tfidftable
	#if you take unique here, the problem is, you won't be able to count the termfrequency, termfrequency of everything'll be 1
	for(i in 1:length(uniqueallwords))
	{
		#cat(paste("user",user,"word",i,"\n"))

		words = c(words,uniqueallwords[i])
		termcount = c(termcount,length(grep(paste0("\\b",uniqueallwords[i],"\\b"),allwords)))
		termfrequency = c(termfrequency,length(grep(paste0("\\b",uniqueallwords[i],"\\b"),allwords))/length(allwords))

		#have to do this check because, grep can't detect special characters like "£m" along with \\b
		documentfrequencyhere = length(grep(paste0("\\b",uniqueallwords[i],"\\b"),df$nowhitestatus))
		if(documentfrequencyhere == 0)
		{
			documentfrequencyhere = length(grep(paste0(uniqueallwords[i]),df$nowhitestatus))
		}
		documentfrequency = c(documentfrequency,documentfrequencyhere)
	}
	words = tolower(words)

	#removing the ones with documentfrequency == 0 for whatever reason(weird other characters reason)
	#documentfrequency[which(documentfrequency == 0)] = 1

	tfidftable = data.frame(words,termcount,termfrequency,documentfrequency)

	#calculating idf and tfidf
	tfidftable$inversedocumentfrequency = log(N/tfidftable$documentfrequency,10)
	tfidftable$tfidf = tfidftable$termfrequency * tfidftable$inversedocumentfrequency

	#just for the visual, arranding by tfidf in descending
	tfidftable = arrange(tfidftable,-tfidf)

	wordsforthisuser = as.character(tfidftable$words)
	for(i in 1:length(wordsforthisuser))
	{
		#cat(paste("word here :",wordsforthisuser[i]))

		#searcing if this particular word,wordsforthisuser[i] is present in the wordsandcategoriesdf dictionary
		#grep("\\b") for finding entire word match, not just substring match(grep's default behavior)
		#if present, 'rownumberhavingword' holds the row number where the worsd's found
		rownumberhavingword = grep(paste0("\\b",wordsforthisuser[i],"\\b"),wordsandcategoriesdf$V1)

		#needed in case of multiple matches, especially after adding synonyms, I take only the first match
		if(length(rownumberhavingword) > 0)
		{
			rownumberhavingword = rownumberhavingword[1]
		}		
		
		if(length(rownumberhavingword) == 1)
		{
			#getting the line where the word matches line from the .dic file
			#print("inside grep")
			grepcount = grepcount + 1
			lineofmatch = wordsandcategoriesdf[rownumberhavingword,"V1"]

			# else#since exact match is not there, go for levenshtein's distance and find the closest matching string
			# {
			# 	print("inside levenshtein")
			# 	levenshteincount = levenshteincount + 1
			# 	lineofmatch = wordsandcategoriesdf[grep(paste0("\\b",ClosestMatch(wordsalonedf$V1,wordsforthisuser[i])[1],"\\b"),wordsandcategoriesdf$V1),"V1"][1]
			# }

			#inspite of levenshtein returning at least something, this check is still necessary because
			# > grep(paste0("\\b","step-","\\b"),"step- 31 35")
			# integer(0)
			# > grep(paste0("\\b","step","\\b"),"step- 31 35")
			# [1] 1
			if(length(lineofmatch) > 0)
			{
				#cat(paste(wordsforthisuser[i],":",lineofmatch,"\n"))

				#extracting all the numbers
				positions = str_extract_all(lineofmatch, "[0-9]+")
				positions = unique(positions[[1]]) #because one line looks like (01 23)12/68  (01 23)13  (01 23)14  39

				#getting tfidf value for that word from the tfidftable created
				tfidfvalue = tfidftable[which(tfidftable$words == wordsforthisuser[i]),"tfidf"]

				#for each of the positions, adding the tfidf of this word to the category
				#since word with this tfidf belongs to that category
				for(p in 1:length(positions))
				{
					featuresdf[user,as.numeric(positions[p])] = tfidfvalue + featuresdf[user,as.numeric(positions[p])]
				}
			}
		}
		
	}

	#putting these features from df onto featuresdf
	#[1] "userId" "nlinks" "nusermentions" "nhashtags" "nowhitestatus" "nTweets" [7] "age" "gender" "openS" "consS" "agrS" "extS" #[13] "neuS"
	#featuresdf[user,"userId"] = df[user,"userId"]
	featuresdf[user,"nlinks"] = df[user,"nlinks"]
	featuresdf[user,"nusermentions"] = df[user,"nusermentions"]
	featuresdf[user,"nhashtags"] = df[user,"nhashtags"]
	featuresdf[user,"nTweets"] = df[user,"nTweets"]

	featuresdf[user,"age"] = df[user,"age_group"]
	featuresdf[user,"gender"] = df[user,"gender"]
	featuresdf[user,"extS"] = df[user,"extroverted"]
	featuresdf[user,"neuS"] = df[user,"stable"]
	featuresdf[user,"agrS"] = df[user,"agreeable"]
	featuresdf[user,"consS"] = df[user,"conscientious"]
	featuresdf[user,"openS"] = df[user,"open"]
}

featuresdf = featuresdf[which(complete.cases(featuresdf) == TRUE),]
write.csv(featuresdf,'C:\\Users\\arroju15\\pansubmission\\FinalCode\\liwccode\\spanish\\testplusliwc.csv',row.names=FALSE)

#trials
LenLongStr <- function(String1, String2) {
 
  s1 <- unlist(strsplit(String1,split=""))
  s2 <- unlist(strsplit(String2,split=""))
 
  num <- matrix(0,nchar(String1),nchar(String2) )		
  maxlen <- 0
 
  for (i in 1:nchar(String1)) {
 
	for (j in 1:nchar(String2)) {
 
		if (s1[i] == s2[j]) {
			if ((i==1) || (j==1)) { 
				num[i,j] <- 1
			} 
			else {
				num[i,j] <- 1+num[i-1,j-1]
			}
		    if (num[i,j] > maxlen) {
				maxlen <- num[i,j]
			}
 		}
	}
  }
 
  maxlen			
}

#trials
#closest possible string match
#http://stackoverflow.com/questions/5721883/agrep-only-return-best-matches
# library(cba)
# library(RecordLinkage)
# library(stringdist)

# word <- 'test'
# words <- c('Teest','teeeest','New York City','yeast','text','Test')

# ClosestMatch = function(stringVector,string){
#   distance = levenshteinSim(string, stringVector);
#   stringVector[distance == max(distance)]
# }

# ClosestMatch(words,word)[1]

# > totalwordsfromalltweets
# [1] 34128

# #enhancedwordlist
# > grepcount
# [1] 19435
# > levenshteincount
# [1] 14693

# #originalwordlist
# > grepcount
# [1] 11707
# > levenshteincount
# [1] 22421

# > (19435-11707)/11707
# [1] 0.6601179

# aftab@aftab-Inspiron-3542:~/Desktop/authorpan/dictionaryfiles$ wc -l LIWC2001_English.dic LIWC2007_Dutch.dic LIWC2001_Spanish.dic LIWC2007_spanish.dic
#   2389 LIWC2001_English.dic
#   6628 LIWC2007_Dutch.dic
#   7546 LIWC2001_Spanish.dic
#   5240 LIWC2007_spanish.dic
#  21803 total
