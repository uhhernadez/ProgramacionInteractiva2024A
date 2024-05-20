import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
PVector centro;

void setup() {
  size(500, 500);
  println(Arduino.list());
  //arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino = new Arduino(this, "/dev/tty.usbmodem14401", 57600);  
  //arduino = new Arduino(this, "COM3", 56000);  
  arduino.pinMode(13, Arduino.OUTPUT);
  arduino.pinMode(12, Arduino.INPUT);
  centro = new PVector(0, 0);
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
  float direccion = map(lectura,0,340,0,360);
  background(128);
  translate(width/2, height/2);
  strokeWeight(2);
  float x = 100 * cos(radians(direccion));
  float y = 100 * sin(radians(direccion));
  circle(centro.x,centro.y,40);
  line(centro.x,centro.y,centro.x + x, centro.y + y);
  if(arduino.digitalRead(12) == 1) {
    float dx = 2 * cos(radians(direccion));
    float dy = 2 * sin(radians(direccion));
    centro.add(dx,dy);
  }
}

void mousePressed() {
  toggle = (toggle)? false: true;
}
