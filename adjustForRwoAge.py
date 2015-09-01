__author__ = 'Mounica'

import pandas as pd
import sys


INPUTFILE = sys.argv[1]
OUTPUTPATH = sys.argv[2]
newFileName = sys.argv[3]
ageGenderResultsFILE = sys.argv[4]

testData = pd.read_csv(INPUTFILE)
ageGenderResults = pd.read_csv(ageGenderResultsFILE)

testData['gender'] = ageGenderResults['gender']
testData['extroverted'] = 0
testData['stable'] = 0
testData['agreeable'] = 0
testData['conscientious'] = 0
testData['open'] = 0

testData.to_csv(OUTPUTPATH+"\\"+newFileName, index=False)
