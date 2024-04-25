import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
void setup() {
  size(470, 200);
  println(Arduino.list());
  //arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino = new Arduino(this, "/dev/tty.usbmodem14401", 57600);  
  //arduino = new Arduino(this, "COM3", 56000);  
  arduino.pinMode(13, Arduino.OUTPUT);
  arduino.pinMode(12, Arduino.INPUT);
}
boolean toggle = false;
void draw() {
  if (toggle) {
  arduino.digitalWrite(13, Arduino.HIGH);
  } else {
  arduino.digitalWrite(13, Arduino.LOW);
  }
  //println();
  println(arduino.digitalRead(12));
  float lectura = arduino.analogRead(0);
  float backcolor = map(lectura,0,340,0,255);
  background(backcolor);
}

void mousePressed() {
  toggle = (toggle)? false: true;
}
