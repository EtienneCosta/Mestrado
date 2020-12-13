import org.junit.Test;

import static org.junit.Assert.*;

public class PontoTest {


    @Test
    public void getX() {
        Ponto p = new Ponto (2.0,1.0);
        assertEquals(2.0,p.getX(),0.0001);
    }


    @Test
    public void getY() {
        Ponto p = new Ponto (2.0,1.0);
        assertEquals(1.0,p.getY(),0.0001);
    }







    @Test
    public void somaPonto() {
        Ponto p1 = new Ponto(0.0,0.0);
        Ponto p2 = new Ponto(1.0,2.0);
        p1.somaPonto(p2);

        assertEquals(1.0,p1.getX(),0.0001);
        assertEquals(2.0,p1.getY(),0.0001);

    }



    @Test
    public void simetrico() {

        Ponto p = new Ponto(-3.0,3.0);
        assertTrue(Boolean.TRUE.equals(p.simetrico()));

    }

    @Test
    public void coordPos() {
        Ponto p = new Ponto(3.0,2.0);
        assertTrue("Sucesso",Boolean.TRUE.equals(p.getX()>0&&p.getY()>0));

    }

    @Test
    public void distancia() {

        Ponto p1 = new Ponto(2,2);
        Ponto p2 = new Ponto(7,5);
        assertEquals(5.83,p1.distancia(p2),0.001);


    }
}