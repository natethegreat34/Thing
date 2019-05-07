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
    img = loadImage("canva-amethyst-crystal-stone-on-white-MACCXvloiOc.png");
    image(img, x, y, 50, 50);
  }
}

public class LivingRock extends Rock implements Moveable {
  LivingRock(float x, float y) {
    super(x, y);
  }
  void move() {
    double yincrement = Math.random();
    double xincrement = Math.random();
    /* ONE PERSON WRITE THIS */
    if (x+xincrement<=width && y+yincrement<=height) {
      x+= 80 *xincrement;
      y+= 90 *yincrement;
    }
  }
}

class Ball extends Thing implements Moveable {
  Ball(float x, float y) {

    super(x, y);
  }

  void display() {
    fill(255, 0, 0);
    ellipse(x, y, 50, 50);
  }

  void move() {
    /* ONE PERSON WRITE THIS */
    //random movement
    //if(this.x < (width - 25) && this.x > 25) //the edges I will edit later
    //this.x += (int)(random(-1,2));
    //if(this.y < (height - 25) && this.y > 25) //the edges I will edit later
    //this.y += (int)(random(-1,2));
    //random straight path in the N,NE,E,SE,S,SW,W,NW directions
    int widthIncrement = (int)(random(0, 3)) * 5 - 5;
    int heightIncrement = (int)(random(0, 3)) * 5 - 5;//does not account for both increments being 0
    //if (widthIncrement == 0 && heightIncrement == 0)
    //{
    //  int selector = (int)random(0, 1);
    //  if (selector == 0)
    //    widthIncrement = (int)(random(0, 1)) * 10 - 5;
    //  else
    //    heightIncrement = (int)(random(0, 1)) * 10 - 5;
    //}
    if (this.x + widthIncrement > (width - 25) || this.x + widthIncrement < 25 ||
    this.y + heightIncrement  > (height - 25) || this.y + heightIncrement < 25)
    {
      this.x -= (widthIncrement);
      this.y -= (heightIncrement);
    }
    else
    {
      this.x += widthIncrement;
      this.y += heightIncrement;
    }
  }
}
ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
PImage img;
void setup() {
  img = loadImage("canva-amethyst-crystal-stone-on-white-MACCXvloiOc.png");
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
