//Blackhole class
//Blackholeattracts Star particles
class Blackhole {
  PVector location;

  //initial position
  PVector initPos;

  PVector velocity;

  //acceleration
  PVector acceleration;

  //mass of the blackhole
  float mass;

  //maximum speed
  float maxSpeed;

  //limited magnitude of steering force
  float maxForce;

  Blackhole(float x, float y) {
    acceleration = new PVector (0, 0);
    velocity = new PVector(0, 0);

    //starts at the location specified by constructor arguments
    initPos = new PVector(x, y);
    //starts at the location specified by constructor arguments
    location = new PVector(x, y);
    //initial mass
    mass = 1.0;
    //maximum speed
    maxSpeed = 4;
    //maximum force
    maxForce = 0.01;
  }

  //update position
  void update() {
    //update velocity,add acceleration
    velocity.add(acceleration);
    //limit to maxSpeed
    velocity.limit(maxSpeed);

    //update location,add velocity
    location.add(velocity);
    //limit to maxSpeed
    velocity.limit(maxSpeed);
  }

  void move(PVector newPosition) {
    location.x = newPosition.x;
    location.y = newPosition.y;
  }


  //apply force
  //add it to current acceleration
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  //go to target
  void seek(PVector target) {
    //find the direction for desired velocity
    PVector desired = PVector.sub(target, location);
    //unit length 
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

  //place Blackhole on the canvas
  void display() {
    //store current drawing configuration
    pushMatrix();
    //translate to the location of the BlackHole
    translate(location.x, location.y);
    //restore previous drawing configuration
    popMatrix();
  }

  //function for checking edges and wrapping around
  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}
