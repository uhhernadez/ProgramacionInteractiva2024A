import oscP5.*;
import netP5.*;

ArrayList<MessageReceived> messages;
OscP5 oscP5;
NetAddress myBroadcastLocation; 

void setup() {
  size(1280,720);
  fullScreen();
  frameRate(25);
  messages = new ArrayList<MessageReceived>();
  oscP5 = new OscP5(this,12000);
  myBroadcastLocation = new NetAddress("127.0.0.1",32000);
}


void draw() {
  background(0);
  
  for(int k=0; k < messages.size();k++) {
    messages.get(k).Draw();
  }
  
  for(int k=0; k < messages.size();k++) {
    if(messages.get(k).Remove()) {
      messages.remove(k);
    }
  }
}

void mousePressed() {
  OscMessage myOscMessage = new OscMessage("/test");
  myOscMessage.add(100);
  oscP5.send(myOscMessage, myBroadcastLocation);
}

void keyPressed() {
  OscMessage m;
  switch(key) {
    case('c'):
      /* connect to the broadcaster */
      m = new OscMessage("/server/connect",new Object[0]);
      oscP5.flush(m,myBroadcastLocation);  
      break;
    case('d'):
      /* disconnect from the broadcaster */
      m = new OscMessage("/server/disconnect",new Object[0]);
      oscP5.flush(m,myBroadcastLocation);  
      break;

  }  
}

void oscEvent(OscMessage theOscMessage) {
  println("### received an osc message with addrpattern "+theOscMessage.addrPattern()+" and typetag "+theOscMessage.typetag());
  theOscMessage.print();
  println(theOscMessage.get(0).toString());
  messages.add(new MessageReceived(theOscMessage.get(0).toString(),color(random(128,255), random(128,255), random(128,255)), new PVector(random(0,width), random(0,height))));
  OscMessage myOscMessage = new OscMessage("/piano");
  myOscMessage.add(1);
  oscP5.send(myOscMessage, myBroadcastLocation);
}
