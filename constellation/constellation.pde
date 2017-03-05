//constellation
//by aaron parsekian
//code assistance by aaron montoya-moraga
//for the nature of code class by daniel shiffman at nyu itp
//march 2017
//v0.0.2

//autonomous agents

//global variable for storing particle image
PImage particleImg;

//declare Star object
Star firstStar;

PVector target;

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
  
}

//draw() runs on a loop after setup()]
void draw() {
  
   //black background
  background(0);
  
  firstStar.update();
  target = new PVector(random(width), random(height));
  firstStar.seek(target);
  firstStar.display();
  
  
  
}