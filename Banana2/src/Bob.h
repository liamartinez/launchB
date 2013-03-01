//
//  Bob.h
//  NOC_3_11_spring_OF
//
//  Created by lia martinez on 2/20/13.
//
//

#ifndef __NOC_3_11_spring_OF__Bob__
#define __NOC_3_11_spring_OF__Bob__

#include "ofMain.h"
#include <iostream>

class Bob {
  
public:
    Bob();
    void init (float x, float y);
    void update();
    void applyForce (ofVec2f force);
    void display();
    void clicked (int mx, int my);
    void stopDragging();
    void drag(int mx, int my);

    ofVec2f location;
    ofVec2f velocity;
    ofVec2f acceleration;
    
    float mass;
    
    // Arbitrary damping to simulate friction / drag
    float damping;
    
    // For mouse interaction
    ofVec2f dragOffset;
    Boolean dragging = false;
    
    
};


#endif /* defined(__NOC_3_11_spring_OF__Bob__) */
