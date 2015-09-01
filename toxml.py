__author__ = 'Mounica'
import csv
import sys
from xml.etree import ElementTree
from lxml import etree
from xml.dom import minidom
from collections import OrderedDict

filepath1 = sys.argv[1]
filepath2 = sys.argv[2]
outputpath = sys.argv[3]
language = sys.argv[4]
f1 = open(filepath1)
f2 = open(filepath2)
f_csv1 = csv.DictReader(f1)
f_csv2 = csv.DictReader(f2)
extra = {"type":"twitter", "lang":language}

for row, row2 in zip(f_csv1, f_csv2):
    orderrow1 = OrderedDict(row.items())
    orderrow2 = OrderedDict(row2.items())
    orderedrow = OrderedDict(orderrow1.items() + orderrow2.items() + extra.items())
    userId = row['id']
    filename = userId + ".xml"
    xmlFile = open(outputpath+"/"+filename, 'w')
    authorTag = ElementTree.Element('author', orderedrow)
    xmlFile.write(minidom.parseString(ElementTree.tostring(authorTag)).toprettyxml())
    xmlFile.close()

f1.close()
f2.close()
