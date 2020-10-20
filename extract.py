#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests

r = requests.get("https://1000mostcommonwords.com/1000-most-common-french-words/")
soup = BeautifulSoup(r.text, 'html.parser')

trs = soup.find_all('tr')

f = open("words.txt", "w")

for tr in trs:
    tds = tr.find_all('td')
    native = tds[2].get_text()
    foreign = tds[1].get_text()
    
    f.write("{}\n".format(native))
    f.write("{}\n".format(foreign))
