__author__ = 'Mounica'
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfTransformer
from sklearn.linear_model import SGDClassifier
import pandas as pd
import Preprocess
from sklearn.externals import joblib
import sys

PATH = sys.argv[1]
INPUTPATH = sys.argv[2]
FILE_NAME = sys.argv[3]

FILE_PATH = INPUTPATH + "/" + FILE_NAME

dataset = Preprocess.process(FILE_PATH)
userId = dataset['userId']
status = dataset['status']
gender = dataset['gender']
age = dataset['age']
datasetList = zip(userId, status, gender, age)
ds = pd.DataFrame(data=datasetList, columns=['userId', 'status', 'gender', 'age'])

ngram_vectorizer = CountVectorizer(ngram_range=(1,3), min_df=1)
tfidf_transformer = TfidfTransformer()

X_train = ds['status']
y_train_gender = ds['gender']
y_train_age = ds['age']

#Traindata vectorization
X_train_counts = ngram_vectorizer.fit_transform(X_train)
X_train_tfidf = tfidf_transformer.fit_transform(X_train_counts)

joblib.dump(ngram_vectorizer, PATH+'/ngram.pkl')
joblib.dump(tfidf_transformer, PATH+'/tfidf.pkl')

modelAge = SGDClassifier(loss='hinge', penalty='l2', alpha=1e-3, n_iter=5, random_state=42).fit(X_train_tfidf, y_train_age)
modelDumpAge = joblib.dump(modelAge, PATH+'/SVMAgeModel.pkl')

modelGender = SGDClassifier(loss='hinge', penalty='l2', alpha=1e-3, n_iter=5, random_state=42).fit(X_train_tfidf, y_train_gender)
modelDumpGender = joblib.dump(modelGender, PATH+'/SVMGenderModel.pkl')