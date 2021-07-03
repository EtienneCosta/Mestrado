import os

os.system('mcrl22lps t.mcrl2 t.lps')
os.system('lps2lts   t.lps t.lts')
os.system('mcrl22lps s.mcrl2 s.lps')
os.system('lps2lts   s.lps s.lts')
os.system('ltscompare -ebisim -c t.lts s.lts')
os.system('open *.trc')
