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
    double yincrement = Math.random();
    double xincrement = Math.random();
    /* ONE PERSON WRITE THIS */
    if (x+xincrement<=width && y+yincrement<=height) {
      x+= 80 *xincrement;
      y+= 90 *yincrement;
    }
  }
}

class Ball extends Thing implements Moveable, Collideable {
  Ball(float x, float y) {
    //x and y coordinates are the center of the ball
    super(x, y);
  }

  void display() {
    fill(255, 0, 0);
    ellipse(x, y, 50, 50);
  }

  void move() {
    /* ONE PERSON WRITE THIS */
    int widthIncrement = (int)(random(0, 3)) * 5 - 5;
    int heightIncrement = (int)(random(0, 3)) * 5 - 5;//does not account for both increments being 0

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

  boolean isTouching(Thing other) {
    if (other instanceof Rock)
    {
      if ((this.x >= other.x - 25 && this.x <= other.x + 75) && (this.y >= other.y - 25 && this.y <= other.y + 75)
        return true;
      else
        return false;
    } else if (other instanceof Ball)
    {
      if ((this.x >= other.x - 50 && this.x <= other.y + 50) && (this.y >= other.y - 50 && this.y <= other.y + 50))
      return true;
      else
        return false;
    } else
    {
      return false;//this means Thing was a class other than Ball or Rock
    }
  }
}


ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
ArrayList<Collideable> listOfCollideables;
PImage img;
void setup() {
  img = loadImage("canva-amethyst-crystal-stone-on-white-MACCXvloiOc.png");
  size(1000, 800);

  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  listOfCollideables = new ArrayList<Collideable>();
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    listOfCollideables.add(b);
    Rock r = new Rock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(r);
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
}
