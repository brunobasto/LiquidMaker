#include <Stepper.h>

const int stepsPerRevolution = 800;  // change this to fit the number of steps per revolution

Stepper myStepper(stepsPerRevolution, 11, 10, 9, 8);

void setup() {
    pinMode(7, OUTPUT);           // set pin to input

    myStepper.setSpeed(250);
    Serial.begin(9600);
}

void loop() {
  // step one revolution  in one direction:
  Serial.println("clockwise");
  myStepper.step(stepsPerRevolution);
  digitalWrite(7, HIGH);       // turn on pullup resistors
  delay(500);
  digitalWrite(7, LOW);       // turn on pullup resistors

  // step one revolution in the other direction:
  Serial.println("counterclockwise");
  myStepper.step(-stepsPerRevolution);
  digitalWrite(7, HIGH);       // turn on pullup resistors
  delay(500);
  digitalWrite(7, LOW);       // turn on pullup resistors
}
