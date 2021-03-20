#include <stdio.h>
#define  N 4

int main(){
    
int M [N][N];
int i,j;
i=j=1;
// M[1][1]=2 
M[i][j]=i+j;
//j=2;
j++;
// M[1][2]=3 
M[i][j]=i+j;
//j=3
j++;
// M[1][3]=4 
M[i][j]=i+j;
//i=2
i++;
//j=1
j=1;
// M[2][1]=3 
M[i][j]=i+j;
//j=2
j++;
// M[2][2]=4 
M[i][j]=i+j;
//j=3
j++;
// M[2][3]=5 
M[i][j]=i+j;
//i=3
i++;
//j=1
j=1;
// M[3][1]=4 
M[i][j]=i+j;
//j=2
j++;
// M[3][2]=5 
M[i][j]=i+j;
//j=3
j++;
// M[3][3]=6 
M[i][j]=i+j;

return 0;
    
}