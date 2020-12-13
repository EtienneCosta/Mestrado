import org.junit.Test;

import static org.junit.Assert.*;

public class RetanguloTest {

    @Test
    public void areaQuadrado1() {
        Ponto p1 = new Ponto (0,0);
        Ponto p2 = new Ponto (3,0);
        Ponto p3 = new Ponto (0,4);
        Ponto p4 = new Ponto (3,4 );

        Retangulo r = new Retangulo(p1,p2,p3,p4);
        assertEquals(12.0,r.areaQuadrado(),0.0001);
    }

    @Test
    public void areaQuadrado2() {
        Ponto p1 = new Ponto (0,0);
        Ponto p2 = new Ponto (3,0);
        Ponto p3 = new Ponto (0,3);
        Ponto p4 = new Ponto (3,3 );

        Retangulo r = new Retangulo(p1,p2,p3,p4);
        assertEquals(9.0,r.areaQuadrado(),0.0001);
    }


}