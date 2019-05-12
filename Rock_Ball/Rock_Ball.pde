interface Displayable {
  void display();
}
interface Moveable {
  void move();
}
interface Collideable {
  boolean isTouching(Thing other);
}
abstract class Thing implements Displayable {
  float x, y;

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  abstract void display();
}

class Rock extends Thing implements Collideable {
  Rock(float x, float y) {
    super(x, y);
    //x and y coordinates are corners of the rock
  }

  void display() { 
    /* ONE PERSON WRITE THIS */
    img = loadImage("canva-amethyst-crystal-stone-on-white-MACCXvloiOc.png");
    image(img, x, y, 50, 50);
  }

  boolean isTouching(Thing other) {
    if (other instanceof Ball)
    {
      if((Math.abs(this.x - (other.x - 25)) <= 50) && (Math.abs(this.y - (other.y - 25)) <= 50))
      {
        return true;
      } else
      {
        return false;
      }
    } else
    {
      return false; // that means the "Thing" was something that was not a ball nor a rock
    }
  }
}

public class LivingRock extends Rock implements Moveable {
  LivingRock(float x, float y) {
    super(x, y);
  }
  void move() {
    float yincrement = random(-5, 5);
    float xincrement = random(-5, 5);
    /* ONE PERSON WRITE THIS */
    if (x+xincrement<=width-25 && y+yincrement<=height-25) {
      x+=xincrement;
      y+=yincrement;
    }
  }

  void display() {
    super.display();
    fill(255, 255, 255);
    ellipse(x, y, 34, 30);
    ellipse(x+35, y, 34, 30);
    fill(0, 0, 0);
    ellipse(x, y, 10, 10);
    ellipse(x+35, y, 10, 10);
  }
}

class Ball extends Thing implements Moveable {
  boolean touchingRock;
  PShape s;
  color c;
  color permanentc;
  float xspeed;
  float yspeed;
  float widthIncrement;
  float heightIncrement;
  Ball(float x, float y) {
    //x and y coordinates are the center of the ball
    super(x, y);
    touchingRock = false;
    permanentc = color(0,random(256),random(256));
  }

  void display() {
    if(!touchingRock)
    c = permanentc;
    else
    c = color(255,0,0);
    s = createShape(ELLIPSE, x, y, 50, 50); //commentable
    s.setFill(c);
    shape(s);//commentable
    //ellipse(x, y, 50, 50);//commentable
  }
  void move() {
    /* ONE PERSON WRITE THIS */
    moveRandom();
    //int selector = (int)random(0, 2);
    //if (selector == 0)
    //  moveRandom();
    //if (selector == 1)
    //  moveDirection();
    // moveDirection();
  }
  private void moveRandom() 
  {
    widthIncrement = (float)Math.random() * 50 - 25;
    heightIncrement = (float)Math.random() * 50 - 25;
    float newWidth = this.x + widthIncrement;
    float newHeight = this.y + heightIncrement;
    if((Math.abs(newWidth - width/2) > (width/2 - 25)) || Math.abs(newHeight - height/2) > (height/2 - 25))
    //if (newWidth > (width - 25) || newWidth < 25 ||
    //  newHeight  > (height - 25) || newHeight < 25)
    {
      this.x -= (widthIncrement);
      this.y -= (heightIncrement);
    } else
    {
      this.x = newWidth;
      this.y = newHeight;
    }
    //widthIncrement = random(-1, 1);//testcode
    //heightIncrement = random(-1, 1);//testcode
    //this.x = newWidth;//testcode
    //this.y = newHeight;//testcode
  }
}


class BallOne extends Ball {
  BallOne(float x, float y) {
    //x and y coordinates are the center of the ball
    super(x, y);
    widthIncrement = random(-3, 3);
    heightIncrement = random(-3, 3);
  }
  
  void display(){
    super.display();
    fill(255);
    stroke(255);
    ellipse(x, y, 10, 40);
    ellipse(x, y, 40, 10);
    stroke(0);
  }
  
  void move(){
    moveDirection();
  }
  
  private void moveDirection()
  {
    if(Math.abs(this.x + widthIncrement - width/2) > (width/2 - 25))
    widthIncrement *= -1;
    if(Math.abs(this.y + heightIncrement - height/2) > (height/2 - 25))
    heightIncrement *= -1;
     
    this.x += widthIncrement;
    this.y += heightIncrement;
    //this.display(); //this would let us trace the path of the ball, 
    //but I'd really need to see the ball moving, not trace it's path
  }
}

class BallTwo extends Ball {
  BallTwo(float x, float y) {
    //x and y coordinates are the center of the ball
    super(x, y);
    permanentc = color(random(256),random(256),0);
    int temp = (int)random(0, 2);
    if(temp == 0)
      widthIncrement = 20;
    if(temp == 1)
      widthIncrement = -20;
  }
  void display() {
    if(!touchingRock)
      c = permanentc;
    else 
      c = color(0,0,255);
    s = createShape(ELLIPSE, x, y, 50, 50); //commentable
    s.setFill(c);
    shape(s);//commentable
    fill(255, 255, 255);
    ellipse(x, y, 30, 30);
  }
  void move() {
    this.x+=widthIncrement;
    if (this.x > width-25 || this.x < 25)
      widthIncrement *= -1;
  }
}

boolean su;
ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
ArrayList<Collideable> listOfCollideables;
ArrayList<Ball> listOfBalls;
PImage img;
PImage lmg;
void setup() {
  frameRate(60);
  img = loadImage("canva-amethyst-crystal-stone-on-white-MACCXvloiOc.png");
  lmg = loadImage("kisspng-igneous-rock-obsidian-mineral-crystal-obsidian-5b33624d348da5.3793704415300941572153.jpg");
  size(1000, 800);
  double q = Math.random() * 2;
  System.out.println(q);
  if (q < 1) {
    su = true;
  }
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  listOfCollideables = new ArrayList<Collideable>(); // if collideable is touching ball, change the ball
  listOfBalls = new ArrayList<Ball>();
  for (int i = 0; i < 5; i++) {
    //Ball b = new Ball(50+random(width-100), 50+random(height-100));
    //thingsToDisplay.add(b);
    //thingsToMove.add(b);
    //listOfBalls.add(b);
    
    BallOne b1 = new BallOne(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b1);
    thingsToMove.add(b1);
    listOfBalls.add(b1);
    
    BallTwo b2 = new BallTwo(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b2);
    thingsToMove.add(b2);
    listOfBalls.add(b2);
    

    Rock r = new Rock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(r);
    listOfCollideables.add(r);
  }

  LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100));
  thingsToDisplay.add(m);
  thingsToMove.add(m);
  listOfCollideables.add(m);
}

void draw() {
  background(255);
  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
  }
  for (int i = 0; i < listOfBalls.size(); i ++)
  {
    for (int m = 0; m < listOfCollideables.size(); m ++)
    {
      if (listOfCollideables.get(m).isTouching(listOfBalls.get(i)))
      {
        listOfBalls.get(i).touchingRock = true;
        m = listOfCollideables.size();
      } else
      {
        listOfBalls.get(i).touchingRock = false;
      }
    }
  }
  println(frameRate);
  println(frameCount);
}
