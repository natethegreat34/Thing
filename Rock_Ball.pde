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
  PImage lol;
  Rock(float x, float y, PImage lo) {
    super(x, y);
    lol = lo;

    //x and y coordinates are corners of the rock
  }

  void display() { 
    /* ONE PERSON WRITE THIS */
    image(lol, x, y, 50, 50);
  }

  boolean isTouching(Thing other) {
    if (other instanceof Ball)
    {
      if ((Math.abs(this.x - (other.x - 25)) <= 50) && (Math.abs(this.y - (other.y - 25)) <= 50))
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
  float xincrement;
  float yincrement;
  float selector;
  int rand;
  double e = 3;
  double f =3;
  
  
  LivingRock(float x, float y, PImage z) {
    super(x, y, z);
  }
  void move() {
    if (frameCount % 75 == 0)
    {
      selector = (int)random(0, 2);
    }
    if (selector == 0)
      randomMove();
    else if (selector == 1)
      diagonalMove();
    
  }
  
 void randomMove(){
    double yincrement = Math.random()* 2 * f;
    double xincrement = Math.random()* 2 * e;    
    System.out.println(width + " w " + "\n" + height + "h");
    System.out.println(x + " x " + "\n" + y + "y");
        x+=xincrement;
        y+=yincrement;
    if (x+25 >= width && e == 3){
      e = -3;
    }
    if (x-25 <= 0 && e == -3){
      e = 3;
    }
    if (y + 25 >= height && f == 3){
      f = -3;
    }
     if (y - 25 <= 0 && f == -3){
      f = 3;
    }
 }
  
  void diagonalMove(){
    if (frameCount % 50 == 0) rand = (int)random(0,4);
    if (rand==0){
      xincrement = random(0,5);
      yincrement = -1 * (float)Math.sqrt(25 - xincrement*xincrement);
    }
    if (rand==1){
      xincrement = random(0,5);
      yincrement = (float)Math.sqrt(25 - xincrement*xincrement);
    }
    if (rand==2){
      yincrement = random(0,5);
      xincrement = -1 * (float)Math.sqrt(25 - yincrement*yincrement);
    }
    if (rand==3){
      yincrement = random(0,5);
      xincrement = (float)Math.sqrt(25 - yincrement*yincrement);
    }
    
    
    if (x+xincrement<=width-25 && y+yincrement<=height-25 && x+xincrement>=25 && y+yincrement>=25) {
       x += xincrement;
       y += yincrement;
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
    permanentc = color(0, random(256), random(256));
  }

  void display() {
    if (!touchingRock)
      c = permanentc;
    else
      c = color(255, 0, 0);
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
    if ((Math.abs(newWidth - width/2) > (width/2 - 25)) || Math.abs(newHeight - height/2) > (height/2 - 25))
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
  int selector = (int)random(0, 3);
  BallOne(float x, float y) {
    //x and y coordinates are the center of the ball
    super(x, y);
    do
    {
      widthIncrement = random(-5, 5);
      heightIncrement = random(-5, 5);
    } 
    while (5 - Math.abs(widthIncrement) > 3 && 5 - Math.abs(heightIncrement) > 3);//this loop ensures values from -5 to -2, and 2 to 5, but not small values for both x and y between -2 and 2.
  }

  void display() {
    super.display();
    fill(255);
    stroke(255);
    ellipse(x, y, 10, 40);
    ellipse(x, y, 40, 10);
    stroke(0);
  }

  void move() {
    if (frameCount % 75 == 0)
    {
      selector = (int)random(0, 3);
    }
    if (selector == 0)
      moveDirection();
    else if (selector == 1)
      moveZigZag();
    else if (selector == 2)
      moveRandomDirection();
  }

  private void moveDirection()
  {
    if (Math.abs(this.x + widthIncrement - width/2) > (width/2 - 25))
      widthIncrement *= -1;
    if (Math.abs(this.y + heightIncrement - height/2) > (height/2 - 25))
      heightIncrement *= -1;//the four lines of code above were to check for out of bounds  
    this.x += widthIncrement;
    this.y += heightIncrement;
    //this.display(); //this would let us trace the path of the ball, 
    //but I'd really need to see the ball moving, not trace it's path
  }

  private void moveZigZag()
  {
    if (Math.abs(this.x + widthIncrement - width/2) > (width/2 - 25))
      widthIncrement *= -1;
    if (Math.abs(this.y + heightIncrement - height/2) > (height/2 - 25))
      heightIncrement *= -1;//the four lines of code above were to check for out of bounds  
    if ((frameCount + 5) % 10 == 0)
    {
      float holder = widthIncrement;
      widthIncrement = heightIncrement * -1;
      heightIncrement = holder;
    } else if (frameCount % 10 == 0)
    {
      float holder = heightIncrement;
      heightIncrement = widthIncrement * -1;
      widthIncrement = holder;
    }
    this.x += widthIncrement;
    this.y += heightIncrement;
  }

  private void moveRandomDirection() {
    if (Math.abs(this.x + widthIncrement - width/2) > (width/2 - 25))
      widthIncrement *= -1;
    if (Math.abs(this.y + heightIncrement - height/2) > (height/2 - 25))
      heightIncrement *= -1;//the four lines of code above were to check for out of bounds  
    this.x += widthIncrement;
    this.y += heightIncrement;

    if (frameCount % 20 == 0)
    {
      do
      {
        widthIncrement = random(-5, 5);
        heightIncrement = random(-5, 5);
      }
      while (5 - Math.abs(widthIncrement) > 3 && 5 - Math.abs(heightIncrement) > 3);
    }
  }
}

class BallTwo extends Ball {
  BallTwo(float x, float y) {
    //x and y coordinates are the center of the ball
    super(x, y);
    permanentc = color(random(256), random(256), 0);
    int temp = (int)random(0, 2);
    if (temp == 0)
      widthIncrement = 20;
    if (temp == 1)
      widthIncrement = -20;
  }
  void display() {
    if (!touchingRock)
      c = permanentc;
    else 
    c = color(0, 0, 255);
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


    double t = Math.random() * 2;
    Rock r;
    //System.out.println(t + "jwdindkjndk");
    if (t > 1) {
      r = new Rock(50+random(width-100), 50+random(height-100), img);
    } else {
      r = new Rock(50+random(width-100), 50+random(height-100), lmg);
    }
    thingsToDisplay.add(r);
    listOfCollideables.add(r);
  }
     double s = Math.random() * 2;
    LivingRock m;
    //System.out.println(t + "jwdindkjndk");
    if (s > 1) {
      m = new LivingRock(50+random(width-100), 50+random(height-100), img);
    } else {
      m = new LivingRock(50+random(width-100), 50+random(height-100), lmg);
    }
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
  //println(frameRate);
  //println(frameCount);
}
