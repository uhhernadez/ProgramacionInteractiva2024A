import oscP5.*;
import netP5.*;
import java.util.Queue;
import java.util.LinkedList;

OscP5 oscP5;
NetAddress myBroadcastLocation; 
PVector bin1;
Queue<PVector> points;

void setup() {
  size(500, 500);
  oscP5 = new OscP5(this,12000);
  myBroadcastLocation = new NetAddress("127.0.0.1",32000);
  bin1 = new PVector(0,0);
  points = new LinkedList<PVector>();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rectMode(CENTER);
  rect(bin1.x, bin1.y,20,20*bin1.z);
}

void oscEvent(OscMessage msg) {
  if(msg.checkAddrPattern("/bin/b1")==true) {
    float x = msg.get(0).floatValue();
    println("x = " + str(x));  
    bin1.z = x;
  }
}
