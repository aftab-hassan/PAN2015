__author__ = 'Mounica'
import pandas as pd
import twokenize as tz

def tokenize(data):
    dataU = unicode(data, "utf-8", errors='ignore')
    tokens = tz.tokenizeRawTweetText(dataU)
    dataTokenized = ' '.join(tokens)
    return dataTokenized

def process(filepath):
    dataset = pd.read_csv(filepath)
    dataset['status'] = dataset['status'].str.replace('\d', '@')
    dataset['status'] = map(tokenize, dataset['status'])
    return dataset

