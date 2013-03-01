#include "testApp.h"

#import "VideoPlayerControls.h"
#import "VideoPlayerControlsDelegateForOF.h"
#import "AVFoundationVideoPlayer.h"

//--------------------------------------------------------------
void testApp::setup(){	
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//If you want a landscape oreintation 
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	//ofBackground(255);
	
	spring1.init(0, ofGetHeight()/2+150, 100);
	spring2.init(ofGetWidth(), ofGetHeight()/2+150, 100);
    bob.init(ofGetWidth()/2, 100);
    
    ofSetFrameRate(60);
	
	currentVid = 0; 
	
	for (int i = 1; i < 10; i++) {
		ofVideoPlayer thisVid;
		//thisVid.loadMovie("video/1bvid.mov");
		bananaVids.push_back(thisVid);
	}
	
	video.loadMovie("video/1bvid.mov");
	video.setLoopState(OF_LOOP_NORMAL);
	video.setPaused(true);
	

	AVFoundationVideoPlayer * avVideoPlayer;
    avVideoPlayer = (AVFoundationVideoPlayer *)video.getAVFoundationVideoPlayer();
    [avVideoPlayer setVideoPosition:CGPointMake(0, 240)];
    //[ofxiPhoneGetGLParentView() insertSubview:avVideoPlayer.playerView belowSubview:controls.view];
    avVideoPlayer.playerView.hidden = YES;
}

//--------------------------------------------------------------
void testApp::update(){

	if(!video.isLoaded()) {
        return;
    }
    
    video.update();
    if (isPlaying)bananaVids[currentVid].update();
}

//--------------------------------------------------------------
void testApp::draw(){
	

	
	ofVec2f gravity;
    gravity.set(0,2);
	
    bob.applyForce (gravity);
    
    // Connect the bob to the spring (this calculates the force)
    spring1.connect(bob);
	spring2.connect(bob);
    // Constrain spring distance between min and max
    spring1.constrainLength(bob,30,200);
	spring2.constrainLength(bob,30,200);
    
    // Update bob
    bob.update();
    // If it's being dragged
    bob.drag(ofGetMouseX(),ofGetMouseY());
    
    // Draw everything
    spring1.displayLine(bob); // Draw a line between spring and bob
	spring2.displayLine(bob); // Draw a line between spring and bob
    bob.display();
    spring1.display();
	spring2.display();
    
    ofSetColor(0);
    ofDrawBitmapString("click on bob to drag",10,ofGetHeight()-5);
	
	if (isPlaying) {
		ofSetColor(0);
		bananaVids[currentVid].draw(0,0);
		bananaVids[currentVid].play();
	}
	if (bananaVids[currentVid].getIsMovieDone()) isPlaying = false;
	
	ofSetColor(255);
    video.getTexture()->draw(0, 0);
	
	cout << video.getPosition() << endl ;
	if (video.getPosition() > .9) video.setPaused(true);
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
	bob.clicked(touch.x, touch.y);
	video.setPosition(0);
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
	bob.clicked(touch.x, touch.y);
}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){
	bob.stopDragging();
	//currentVid = ofRandom(bananaVids.size());
	//isPlaying = true;
	
	
	if (video.getPosition() < .5) {
		cout << "                     PLAY" << endl;
		video.setPaused(false);
	}
	
}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void testApp::playPressed() {

}

void testApp::pausePressed() {

}

void testApp::scrubBegin() {

}

void testApp::scrubToPosition(float position) {

}

void testApp::scrubEnd() {

}

void testApp::loadPressed() {

}

void testApp::unloadPressed() {

}

void testApp::loopOnPressed() {

}

void testApp::loopOffPressed() {

}

void testApp::nativeOnPressed() {

}

void testApp::nativeOffPressed() {

}

void testApp::muteOnPressed() {

}

void testApp::muteOffPressed() {

}
