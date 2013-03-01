// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Bob class, just like our regular Mover (location, velocity, acceleration, mass)


#include "Bob.h"


//---------------------------------------------------------------------------------------
Bob::Bob() {
    
}

//---------------------------------------------------------------------------------------

void Bob::init (float x, float y) {
    
    location.set(x,y);
    velocity.set(0, 0);
    acceleration.set(0, 0);
    dragOffset.set(0, 0);
    damping = 0.98;
     mass = 24;
}

//---------------------------------------------------------------------------------------

void Bob::update() {
    
    velocity += acceleration;
    velocity *= damping;
    location += velocity;
    acceleration *= 0; 
}

//---------------------------------------------------------------------------------------

void Bob::applyForce (ofVec2f force){
    
    force /= mass;
    acceleration += force;
}
 
//---------------------------------------------------------------------------------------

void Bob::display() {
    //stroke(0);
    //strokeWeight(2);
    
    ofSetColor(175);
    if (dragging) {
     ofSetColor(50);
    }
    ofEllipse(location.x,location.y,mass*2,mass*2);

    
}

//---------------------------------------------------------------------------------------

void Bob::clicked (int mx, int my){
    float d = ofDist(mx,my,location.x,location.y);
    if (d < mass) {
        dragging = true;
        dragOffset.x = location.x-mx;
        dragOffset.y = location.y-my;
    }
}

//---------------------------------------------------------------------------------------

void Bob::stopDragging() {
    dragging = false;
}

//---------------------------------------------------------------------------------------

void Bob::drag(int mx, int my){
    if (dragging) {
        location.x = mx + dragOffset.x;
        location.y = my + dragOffset.y;
    }
}





