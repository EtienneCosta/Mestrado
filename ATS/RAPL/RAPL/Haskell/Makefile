fib-rapl: F.hs rapl.c main.c
	ghc -c -O F.hs
	ghc --make -no-hs-main -optc-O main.c rapl.c F -o fib-rapl 
	chmod 777 fib-rapl

clean:
	rm *.o *.hi fib-rapl
