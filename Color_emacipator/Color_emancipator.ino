///////////////////26th FEBBBBB 2019 final/////////


#include <Wire.h>
#include "Adafruit_TCS34725.h"

#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
  #include <avr/power.h>
#endif

#define PIN            9
#define NUMPIXELS      4

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

int delayval = 500; // delay for half a second
int flag=0;

int orrr=0,og=0,ob=0;
/* Example code for the Adafruit TCS34725 breakout library */

/* Connect SCL    to analog 5
   Connect SDA    to analog 4
   Connect VDD    to 3.3V DC
   Connect GROUND to common ground */
   
/* Initialise with default values (int time = 2.4ms, gain = 1x) */
// Adafruit_TCS34725 tcs = Adafruit_TCS34725();

/* Initialise with specific int time and gain values */
Adafruit_TCS34725 tcs = Adafruit_TCS34725(TCS34725_INTEGRATIONTIME_700MS, TCS34725_GAIN_1X);



void setup(void) {
  Serial.begin(9600);
  Serial1.begin(9600);

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 // This is for Trinket 5V 16MHz, you can remove these three lines if you are not using a Trinket
#if defined (__AVR_ATtiny85__)
  if (F_CPU == 16000000) clock_prescale_set(clock_div_1);
#endif
  // End of trinket special code

  pixels.begin(); // This initializes the NeoPixel library.
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  
  if (tcs.begin()) {
    Serial.println("Found sensor");
  } else {
    Serial.println("No TCS34725 found ... check your connections");
    while (1);
  }
  
  // Now we're ready to get readings!

  pixels.setPixelColor(0,pixels.Color(0,0,0));
  pixels.setPixelColor(1,pixels.Color(0,0,0));
  pixels.setPixelColor(2,pixels.Color(0,0,0));
  pixels.setPixelColor(3,pixels.Color(0,0,0));
  pixels.show();
}

void loop(void) {
  uint16_t red, green, blue, clear, colorTemp, lux;
  
  tcs.getRawData(&red, &green, &blue, &clear);
  colorTemp = tcs.calculateColorTemperature(red, green, blue);
  lux = tcs.calculateLux(red, green, blue);
  
 // Serial.print("Color Temp: "); Serial.print(colorTemp, DEC); Serial.print(" K - ");
 // Serial.print("Lux: "); Serial.print(lux, DEC); Serial.print(" - ");
  //Serial.print("R: "); Serial.print(red, DEC); Serial.print(" ");
  //Serial.print("G: "); Serial.print(green, DEC); Serial.print(" ");
  //Serial.print("B: "); Serial.print(blue, DEC); Serial.print(" ");
  //Serial.print("C: "); Serial.print(clear, DEC); Serial.print(" ");
  //Serial.println(" ");

   uint32_t sum = clear;
  float r, g, b;
  r = red; r /= sum;
  g = green; g /= sum;
  b = blue; b /= sum;
  r *= 256; g *= 256; b *= 256;

  
    
  //Serial.print("\t");
  //Serial.print((int)r, HEX); Serial.print((int)g, HEX); Serial.print((int)b, HEX);
  //Serial.println();
  //Serial.println((int)r, HEX)+((int)g, HEX)+((int)b, HEX);
 // int code1 =((int)r, HEX);
 // int code2 =((int)g, HEX);
 // int code3 =((int)b, HEX);
  //Serial.println(int(r) + int(g) + int(b) );
  Serial1.print(int(r));
  Serial1.print(",");
  Serial1.print(int(g));
  Serial1.print(",");
  Serial1.print(int(b));
   Serial1.print(",");
  Serial1.println(lux);
  
  Serial.print(int(r));
  Serial.print(",");
  Serial.print(int(g));
  Serial.print(",");
  Serial.print(int(b));
    Serial.print(",");
  Serial.println(lux);


 //pixels.setPixelColor(0, pixels.Color(255,0,0)); 
  //pixels.setPixelColor(1, pixels.Color(0,255,0)); 
   //pixels.setPixelColor(2, pixels.Color(0,0,255)); 
    //pixels.setPixelColor(3, pixels.Color(255,255,0)); 
     //pixels.show();

     if(lux>700 && flag ==0){
      pixels.setPixelColor(0,pixels.Color(0,0,0));
      pixels.setPixelColor(1,pixels.Color(0,0,0));
      pixels.setPixelColor(2,pixels.Color(0,0,0));
      pixels.setPixelColor(3,pixels.Color(0,0,0));
      pixels.show();
      delay(1500);
      pixels.setPixelColor(3,pixels.Color(r,g,b));
      pixels.show();
      flag=1;
      orrr=int(r);
      og=int(g);
      ob=int(b);
      delay(500);
     }
     
     else if(lux>700 && flag ==1){
   //   Serial.println(orrr);
      if(int(r)==orrr || int(g)==og || int(b)==ob ||int(r)==orrr+1 || int(g)==og+1 || int(b)==ob+1 ||int(r)==orrr+2 || int(g)==og+2 || int(b)==ob+2 ||int(r)==orrr+3 || int(g)==og+3 || int(b)==ob+3 ||int(r)==orrr+4 || int(g)==og+4 || int(b)==ob+4 ||int(r)==orrr+5 || int(g)==og+5 || int(b)==ob+5 ||int(r)==orrr+6 || int(g)==og+6 || int(b)==ob+6 ||int(r)==orrr+7 || int(g)==og+7 || int(b)==ob+7||int(r)==orrr+8 || int(g)==og+8 || int(b)==ob+8||int(r)==orrr+9 || int(g)==og+9 || int(b)==ob+9||int(r)==orrr+10 || int(g)==og+10 || int(b)==ob+10){
        pixels.setPixelColor(2,pixels.Color(r,g,b));
        pixels.show();
        flag=2;
         orrr=int(r);
        og=int(g);
        ob=int(b);
        delay(500);
      }
      else
        flag=0;
     }
     
     else if(lux>700 && flag == 2){
      if(int(r)==orrr || int(g)==og || int(b)==ob ||int(r)==orrr+1 || int(g)==og+1 || int(b)==ob+1 ||int(r)==orrr+2 || int(g)==og+2 || int(b)==ob+2 ||int(r)==orrr+3 || int(g)==og+3 || int(b)==ob+3 ||int(r)==orrr+4 || int(g)==og+4 || int(b)==ob+4 ||int(r)==orrr+5 || int(g)==og+5 || int(b)==ob+5 ||int(r)==orrr+6 || int(g)==og+6 || int(b)==ob+6 ||int(r)==orrr+7 || int(g)==og+7 || int(b)==ob+7||int(r)==orrr+8 || int(g)==og+8 || int(b)==ob+8||int(r)==orrr+9 || int(g)==og+9 || int(b)==ob+9||int(r)==orrr+10 || int(g)==og+10 || int(b)==ob+10){
        pixels.setPixelColor(1,pixels.Color(r,g,b));
        pixels.show();
        flag=3;
         orrr=int(r);
      og=int(g);
      ob=int(b);
        delay(500);
      }
      else
        flag=0;
     }

      else if (lux>700 && flag ==3){
        if(int(r)==orrr || int(g)==og || int(b)==ob ||int(r)==orrr+1 || int(g)==og+1 || int(b)==ob+1 ||int(r)==orrr+2 || int(g)==og+2 || int(b)==ob+2 ||int(r)==orrr+3 || int(g)==og+3 || int(b)==ob+3 ||int(r)==orrr+4 || int(g)==og+4 || int(b)==ob+4 ||int(r)==orrr+5 || int(g)==og+5 || int(b)==ob+5 ||int(r)==orrr+6 || int(g)==og+6 || int(b)==ob+6 ||int(r)==orrr+7 || int(g)==og+7 || int(b)==ob+7||int(r)==orrr+8 || int(g)==og+8 || int(b)==ob+8||int(r)==orrr+9 || int(g)==og+9 || int(b)==ob+9||int(r)==orrr+10 || int(g)==og+10 || int(b)==ob+10){
        pixels.setPixelColor(0,pixels.Color(r,g,b));
        pixels.show();
       // flag=0;//change flag to 4 for mixed palette
        orrr=int(r);
      og=int(g);
      ob=int(b);
      }
      else
        flag=0;
     }
      
     
  
}
