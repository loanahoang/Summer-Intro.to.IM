/*
  This project is modified from https://github.com/sparkfun/SIK-Guide-Code (3 buttons trumpet)
*/

//set the pins for the button and buzzer
int firstKeyPin = A0;
int secondKeyPin = A1;
int thirdKeyPin = A2;
int fourthKeyPin = A3;

int potentiometer = A5;
int vol;
int min_vol = 30; //the upper range of the minumum value read from the potentiometer
int buzzerPin = 2;


void setup() {
  Serial.begin(9600);

  pinMode(firstKeyPin, INPUT_PULLUP);
  pinMode(secondKeyPin, INPUT_PULLUP);
  pinMode(thirdKeyPin, INPUT_PULLUP);
  pinMode(fourthKeyPin, INPUT_PULLUP);
  //take the reading from the potentiometer as the input
  pinMode(potentiometer, INPUT);


  //set the buzzer pin as an output
  pinMode(buzzerPin, OUTPUT);
}

void loop() {
  int vol = analogRead(potentiometer); //returns number from 0 to 1023
  //Serial.println(vol);

  if (digitalRead(firstKeyPin) == LOW) {
    if (digitalRead(secondKeyPin) == HIGH) {
      if (vol <=  min_vol) {
        tone(buzzerPin, 277);              // first key pressed with potentiometer: play c#
        Serial.println(9);
      }
      else {
        tone(buzzerPin, 262);             // first key pressed: play c
        Serial.println(1);
      }
    }

    else if (digitalRead(secondKeyPin) == LOW) {
      if (vol <=  min_vol) {
        tone(buzzerPin, 311);                 // first and second key presses with potentiometer: play d#
        Serial.println(10);
      }
      else {
        tone(buzzerPin, 294);                 // first and second key pressed: play d
        Serial.println(2);

      }
    }
  }

  else if (digitalRead(secondKeyPin) == LOW) {   // second key pressed: play e (e does not have e#)
    if (digitalRead(thirdKeyPin) == HIGH) {
      tone(buzzerPin, 330);
      Serial.println(3);

    }
    else if (digitalRead(thirdKeyPin) == LOW) {  // second key pressed with potentiometer: play f#
      if (vol <= min_vol) {
        tone(buzzerPin, 370);
        Serial.println(11);
      }
      else {
        tone(buzzerPin, 349);                   // second and third key pressed: play f
        Serial.println(4);
      }
    }
  }

  else if (digitalRead(thirdKeyPin) == LOW) {
    if (digitalRead(fourthKeyPin) == HIGH) {
      if (vol <=  min_vol) {
        tone(buzzerPin, 415);              // third key pressed with potentiometer: play g#
        Serial.println(12);
      }
      else {
        tone(buzzerPin, 392);             // third key pressed: play g
        Serial.println(5);
      }
    }

    else if (digitalRead(fourthKeyPin) == LOW) {
      if (vol <=  min_vol) {
        tone(buzzerPin, 466);                 // third and fourth key presses with potentiometer: play a#
        Serial.println(13);
      }
      else {
        tone(buzzerPin, 440);                 // third and fourth key pressed: play a
        Serial.println(6);

      }
    }
  }

  else if (digitalRead(fourthKeyPin) == LOW) {      
    if (vol <= min_vol) {
      tone(buzzerPin, 523);                     // fourth key pressed with potentiometer: play b# = C
      Serial.println(14);
    }
    else {      
      tone(buzzerPin, 494);                     // fourth key pressed: play b
      Serial.println(7);

    }
  }
  
  else {
    noTone(buzzerPin);                          // if no key is pressed turn the buzzer off
  }
}



/*
  note  frequency
  c     262 Hz    c# 277
  d     294 Hz    d# 311
  e     330 Hz
  f     349 Hz    f# 370
  g     392 Hz    g# 415
  a     440 Hz    a# 466
  b     494 Hz
  C     523 Hz
*/
