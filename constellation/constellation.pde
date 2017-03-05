//constellation
//by aaron parsekian
//code assistance by aaron montoya-moraga
//for the nature of code class by daniel shiffman at nyu itp
//march 2017
//v0.0.4

//autonomous agents

//global variable for storing particle image
PImage particleImg;

//declare Star object
Star firstStar;

//declare blackhole
Blackhole firstBlackhole; 

PVector target;

int counter = 0;

//setup() runs first, at the beginning
void setup() {

  //create canvas
  //intended for use with projectors
  //size(2600, 1050);
  size(2080, 840);

  //black background
  background(0);

  //load particle image star.png from media folder
  particleImg = loadImage("./media/star.png");

  //initialize Star object
  firstStar = new Star(100, 100);

  //initialize Blackhole object
  firstBlackhole = new Blackhole(100, 100);
}

//draw() runs on a loop after setup()]
void draw() {

  //black background
  background(0);

  firstBlackhole.update();
  //target = new PVector(random(width), random(height));
  PVector whatever = new PVector(width/2+100*cos(counter), height/2+100*sin(counter));
  firstBlackhole.move(whatever);
  firstBlackhole.display();

  firstStar.update();
  firstStar.seek(firstBlackhole.location);
  firstStar.display();

  updateMouse();

  counter = counter + 1;
}