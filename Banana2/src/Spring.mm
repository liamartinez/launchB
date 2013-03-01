// Nature of Code 2011
// Daniel Shiffman
// Chapter 3: Oscillation

// Class to describe an anchor point that can connect to "Bob" objects via a spring
// Thank you: http://www.myphysicslab.com/spring2d.html
#include "Spring.h"


//---------------------------------------------------------------------------------------

Spring::Spring() {
    
}

//---------------------------------------------------------------------------------------

void Spring::init (float x, float y, int l) {
    anchor.set(x, y);
    len = l;
}

//---------------------------------------------------------------------------------------

void Spring::connect(Bob &b) {
    
    // Vector pointing from anchor to bob location
    ofVec2f force = b.location - anchor; 
    // What is distance
    float d = force.length();
    // Stretch is difference between current distance and rest length
    float stretch = d - len;
    
    // Calculate force according to Hooke's Law
    // F = k * stretch
    force.normalize();
    force *= (-1 * k * stretch);
    b.applyForce(force);
    
}

//---------------------------------------------------------------------------------------

void Spring::constrainLength(Bob &b, float minlen, float maxlen) {
    
    ofVec2f dir = b.location - anchor; 
    
    float d = dir.length();
    // Is it too short?
    if (d < minlen) {
        dir.normalize();
        dir *= minlen;
        // Reset location and stop from moving (not realistic physics)
        b.location = anchor + dir; 
        b.velocity *= 0;
        // Is it too long?
    }
    else if (d > maxlen) {
        dir.normalize();
        dir *= maxlen;
        // Reset location and stop from moving (not realistic physics)
        b.location = anchor + dir;
        b.velocity *= 0;
    }
}

//---------------------------------------------------------------------------------------

void Spring::display(){
    //stroke(0);
    //fill(175);
    //strokeWeight(2);
    
    ofSetColor(175);
    ofSetRectMode(OF_RECTMODE_CENTER);
    ofRect(anchor.x, anchor.y, 10, 10);
}

//---------------------------------------------------------------------------------------

void Spring::displayLine(Bob &b) {
     ofLine(b.location.x, b.location.y, anchor.x, anchor.y);
}

//---------------------------------------------------------------------------------------
