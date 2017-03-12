//constellation
//aaron parsekian
//based on code from the book the nature of code by daniel shiffman 
//big thank you to aaron montoya-moraga for code and math assistance 
//for the nature of code class - daniel shiffman at nyu itp
//march 2017
//v0.1.0

//particle image
PImage particleImg;


//array of stars
ArrayList<Star> stars = new ArrayList<Star>();

//how many stars
int starsQty = 500;

//how many blackholes
int blackholesQty = 500;

//array of blackholes
ArrayList<Blackhole> blackholes = new ArrayList<Blackhole>();

//maximum step for moving blackholes
int step = 10;

void setup() {
  //size(2800, 1050); //projectors
  size(1200, 450);
  background(0);
  //load particle image
  particleImg = loadImage("./media/star.png");

  //initialize stars
  for (int i = 0; i < starsQty; i++) {
    stars.add(new Star(random(width), random(height), 5*random(10)));
  }

  //initialize blackholes
  for (int i = 0; i < blackholesQty; i++) {
    blackholes.add(new Blackhole(random(width), random(height)));
  }
}

void draw() {
  background(0);

  //update blackholes positions
  for (int i = 0; i < round(mouseQuantity*blackholesQty); i++) {
    Blackhole tempBlackhole = blackholes.get(i);
    PVector newPos = new PVector(tempBlackhole.location.x+random(-step, step), 
      tempBlackhole.location.y+random(-step, step));
    tempBlackhole.move(newPos);
  }
  //update stars positions
  for (int i = 0; i < round(mouseQuantity*starsQty); i++) {
    Star tempStar = stars.get(i);
    tempStar.update();
    Blackhole tempBlackhole = blackholes.get(i);
    tempStar.seek(tempBlackhole.location);
    tempStar.display();
  }

  updateMouse();
  noCursor();
  println(frameRate);
}
