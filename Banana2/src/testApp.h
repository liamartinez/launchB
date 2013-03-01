#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"

#include "Spring.h"
#include "Bob.h"

class testApp : public ofxiPhoneApp{
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);

void playPressed();
void pausePressed();
void scrubBegin();
void scrubToPosition(float position);
void scrubEnd();
void loadPressed();
void unloadPressed();
void loopOnPressed();
void loopOffPressed();
void nativeOnPressed();
void nativeOffPressed();
void muteOnPressed();
void muteOffPressed();

		Spring spring1;
		Spring spring2;
		Bob bob;

		int currentVid;

		vector <ofVideoPlayer> bananaVids ;
		ofiPhoneVideoPlayer video;
bool isPlaying;

};


