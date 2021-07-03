#define LENGTH 100

int vec[LENGTH];

int max;


int maxarray(int u[],int size){
   int i = 1;
   int max =0;



   while( i<size) {
    	if(u[i]> u[max]) 
	    max=i;
	 i++;
}

return max;
}


int main(){
maxarray(vec,150);

}


