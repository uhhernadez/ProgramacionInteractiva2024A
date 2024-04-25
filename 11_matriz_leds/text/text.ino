#include <MD_Parola.h>
#include <MD_MAX72xx.h>
#include <SPI.h>

#define HARDWARE_TYPE MD_MAX72XX::FC16_HW
#define MAX_DEVICES	1

#define CLK_PIN   13  // or SCK
#define DATA_PIN  11  // or MOSI
#define CS_PIN    10  // or SS

// Arbitrary pins
MD_Parola P = MD_Parola(HARDWARE_TYPE, CS_PIN, MAX_DEVICES);

void setup() {
  Serial.begin(57600);
  P.begin();
}

void loop() {
  int potenciometro = analogRead(A0);
  Serial.println(potenciometro);
  int n = map(potenciometro, 0, 310, 0, 9);
  P.print(n);
}
