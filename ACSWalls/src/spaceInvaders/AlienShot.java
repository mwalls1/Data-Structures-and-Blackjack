package spaceInvaders;

import java.awt.*;

/**
 *
 */
public class AlienShot implements Runnable {


    private int shotSpeed = 10;

    private int SHOT_WIDTH  = 2;
    private int SHOT_HEIGHT = 5;    
    
    private int x = 0;

    private int shotHeight = 0;

    boolean shotState = true;
    Image ba = null;
    Barrier barrier1 = new Barrier(75,280);
    Barrier barrier2 = new Barrier(255,280);
    Barrier barrier3 = new Barrier(425,280);
    Ship ship = null;
    
    /**
     *
     */
    public AlienShot(int xVal, int yVal, Ship s,Image b) {
        x = xVal;//Set the shot direction
	shotHeight = yVal;
	ship = s;
	ba = b;
	Thread thread = new Thread(this);
	thread.start();
    }

    /**
     *
     */
    private boolean moveShot() {
	
	//Now we need to see if the ship has been hit
	if (ship.checkShot(x, shotHeight)&&shotState == true) {
            //We hit something!
            System.out.println("An alien shot the ship!");
	    ship.hitByAlien();
	    shotState = false;
	    return true;
	}
    shotHeight = shotHeight + 2;
	if(barrier1.checkShot(x, shotHeight)&&!barrier1.getHitState())
	{
		shotState = false;
		barrier1.changeHit();
		barrier1.changeHitState();
	}
	if(barrier2.checkShot(x, shotHeight)&&!barrier2.getHitState())
	{
		shotState = false;
		barrier2.changeHit();
		barrier2.changeHitState();
	}

	if(barrier3.checkShot(x, shotHeight)&&!barrier3.getHitState())
	{
		shotState = false;
		barrier3.changeHit();
		barrier3.changeHitState();
	}


	//We could have written this as
	//shotHeight -= 2;
	
	//Now check we haven't gone off the screen
	if (shotHeight > SpaceInvaders.HEIGHT) {
	    shotState = false;
	    return true;
	}
	
		
	return false;
    }

    /**
     * Draw the image of the shot
     */    
    public void drawShot(Graphics g) {
	if (shotState) {
            g.setColor(Color.green);
	} else {
            g.setColor(Color.black);
	}
        g.fillRect(x, shotHeight, SHOT_WIDTH, SHOT_HEIGHT);
    } 

    public boolean getShotState() {
        return shotState;
    }

    public void run() {
        while(true) {
            try {
                Thread.sleep(shotSpeed);
            } catch(InterruptedException ie) {
                //Ignore this exception
            }
	    
	    if (moveShot()) {
                break;
	    }

	}
    }

    

}
