import java.util.Arrays;

public class Main {

    public static void main(String[] args) {

        int [] values = {3,6,8,7,9,5};
        int result = Arrays.stream(values).map(v->v*v).sum();
        System.out.println("Stream:"+result);


        /* Manualmente */
        int manual=0;
        for(Integer i : values)
            manual+=i*i;

        System.out.println("Manual:"+manual);



        /* Refactoring do IDE */



        int result2 = 0;
        for (int v : values) {
            int i1 = v * v;
            result2 += i1;
        }

        System.out.println("Refactoring:"+result2);





    }

}
