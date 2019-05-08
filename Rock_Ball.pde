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
    if (su){
    image(img, x, y, 50, 50);
    }
    else{
    image(lmg,x,y,50,50);
    }
    fill(255,255,255);
    ellipse(x,y,34,30);
    ellipse(x+35,y,34,30);
    fill(0,0,0);
    ellipse(x,y,10,10);
    ellipse(x+35,y,10,10);
  }
}


public class LivingRock extends Rock implements Moveable {
  LivingRock(float x, float y) {
    super(x, y);
  }
  void move() {
    double yincrement = random(-5,5);
    double xincrement = random(-5,5);
    /* ONE PERSON WRITE THIS */
    if (x+xincrement<=width-25 && y+yincrement<=height-25) {
      x+=xincrement;
      y+=yincrement;
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
  }
}
boolean su;
ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
PImage img;
PImage lmg;
void setup() {
  img = loadImage("canva-amethyst-crystal-stone-on-white-MACCXvloiOc.png");
  lmg = loadImage("kisspng-igneous-rock-obsidian-mineral-crystal-obsidian-5b33624d348da5.3793704415300941572153.jpg");
  size(1000, 800);
    double q = Math.random() * 2;
  System.out.println(q);
    if (q < 1){
      su = true;
    }
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