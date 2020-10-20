#!/usr/bin/env python3 

f = open('words.txt')
o = open('output.txt', "w")
while True:
    line1 = f.readline().replace('\n','')
    line2 = f.readline().replace('\n','')
    if not line2: break  # EOF
    o.write("Word(native: \"{}\", foreign: \"{}\"),\n".format(line2, line1))
