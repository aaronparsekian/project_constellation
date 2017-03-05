//variables controlled by mouse
int mouseQuantity = 0;
int mouseSpeed = 0;

//steps for rate of change of speed and quantity
int stepQuantity = 1;
int stepSpeed = 1;

//minimum and maximumValues
int minQuantity = 1;
int maxQuantity = 100;
int minSpeed = 1;
int maxSpeed = 100;

//function for updating variables according to mouse
void updateMouse() {

  //update quantity, controlled by mouseX on the canvas
  //round function for going from float to integer
  mouseQuantity = mouseQuantity + round(map(mouseX, 0, width, -stepQuantity, stepQuantity));

  //update speed, controlled by mouseY on the canvas
  //round function for going from float to integer
  mouseSpeed = mouseSpeed + round(map(mouseY, height, 0, -stepSpeed, stepSpeed));
  
  //constrain variables to the ranges between minimum and maximum values
  mouseQuantity = constrain(mouseQuantity, minQuantity, maxQuantity);
  mouseSpeed = constrain(mouseSpeed, minSpeed, maxSpeed);
  
  //print values to the console
  println("mouseQuantity: " + mouseQuantity + ", mouseSpeed: " + mouseSpeed);
  
}