#include <stdio.h>



int main(){

 for(int i=1 ; i<=3;i++)
   for(int a = 1 ; a<=2;a++)
   	for(int b = a+1; b<=3;b++)
	   printf("(~ x%i%i V ~ x%i%i)\n",a,i,b,i);


  return 0;

}
