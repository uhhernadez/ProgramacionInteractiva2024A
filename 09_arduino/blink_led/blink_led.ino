#define PWM_PIN_3 3
#define PWM_PIN_5 5
#define PWM_PIN_6 6
#define PWM_PIN_9 9
#define PWM_PIN_10 10

void setup() {
  Serial.begin(9600);
  pinMode(PWM_PIN_3,OUTPUT);
  pinMode(PWM_PIN_5,OUTPUT);
  pinMode(PWM_PIN_6,OUTPUT);
  pinMode(PWM_PIN_9,OUTPUT);
  pinMode(PWM_PIN_10,OUTPUT);
}

void loop() {
  int potenciometro = analogRead(A0);
  Serial.println(potenciometro);
  int nuevo = map(potenciometro, 0, 930, 0, 255);
  analogWrite(PWM_PIN_3, nuevo);
  analogWrite(PWM_PIN_5, nuevo);
  analogWrite(PWM_PIN_6, nuevo);
  analogWrite(PWM_PIN_9, nuevo);
  analogWrite(PWM_PIN_10, nuevo);
}
