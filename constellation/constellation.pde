//constellation
//by aaron parsekian
//code assistance by aaron montoya-moraga
//for the nature of code class by daniel shiffman at nyu itp
//march 2017
//v0.0.5

//global variable for storing particle image
PImage particleImg;

//declare Star object
Star firstStar;

//array of stars
ArrayList<Star> stars = new ArrayList<Star>();

//quantity of stars
int starsQuantity = 300;

//declare blackhole
Blackhole firstBlackhole; 

PVector target;

float counter = 0;
float counterStep = 0.1;

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
  //firstStar = new Star(100, 100, 1);

  for (int i = 0; i < starsQuantity; i++) {
    stars.add(new Star(random(width), random(height), 0.1*random(10)));
  }

  //initialize Blackhole object
  firstBlackhole = new Blackhole(100, 100);
}

//draw() runs on a loop after setup()]
void draw() {

  //black background
  background(0);

  firstBlackhole.update();
  //target = new PVector(random(width), random(height));
  PVector whatever = new PVector(width/2+300*cos(counter), height/2+200*sin(counter));
  firstBlackhole.move(whatever);
  firstBlackhole.display();

  for (int i = 0; i < starsQuantity; i++) {
    Star tempStar = stars.get(0);
    tempStar.update();
    tempStar.seek(firstBlackhole.location);
    tempStar.display();
  }

  updateMouse();

  counter = counter + counterStep;
  
  println(frameRate);
}