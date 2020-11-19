# ANTLRv4


## Installation

OS X :

```sh
$ cd /usr/local/lib
$ sudo curl -O https://www.antlr.org/download/antlr-4.8-complete.jar
$ export CLASSPATH=".:/usr/local/lib/antlr-4.8-complete.jar:$CLASSPATH"
$ alias antlr4='java -jar /usr/local/lib/antlr-4.8-complete.jar'
$ alias grun='java org.antlr.v4.gui.TestRig'
```

Linux :


```sh
$ cd /usr/local/lib
$ wget https://www.antlr.org/download/antlr-4.8-complete.jar
$ export CLASSPATH=".:/usr/local/lib/antlr-4.8-complete.jar:$CLASSPATH"
$ alias antlr4='java -jar /usr/local/lib/antlr-4.8-complete.jar'
$ alias grun='java org.antlr.v4.gui.TestRig'
```

Windows:

```sh

1.    Download https://www.antlr.org/download/antlr-4.8-complete.jar.
  
2.    Add antlr4-complete.jar to CLASSPATH, either:
  
     1. Permanently: Using System Properties dialog > Environment variables > Create or append to CLASSPATH variable
        
     2. Temporarily, at command line:
        SET CLASSPATH=.;C:\Javalib\antlr4-complete.jar;%CLASSPATH%

     

3.   Create batch commands for ANTLR Tool, TestRig in dir in PATH
     antlr4.bat: java org.antlr.v4.Tool %*
     grun.bat:   java org.antlr.v4.gui.TestRig %*


```

## Usage example

```sh
$ antlr4 ListasMistas.g4
$ javac *.java
$ grun ListasMistas listas ListasMistas.txt


--------------------------------------------------------
Comprimento da lista: 1
Quantidade de números: 1
Máximo dos números: 1
Somatório dos números: 0
Média: 1.0
Quantidade de palavras (0) =/= Quantidade de números (1)

--------------------------------------------------------
Comprimento da lista: 1
Quantidade de números: 0
Quantidade de palavras (1) =/= Quantidade de números (0)

--------------------------------------------------------
Comprimento da lista: 9
Quantidade de números: 7
Máximo dos números: 10
Somatório dos números: 10
Média: 4.142857142857143
Quantidade de palavras (2) =/= Quantidade de números (7)

--------------------------------------------------------
Comprimento da lista: 4
Quantidade de números: 2
Máximo dos números: 12
Somatório dos números: 0
Média: 6.5
Quantidade de palavras (2) == Quantidade de números (2)

--------------------------------------------------------
Comprimento da lista: 19
Quantidade de números: 13
Máximo dos números: 33
Somatório dos números: 70
Média: 7.384615384615385
Quantidade de palavras (6) =/= Quantidade de números (13)

--------------------------------------------------------
Comprimento da lista: 8
Quantidade de números: 6
Máximo dos números: 8
Somatório dos números: 0
Média: 4.166666666666667
Quantidade de palavras (2) =/= Quantidade de números (6)

--------------------------------------------------------
Comprimento da lista: 6
Quantidade de números: 3
Máximo dos números: 5
Somatório dos números: 0
Média: 3.3333333333333335
Quantidade de palavras (3) == Quantidade de números (3)
^D
```

Or


```sh
$ antlr4 ListasMistas.g4
$ javac *.java
$ grun ListasMistas listas ListasMistas.txt

^D
```

The last instruction allow us to see the Abstract Syntax Tree (AST).




## Contributors
* [Terence Parr](https://github.com/parrt) -  is the maniac behind ANTLR and has been working on language tools since 1989. He is a professor of computer science at the University of San Francisco. 




