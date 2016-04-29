#include <SoftwareSerial.h>

const int rx=12; //receive pin on attiny pic any
const int tx=1; //MISO on attiny is also tx

SoftwareSerial mySerial(rx, tx);

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin 0 as an output.
  pinMode(0, OUTPUT);

  mySerial.begin(9600);
}

// the loop function runs over and over again forever
void loop() {
  if(mySerial.available()>0){
    mySerial.println(mySerial.read());
  }
  
  digitalWrite(0, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(250);              // wait for a second
  digitalWrite(0, LOW);    // turn the LED off by making the voltage LOW
  delay(250);              // wait for a second
}
