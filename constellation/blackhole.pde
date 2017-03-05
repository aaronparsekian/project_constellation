//Blackhole class definition
//Blackholeattracts Star particles
class Blackhole {
  //location
  PVector location;

  //velocity
  PVector velocity;

  //acceleration
  PVector acceleration;

  //mass of the blackhole
  float mass;

  //maximum speed
  float maxSpeed;

  //limited magnitude of steering force
  float maxForce;


  //constructor function for Star
  //nameOfTheClass(arguments)
  Blackhole(float x, float y) {
    //starts with no acceleration
    acceleration = new PVector (0, 0);
    //starts with no velocity
    velocity = new PVector(0, 0);
    //starts at the location specified by constructor arguments
    location = new PVector(x, y);
    //initial mass
    mass = 1.0;
    //maximum speed
    maxSpeed = 4;
    //maximum force
    maxForce = 0.1;
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
  
  void move(PVector newPosition) {
    location.x = newPosition.x;
    location.y = newPosition.y;
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

  //function for placing Blackhole on the canvas
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