/* 
    Análise e Teste de SoftWare 
            LOC
*/

#include <stdio.h>
#ifdef ATS 
#include "ats.h"
#endif 

int main (int argc,char ** argv){
     int i,aux;
    scanf("%d",&aux);

    for(i=0;i<10;i++)
        printf("%d : %d \n",i,aux);
    return 0;
}
