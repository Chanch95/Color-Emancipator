import de.voidplus.leapmotion.*;
import processing.serial.*;
PImage img;
int barWidth = 0;
int lastBar = 0;
int[] a=new int[214748];
int[] b=new int[214748];
float[] c=new float[214748];
int z=0;
int op;
int r, g,bb,lux;
color colourrrr;
color[] colcol = new color[10];
int flag=0;

//////////////////////////////////////////////////////////////////
int lf = 10;    // Linefeed in ASCII
String myString = null;
Serial myPort;  // The serial port
String[] rgbcode = new String[4];

PVector pos1,pos2,pos3,pos4,pos5, fingvel1,fingvel2,fingvel3,fingvel4,fingvel5;
LeapMotion leap;
//////////////////////////////////////////////////////////////////

void setup() {
 // size(640, 1136);
  size(1600, 900);
  noStroke();
 // background(255);
 //img = loadImage("w.jpg");
  //image(img,0,0);
  smooth();
  
  printArray(Serial.list());
myPort = new Serial(this, Serial.list()[1], 9600);
  myPort.clear();
myString = myPort.readStringUntil(lf);
  myString = null;
 // leap = new LeapMotion(this);
 leap = new LeapMotion(this).allowGestures("circle, swipe, screen_tap,");
}

// 1. Callbacks

void leapOnInit() {
  // println("Leap Motion Init");
}
void leapOnConnect() {
  // println("Leap Motion Connect");
}
void leapOnFrame() {
  // println("Leap Motion Frame");
}
void leapOnDisconnect() {
  // println("Leap Motion Disconnect");
}
void leapOnExit() {
  // println("Leap Motion Exit");
}
// ======================================================
// 1. Swipe Gesture

void leapOnSwipeGesture(SwipeGesture g, int state){
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector positionStart    = g.getStartPosition();
  PVector direction        = g.getDirection();
  float   speed            = g.getSpeed();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();

  switch(state){
    case 1: // Start
      break;
    case 2: // Update
      break;
    case 3: // Stop
      println("SwipeGesture: " + id);
      fill(255,255,255);
     // rect(0,0,640,1136);
     rect(0,0,1600,1136);
      break;
  }
}


// ======================================================
// 2. Circle Gesture

void leapOnCircleGesture(CircleGesture g, int state){
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector positionCenter   = g.getCenter();
  float   radius           = g.getRadius();
  float   progress         = g.getProgress();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();
  int     direction        = g.getDirection();

  switch(state){
    case 1: // Start
      break;
    case 2: // Update
      break;
    case 3: // Stop
      println("CircleGesture: " + id);
     //  fill(255,255,255);
     // rect(0,0,640,1136);
      break;
  }

  switch(direction){
    case 0: // Anticlockwise/Left gesture
      break;
    case 1: // Clockwise/Right gesture
      break;
  }
}


// ======================================================
// 3. Screen Tap Gesture

void leapOnScreenTapGesture(ScreenTapGesture g){
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector direction        = g.getDirection();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();

  println("ScreenTapGesture: " + id);
}


// ======================================================
// 4. Key Tap Gesture

void leapOnKeyTapGesture(KeyTapGesture g){
  int     id               = g.getId();
  Finger  finger           = g.getFinger();
  PVector position         = g.getPosition();
  PVector direction        = g.getDirection();
  long    duration         = g.getDuration();
  float   durationSeconds  = g.getDurationInSeconds();

  println("KeyTapGesture: " + id);
}

void draw() {
  
  
////////////LEAPPPPPPPPP///////////////////////////////
  int fps = leap.getFrameRate();
  for (Hand hand : leap.getHands ()) {


    // ==================================================
    // 2. Hand

    int     handId             = hand.getId();
    PVector handPosition       = hand.getPosition();
    PVector handStabilized     = hand.getStabilizedPosition();
    PVector handDirection      = hand.getDirection();
    PVector handDynamics       = hand.getDynamics();
    float   handRoll           = hand.getRoll();
    float   handPitch          = hand.getPitch();
    float   handYaw            = hand.getYaw();
    boolean handIsLeft         = hand.isLeft();
    boolean handIsRight        = hand.isRight();
    float   handGrab           = hand.getGrabStrength();
    float   handPinch          = hand.getPinchStrength();
    float   handTime           = hand.getTimeVisible();
    PVector spherePosition     = hand.getSpherePosition();
    float   sphereRadius       = hand.getSphereRadius();

    // --------------------------------------------------
    // Drawing
  //  hand.draw();


    // ==================================================
    // 3. Arm

    if (hand.hasArm()) {
      Arm     arm              = hand.getArm();
      float   armWidth         = arm.getWidth();
      PVector armWristPos      = arm.getWristPosition();
      PVector armElbowPos      = arm.getElbowPosition();
    }


    // ==================================================
    // 4. Finger

    Finger  fingerThumb        = hand.getThumb();
    // or                        hand.getFinger("thumb");
    // or                        hand.getFinger(0);

    Finger  fingerIndex        = hand.getIndexFinger();
    // or                        hand.getFinger("index");
    // or                        hand.getFinger(1);

    Finger  fingerMiddle       = hand.getMiddleFinger();
    // or                        hand.getFinger("middle");
    // or                        hand.getFinger(2);

    Finger  fingerRing         = hand.getRingFinger();
    // or                        hand.getFinger("ring");
    // or                        hand.getFinger(3);

    Finger  fingerPink         = hand.getPinkyFinger();
    // or                        hand.getFinger("pinky");
    // or                        hand.getFinger(4);        

   

    for (Finger finger : hand.getFingers()) {
      // or              hand.getOutstretchedFingers();
      // or              hand.getOutstretchedFingersByAngle();

      int     fingerId         = finger.getId();
      PVector fingerPosition   = finger.getPosition();
      PVector fingerStabilized = finger.getStabilizedPosition();
      PVector fingerVelocity   = finger.getVelocity();
      PVector fingerDirection  = finger.getDirection();
      float   fingerTime       = finger.getTimeVisible();

      
      pos1=fingerThumb.getPosition();
      fingvel1=finger.getVelocity();
      
      pos2=fingerIndex.getPosition();
      fingvel2=finger.getVelocity();
      
      pos3=fingerMiddle.getPosition();
      fingvel3=finger.getVelocity();
      
      pos4=fingerRing.getPosition();
      fingvel4=finger.getVelocity();
      
      pos5=fingerPink.getPosition();
      fingvel5=finger.getVelocity();
      
   /////////////   System.out.println(pos1 + "        " + fingvel1);////////
      // ------------------------------------------------
      // Drawing

      // Drawing:
      // finger.draw();  // Executes drawBones() and drawJoints()
      // finger.drawBones();
      // finger.drawJoints();

      // ------------------------------------------------
      // Selection

      switch(finger.getType()) {
      case 0:
        // System.out.println("thumb");
        break;
      case 1:
        // System.out.println("index");
        break;
      case 2:
        // System.out.println("middle");
        break;
      case 3:
        // System.out.println("ring");
        break;
      case 4:
        // System.out.println("pinky");
        break;
      }


      // ================================================
      // 5. Bones
      // --------
      // https://developer.leapmotion.com/documentation/java/devguide/Leap_Overview.html#Layer_1

      Bone    boneDistal       = finger.getDistalBone();
      // or                      finger.get("distal");
      // or                      finger.getBone(0);

      Bone    boneIntermediate = finger.getIntermediateBone();
      // or                      finger.get("intermediate");
      // or                      finger.getBone(1);

      Bone    boneProximal     = finger.getProximalBone();
      // or                      finger.get("proximal");
      // or                      finger.getBone(2);

      Bone    boneMetacarpal   = finger.getMetacarpalBone();
      // or                      finger.get("metacarpal");
      // or                      finger.getBone(3);

      // ------------------------------------------------
      // Touch emulation

      int     touchZone        = finger.getTouchZone();
      float   touchDistance    = finger.getTouchDistance();

      switch(touchZone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#" + fingerId + "): " + touchDistance);
        break;
      case 1: // Touching
        // println("Touching (#" + fingerId + ")");
        break;
      }
    }


    // ==================================================
    // 6. Tools

    for (Tool tool : hand.getTools()) {
      int     toolId           = tool.getId();
      PVector toolPosition     = tool.getPosition();
      PVector toolStabilized   = tool.getStabilizedPosition();
      PVector toolVelocity     = tool.getVelocity();
      PVector toolDirection    = tool.getDirection();
      float   toolTime         = tool.getTimeVisible();

      // ------------------------------------------------
      // Drawing:
      // tool.draw();

      // ------------------------------------------------
      // Touch emulation

      int     touchZone        = tool.getTouchZone();
      float   touchDistance    = tool.getTouchDistance();

      switch(touchZone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#" + toolId + "): " + touchDistance);
        break;
      case 1: // Touching
        // println("Touching (#" + toolId + ")");
        break;
      }
    }
  }


  // ====================================================
  // 7. Devices

  for (Device device : leap.getDevices()) {
    float deviceHorizontalViewAngle = device.getHorizontalViewAngle();
    float deviceVericalViewAngle = device.getVerticalViewAngle();
    float deviceRange = device.getRange();
  }  
////////////LEAPPPPPPPPP//////////////////////////////
  
////////COLORSENSOR------///////////////////////////////////////////////
      while (myPort.available() > 0) {
    // store the data in myString 
    myString = myPort.readStringUntil(lf);
    // check if we really have something
    if (myString != null) {
      myString = myString.trim(); // let's remove whitespace characters
      // if we have at least one character...
   print(myString);
      
       rgbcode = split(myString,",");
       r = Integer.parseInt(rgbcode[0]);
       g= Integer.parseInt(rgbcode[1]);
       bb= Integer.parseInt(rgbcode[2]);
       lux=Integer.parseInt(rgbcode[3]);
       //flag++;
       //if(flag==15){
        // colourrrr = color(r,g,bb);
        // flag=0;
        // delay(500);
      // }
       if(lux>700){
          colourrrr = color(r,g,bb);
       }
       //colourrrr = color(r,g,bb);
     //  println(colourrrr);
      //fill(colourrrr);  // Use color variable 'c' as fill color
     // noStroke();  // Don't draw a stroke around shapes
    //  ellipse(pos1.x,pos1.y, 80, 80);  // Draw left circle
    

    
      }
    }
////////////////////////COLORR SENSORRR/////////////////////////////
    
 
//////////////////////PAINTING STROKE////////////////////////////////////////////
     if (mousePressed) {
  //  background(0);
  }
      //fill(0);
  //fill(255);
 //brown fill(139,69,19);
  ////////fill(255, 243, 0,30);
 //println(colourrrr);
 fill(colourrrr);
 ellipse(pos1.x,pos1.y, 15, 15);
//////////  ellipse(mouseX, mouseY, 15, 15);
  //ellipse(width-mouseX, mouseY, 5, 5);
//  ellipse(mouseX, height-mouseY, 5, 5);
//  ellipse(width-mouseX, height-mouseY, 5, 5);
 ///// a[z]=mouseX;
 ///// b[z]=mouseY;
 a[z] = int(pos1.x);
 a[z] = int(pos1.y);

  z++;


  for (int k=1; k<z; k+=5) {
   // c[k]+=0.3;
   c[k]+=0.9;
    
  /////  fill(255, 243, 0,20);
 //println(colourrrr);
  fill(colourrrr);
 //fill(139,69,19);
   // ellipse(a[k], b[k]+c[k], 20/(c[k]/3+1), 20/(c[k]/3+1));
  // ellipse(a[k], (b[k]+c[k]), 20/(c[k]/3+1), 20/(c[k]/3+1));
  ellipse(300+k,300+k,20/k,20/k );
 
  }
  for (int start=millis(); start+1>millis(); );
  /////////////////////////////PAINTING STROKEEE//////////////////////////////////
  
//saveFrame("line-######.tiff");
}
