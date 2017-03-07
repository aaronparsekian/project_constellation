//variables controlled by mouse
float mouseQuantity = 0;
float mouseSpeed = 0;

//steps for rate of change of speed and quantity
float stepQuantity = 0.01;
float stepSpeed = 0.01;

//minimum and maximumValues
float minQuantity = 0;
float maxQuantity = 1;
float minSpeed = 0;
float maxSpeed = 1;

//function for updating variables according to mouse
void updateMouse() {

  //update quantity, controlled by mouseX on the canvas
  //round function for going from float to integer
  mouseQuantity = mouseQuantity + map(mouseX, 0, width, -stepQuantity, stepQuantity);

  //update speed, controlled by mouseY on the canvas
  //round function for going from float to integer
  mouseSpeed = mouseSpeed + map(mouseY, height, 0, -stepSpeed, stepSpeed);
  
  //constrain variables to the ranges between minimum and maximum values
  mouseQuantity = constrain(mouseQuantity, minQuantity, maxQuantity);
  mouseSpeed = constrain(mouseSpeed, minSpeed, maxSpeed);
  
  //print values to the console
  //println("mouseQuantity: " + mouseQuantity + ", mouseSpeed: " + mouseSpeed);
  
}