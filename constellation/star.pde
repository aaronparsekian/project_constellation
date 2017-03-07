//class definition for Star
class Star {

  //location
  PVector location;

  //velocity
  PVector velocity;

  //acceleration
  PVector acceleration;

  //size of radius
  float radius;

  //maximum speed
  float maxSpeed;

  //limited magnitude of steering force
  float maxForce;

  //constructor function for Star
  //nameOfTheClass(arguments)
  Star(float x, float y, float size) {
    //starts with no acceleration
    acceleration = new PVector (0, 0);
    //starts with no velocity
    velocity = new PVector(0, 0);
    //starts at the location specified by constructor arguments
    location = new PVector(x, y);
    //initial size
    radius = size;
    //maximum speed
    maxSpeed = 2;
    //maximum force
    maxForce = 1.0;
  }

  //function for updating the position of the Star
  void update() {
    //update velocity, add to it acceleration
    velocity.add(acceleration);
    //limit it to maxSpeed
    velocity.limit(maxSpeed);

    //update location, add to it velocity
    location.add(velocity);
    //limit it to maxSpeed
    velocity.limit(maxSpeed);

    //update acceleration(??)
  }


  //function for applying force to Star
  //add it to current acceleration
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  //function for going towards a target
  void seek(PVector target) {
    //desired velocity, first find the direction
    PVector desired = PVector.sub(target, location);
    //normalize it, make it of unit length
    desired.normalize();
    //multiply it by desired length, which is the maxSpeed
    //because we want to move as fast as we can towards the target
    desired.mult(maxSpeed);

    //steering force is substraction between desired and velocity
    PVector steer = PVector.sub(desired, velocity);
    //limit force of steering
    steer.limit(maxForce);
    //apply the force
    applyForce(steer);
  }

  //function for displaying Star on the canvas
  void display() {
    //store current drawing configuration
    pushMatrix();
    //translate to the location of the Star
    translate(location.x,location.y);
    //restore previous drawing configuration
    popMatrix();
    //put the image 
    tint(100+random(155));
    image(particleImg, location.x, location.y, radius, radius);
    //
  }
}