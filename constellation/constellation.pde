//constellation
//by aaron parsekian
//code assistance by aaron montoya-moraga
//for the nature of code class by daniel shiffman at nyu itp
//march 2017
//v0.1.0

//global variable for storing particle image
PImage particleImg;


//array of stars
ArrayList<Star> stars = new ArrayList<Star>();

//quantity of stars
int starsQuantity = 500;

//quantity of blackholes
int blackholesQuantity = 500;

//array of blackholes
ArrayList<Blackhole> blackholes = new ArrayList<Blackhole>();

//maximum step for moving blackholes
int step = 10;

//setup() runs first, at the beginning
void setup() {
  noCursor();
  //create canvas
  //intended for use with projectors
  //size(2600, 1050);
  size(2080, 840);

  //black background
  background(0);

  //load particle image star.png from media folder
  particleImg = loadImage("./media/star.png");


  //initialize stars
  for (int i = 0; i < starsQuantity; i++) {
    stars.add(new Star(random(width), random(height), 5*random(10)));
  }

  //initialize blackholes
  for (int i = 0; i < blackholesQuantity; i++) {
    blackholes.add(new Blackhole(random(width), random(height)));
  }
}

//draw() runs on a loop after setup()]
void draw() {

  //black background
  background(0);

  //update blackholes positions
  for (int i = 0; i < round(mouseQuantity*blackholesQuantity); i++) {
    Blackhole tempBlackhole = blackholes.get(i);
    PVector newPos = new PVector(tempBlackhole.location.x+random(-step, step), 
      tempBlackhole.location.y+random(-step, step));
    tempBlackhole.move(newPos);
    //tempBlackhole.display();
  }

  for (int i = 0; i < round(mouseQuantity*starsQuantity); i++) {
    Star tempStar = stars.get(i);
    tempStar.update();
    Blackhole tempBlackhole = blackholes.get(i);
    tempStar.seek(tempBlackhole.location);
    tempStar.display();
  }

  updateMouse();

  println(frameRate);
}