#!/usr/bin/env python3

import json

f = open('words.txt')
d = []
o = open('output.txt', "w")
while True:
    line1 = f.readline().replace('\n','')
    line2 = f.readline().replace('\n','')
    if not line2: break  # EOF
    d.append({"english": line2, "italian": line1})

o.write(json.dumps(d))

