import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;
int fromPD = 0;

void setup() {
  size(400,400);
  frameRate(25);
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",12001);
}


void draw() {
  background(125);
  translate(width/2, height/2);
  textSize(100);
  textAlign(CENTER);
  text(fromPD,0,0);
}

void mousePressed() {
  OscMessage myMessage = new OscMessage("/test");  
  myMessage.add(123); /* add an int to the osc message */
  oscP5.send(myMessage, myRemoteLocation); 
}


void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  println(theOscMessage.get(0).intValue());
  fromPD = theOscMessage.get(0).intValue();
}
