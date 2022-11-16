# coding=utf-8
import re
import requests
from lxml import etree
from bs4 import BeautifulSoup
from selenium import webdriver
import time
import json
import csv

url = 'https://www.kfc.com.cn/kfccda/ashx/GetStoreList.ashx?op=keyword'
key = input("please input keyword: ")

f = open('answer.txt',mode='w')

dict ={'op':key}
for page in range(1,11):
    par = {'cname': '', 'pid': '', 'keyword': key,
           'pageIndex': page
        , 'pageSize': '10'}
    try:
        respones = requests.post(url,params=par).json()
    except:
        break
    for i in respones['Table1']:
        f.write("Name : " + i['storeName']+'\n')
        f.write("Add : " + i['addressDetail']+'\n\n')


