__author__ = 'Mounica'


import pandas as pd
import Preprocess
from sklearn.externals import joblib
import numpy as np
import sys

testPath = sys.argv[1]
FILE_NAME = sys.argv[2]

resultPath = sys.argv[3]
resultFileName = sys.argv[4]

modelsPath = sys.argv[5]

FILE_PATH = testPath + "/" + FILE_NAME

dataset = Preprocess.process(FILE_PATH)
userId = dataset['userId']
status = dataset['status']
datasetList = zip(userId, status)
ds = pd.DataFrame(data=datasetList, columns=['userId', 'status'])

X_test = ds['status']

ngram_vectorizer = joblib.load(modelsPath+'/ngram.pkl')
tfidf_transformer = joblib.load(modelsPath+'/tfidf.pkl')

X_test_counts = ngram_vectorizer.transform(X_test)
X_test_tfidf = tfidf_transformer.transform(X_test_counts)

modelAge = joblib.load(modelsPath+'/SVMAgeModel.pkl')
modelGender = joblib.load(modelsPath+'/SVMGenderModel.pkl')

agePrediction = modelAge.predict(X_test_tfidf)
genderPrediction = modelGender.predict(X_test_tfidf)


# accAge = np.mean(agePrediction == dataset['age'])
# accGender = np.mean(genderPrediction == dataset['gender'])

resultData = zip(userId, genderPrediction, agePrediction)
result = pd.DataFrame(data=resultData, columns=['userId', 'gender', 'age'])
result.to_csv(resultPath + "/" + resultFileName, index=False)