import org.junit.Test;

import static org.junit.Assert.*;

public class TrianguloTest {

    @Test
    public void areaTriangulo1() {
        Ponto p1 = new Ponto(0.0,0.0);
        Ponto p2 = new Ponto(2.0,0.0);
        Ponto p3 = new Ponto(0.0,4.0);
        Triangulo t = new Triangulo(p1,p2,p3);
        assertEquals(4.0,t.areaTriangulo(),0.0001);

    }

    @Test
    public void areaTriangulo2() {
        Ponto p1 = new Ponto(0.0,0.0);
        Ponto p2 = new Ponto(2.0,0.0);
        Ponto p3 = new Ponto(2.0,3.0);
        Triangulo t = new Triangulo(p1,p2,p3);
        assertEquals(3.0,t.areaTriangulo(),0.0001);

    }


}