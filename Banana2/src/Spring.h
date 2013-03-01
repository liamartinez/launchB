//
//  Spring.h
//  NOC_3_11_spring_OF
//
//  Created by lia martinez on 2/20/13.
//
//

#ifndef __NOC_3_11_spring_OF__Spring__
#define __NOC_3_11_spring_OF__Spring__

#include <iostream>
#include "ofMain.h"
#include "Bob.h"

class Spring {
  
public:
    Spring();
    
    void init (float x, float y, int l);
    void connect(Bob &b);
    void constrainLength(Bob &b, float minlen, float maxlen);
    void display();
    void displayLine(Bob &b);
    
    // Location
    ofVec2f anchor;
    
    // Rest length and spring constant
    float len;
    float k = 0.2;
    
};


#endif /* defined(__NOC_3_11_spring_OF__Spring__) */
