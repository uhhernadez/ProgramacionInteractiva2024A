import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myBroadcastLocation; 
PVector position;

void setup() {
  size(500, 500);
  oscP5 = new OscP5(this,12000);
  myBroadcastLocation = new NetAddress("127.0.0.1",32000);
  position = new PVector(0,0);
}

void draw() {
  translate(width/2, height/2);
  rectMode(CENTER);
  rect(position.x, position.y,20,20);
}

void oscEvent(OscMessage msg) {
  try {
  if(msg.checkAddrPattern("/cuadrado/x")==true) {
    float x = msg.get(0).floatValue();
    println("x = " + str(x));  
    position.x = x;
  }
  if(msg.checkAddrPattern("/cuadrado/y")==true) {
    float y = msg.get(0).floatValue();
    println("y = " + str(y));
    position.y = y;
  }
  } catch (Exception e) {
  
  }
}
