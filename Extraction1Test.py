import pandas as pd
import re
import sys

OUTPUTPATH = sys.argv[1]
INPUTFILE = sys.argv[2]
newFileName = sys.argv[3]

df = pd.read_csv(OUTPUTPATH + "/" + INPUTFILE)
userId = df['userId']
status = df['status']
datasetList = zip(userId, status)
dataset = pd.DataFrame(data=datasetList, columns=['userId', 'status'])

usernameRegex = '@username'
linkRegex = '(http|https)://[^\s ]{4,}'
hashTagRegex = r'#([^\s]+)'

def findNLinks(data):
    linksCount = 0
    for m in re.finditer(linkRegex, data):
        linksCount += 1
    return linksCount

def findNUserMentions(data):
    userMentionCount = 0
    for m in re.finditer(usernameRegex, data):
        userMentionCount += 1
    return userMentionCount

def findNHashTag(data):
    hashTagCount = 0
    for m in re.finditer(hashTagRegex, data):
        hashTagCount += 1
    return hashTagCount

dataset['nlinks'] = map(findNLinks, dataset['status'])
dataset['nusermentions'] = map(findNUserMentions, dataset['status'])
dataset['nhashtags'] = map(findNHashTag, dataset['status'])

dataset['status'] = dataset['status'].str.replace(usernameRegex, ' ')
dataset['status'] = dataset['status'].str.replace(linkRegex, ' ')
dataset['status'] = dataset['status'].str.replace(hashTagRegex, ' ')

dataset.to_csv(OUTPUTPATH + "/" + newFileName, index=False)

#a = dataset[dataset['status'].str.contains(linkRegex)].groupby('status').count()
#print(a)
#pd.Series((dataset.status.str.contains(r).sum() for r in linkRegex), linkRegex, name='nLinks')
#works - \b(((\S+)?)(@|mailto\:|(news|(ht|f)tp(s?))\://)\S+)\b
