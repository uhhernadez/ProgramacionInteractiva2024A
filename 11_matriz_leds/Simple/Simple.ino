#include <MD_MAX72xx.h>

#define HARDWARE_TYPE MD_MAX72XX::FC16_HW
#define MAX_DEVICES 1

#define CLK_PIN  13
#define DATA_PIN 11
#define CS_PIN   10

MD_MAX72XX mx = MD_MAX72XX(HARDWARE_TYPE, 
                           DATA_PIN, 
                           CLK_PIN, 
                           CS_PIN,
                           MAX_DEVICES);

void setup() {
  Serial.begin(57600);

  if (!mx.begin()) {
    Serial.print("\n Existe un error en la configuracion");
  }
}

void loop() {
  mx.setPoint(0,0, true);
  mx.setPoint(0,7, true);
  mx.setPoint(1,1, true);
  mx.setPoint(1,6, true);
  mx.setPoint(2,2, true);
  mx.setPoint(2,5, true);
  mx.setPoint(3,3, true);
  mx.setPoint(3,4, true);
  mx.setPoint(4,3, true);
  mx.setPoint(4,4, true);
  mx.setPoint(5,2, true);
  mx.setPoint(5,5, true);
  mx.setPoint(6,1, true);
  mx.setPoint(6,6, true);
  mx.setPoint(7,0, true);
  mx.setPoint(7,7, true);
  delay(100);

  for (int i=0; i <8; i++) {
    for(int j=0; j<8; j++) {
      mx.setPoint(i,j,false);    
    }
  }
  delay(100);
}
