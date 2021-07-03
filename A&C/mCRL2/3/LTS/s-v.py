import os

os.system('mcrl22lps s.mcrl2 s.lps')
os.system('lps2lts   s.lps s.lts')
os.system('mcrl22lps v.mcrl2 v.lps')
os.system('lps2lts   v.lps v.lts')
os.system('ltscompare -ebisim -c s.lts v.lts')
os.system('open *.trc')
