float mouseQuantity = 0;
float mouseSpeed = 0;

//steps of change
float stepQuantity = 0.01;
float stepSpeed = 0.01;

//minimum and maximum Values
float minQuantity = 0;
float maxQuantity = 1;
float minSpeed = 0;
float maxSpeed = 1;

void updateMouse() {

  //x update quantity
  //round function for going from float to integer
  mouseQuantity = mouseQuantity + map(mouseX, 0, width, -stepQuantity, stepQuantity);

  //y update speed
  //round function for going from float to integer
  mouseSpeed = mouseSpeed + map(mouseY, height, 0, -stepSpeed, stepSpeed);

  //constrain variables to min and max
  mouseQuantity = constrain(mouseQuantity, minQuantity, maxQuantity);
}
