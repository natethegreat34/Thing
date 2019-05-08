boolean su;
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
  PImage lol;
  Rock(float x, float y, PImage lo) {
    super(x, y);
    lol = lo;
  }

  
void display(){
  image(lol,x,y,50,50);
}
}

public class LivingRock extends Rock implements Moveable {
  LivingRock(float x, float y) {
    super(x, y, img);
  }
  void move() {
    double yincrement = Math.random();
    double xincrement = Math.random();
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
PImage lmg;
void setup() {
  img = loadImage("canva-amethyst-crystal-stone-on-white-MACCXvloiOc.png");
  lmg = loadImage("kisspng-igneous-rock-obsidian-mineral-crystal-obsidian-5b33624d348da5.3793704415300941572153.jpg");
  size(1000, 800);
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    double t = Math.random() * 2;
    Rock r;
    if (t > 1){
    r = new Rock(50+random(width-100), 50+random(height-100), img);
    }
    else{
       r = new Rock(50+random(width-100), 50+random(height-100), lmg);
     }
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
