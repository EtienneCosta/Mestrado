import os

os.system('mcrl22lps t.mcrl2 t.lps')
os.system('lps2lts   t.lps t.lts')
os.system('mcrl22lps v.mcrl2 v.lps')
os.system('lps2lts   v.lps v.lts')
os.system('ltscompare -ebisim -c t.lts v.lts')
os.system('open *.trc')
