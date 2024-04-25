#include <EasyBuzzer.h>
#define LED_1 3
#define LED_2 5
#define LED_3 6
#define LED_4 9
#define LED_5 10
#define BUZZER 11

void setup() {
  pinMode(LED_1, OUTPUT);
  pinMode(LED_2, OUTPUT);
  pinMode(LED_3, OUTPUT);
  pinMode(LED_4, OUTPUT);
  pinMode(LED_5, OUTPUT);
  pinMode(BUZZER, OUTPUT);
  EasyBuzzer.setPin(BUZZER);
}

void loop() {
  EasyBuzzer.update();
  EasyBuzzer.beep(2000);
  digitalWrite(LED_1, HIGH);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, HIGH);
  digitalWrite(LED_4, LOW);
  digitalWrite(LED_5, HIGH);
  delay(100);
  EasyBuzzer.beep(1000);
  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, HIGH);
  digitalWrite(LED_3, LOW);
  digitalWrite(LED_4, HIGH);
  digitalWrite(LED_5, LOW);
  delay(100);
  digitalWrite(LED_1, LOW);
  digitalWrite(LED_2, LOW);
  digitalWrite(LED_3, LOW);
  digitalWrite(LED_4, LOW);
  digitalWrite(LED_5, LOW);
  delay(500);
}
