interface Displayable {
  void display();
}
interface Moveable {
  void move();
}
abstract class Thing implements Displayable {
  float x, y;

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  abstract void display();
}

class Rock extends Thing {
  Rock(float x, float y) {
    super(x, y);
  }

  void display() { 
    /* ONE PERSON WRITE THIS */
    fill(165);
    circle(x, y, 50);
  }
}

public class LivingRock extends Rock implements Moveable {
  LivingRock(float x, float y) {
    super(x, y);
  }
  void move() {
    /* ONE PERSON WRITE THIS */
  }
}

class Ball extends Thing implements Moveable {
  Ball(float x, float y) {

    super(x, y);
  }

  void display() {
    /* ONE PERSON WRITE THIS */
  }

  void move() {
    /* ONE PERSON WRITE THIS */
    //random movement
    //if(this.x < (width - 25) && this.x > 25) //the edges I will edit later
    //this.x += (int)(random(-1,2));
    //if(this.y < (height - 25) && this.y > 25) //the edges I will edit later
    //this.y += (int)(random(-1,2));
    //random straight path in the N,NE,E,SE,S,SW,W,NW directions
    int widthIncrement = (int)(random(-1, 2));
    int heightIncrement = (int)(random(-1, 2));//does not account for both increments being 0
    if (widthIncrement == 0 && heightIncrement == 0)
    {
      int selector = (int)random(0, 1);
      if (selector == 0)
        widthIncrement = (int)(random(0, 1)) * 2 - 1;
      else
        heightIncrement = (int)(random(0, 1)) * 2 - 1;
    }
    this.x += widthIncrement;
    this.y += heightIncrement;
    if ((this.x < (width - 25) || this.x > 25) || (this.y < (height - 25) || this.y > 25); 
    this.x += widthIncrement, this.y += heightIncrement)
    {
      this.x -= 2 * (widthIncrement);
      this.y -= 2 * (heightIncrement);
    }
  }
  ArrayList<Displayable> thingsToDisplay;
  ArrayList<Moveable> thingsToMove;

  void setup() {
    size(1000, 800);

    thingsToDisplay = new ArrayList<Displayable>();
    thingsToMove = new ArrayList<Moveable>();
    for (int i = 0; i < 10; i++) {
      Ball b = new Ball(50+random(width-100), 50+random(height-100));
      thingsToDisplay.add(b);
      thingsToMove.add(b);
      Rock r = new Rock(50+random(width-100), 50+random(height-100));
      thingsToDisplay.add(r);
    }

    LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(m);
    thingsToMove.add(m);
  }

  void draw() {
    background(255);

    for (Displayable thing : thingsToDisplay) {
      thing.display();
    }
    for (Moveable thing : thingsToMove) {
      thing.move();
    }
  }
