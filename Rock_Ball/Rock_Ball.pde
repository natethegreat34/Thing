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
<<<<<<< HEAD
    /* ONE PERSON WRITE THIS */
=======
    image(img, x, y, 50, 50);
>>>>>>> f28cc689d5ee1731c6acb459ed0c7dee22ef357d
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
    double yincrement = Math.random();
    double xincrement = Math.random();
    /* ONE PERSON WRITE THIS */
    if (x+xincrement<=width && y+yincrement<=height) {
      x+=xincrement;
      y+=yincrement;
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
