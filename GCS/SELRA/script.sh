java -jar /usr/local/lib/antlr-4.8-complete.jar  Selra.g4

javac *.java 

java org.antlr.v4.gui.TestRig Selra selra selra.xml > log.txt

rm *.java *.interp *.tokens *.class

cd SelraSite/

open index.html
