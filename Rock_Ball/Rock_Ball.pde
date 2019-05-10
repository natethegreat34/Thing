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
    if (other instanceof Rock)
    {
      if ((this.x <= other.x + 50 && this.x >= other.x - 50) && (this.y <= other.y + 50 && this.y >= other.y - 50))
      {
        return true;
      } else
      {
        return false;
      }
    } else if (other instanceof Ball)
    {
      if ((this.x <= other.x + 25 && this.x >= other.x - 75) && (this.y <= other.y + 25 && this.y >= other.y - 75))
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
  color c; //might be useful
  float directionXIncrement;
  float directionYIncrement;
  float xspeed;
  float yspeed;
  float widthIncrement;
  float heightIncrement;
  Ball(float x, float y) {
    //x and y coordinates are the center of the ball
    super(x, y);
    s = createShape(ELLIPSE, x, y, 50, 50); //commentable
    touchingRock = false;
  }

  void display() {
    fill(0,255,0);
    //ellipse(x, y, 50, 50);//commentable
    shape(s,x,y);//commentable
  }
   void move() {
    /* ONE PERSON WRITE THIS */
    moveRandom();
  }
  private void moveRandom() 
  {
    widthIncrement = random(50);
    heightIncrement = random(50);
    //does not account for both increments being 0

    if (this.x + widthIncrement > (width - 25) || this.x + widthIncrement < 25 ||
      this.y + heightIncrement  > (height - 25) || this.y + heightIncrement < 25)
    {
      this.x -= (widthIncrement);
      this.y -= (heightIncrement);
    } else
    {
      this.x += widthIncrement;
      this.y += heightIncrement;
    }
  }
  private void moveDirection()
  {
    
  }
}

//class BallOne extends Ball {
//  Ball(float x, float y) {
//    //x and y coordinates are the center of the ball
//    super(x, y);
//  }
//}

//class BallTwo extends Ball {
//  Ball(float x, float y) {
//    //x and y coordinates are the center of the ball
//    super(x, y);
//  }
//}

boolean su;
ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
ArrayList<Collideable> listOfCollideables;
ArrayList<Ball> listOfBalls;
PImage img;
PImage lmg;
void setup() {
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
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    listOfBalls.add(b);

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
    for(int i = 0 ; i < listOfBalls.size() ; i ++)
    {
      for(int m = 0 ; m < listOfCollideables.size() ; m ++)
      {
        if (listOfCollideables.get(m).isTouching(listOfBalls.get(i)))
        {
          listOfBalls.get(i).touchingRock = true;
          m = listOfCollideables.size();
        }
        else
        {
          listOfBalls.get(i).touchingRock = false;
        }
      }
      
    }
 
}
