__author__ = 'Mounica'
import pandas as pd
import sys

inputPath = sys.argv[1]
df = pd.read_csv(inputPath)
row = next(df.iterrows())[1]
print(row)

