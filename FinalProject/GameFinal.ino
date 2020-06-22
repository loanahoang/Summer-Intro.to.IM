

//set the pins for the button and buzzer
int firstKeyPin = A0;
int secondKeyPin = A1;
int thirdKeyPin = A2;
int fourthKeyPin = A3;


void setup() {
  Serial.begin(9600);
  //set the button pins as inputs
  pinMode(firstKeyPin, INPUT_PULLUP);
  pinMode(secondKeyPin, INPUT_PULLUP);
  pinMode(thirdKeyPin, INPUT_PULLUP);
  pinMode(fourthKeyPin, INPUT_PULLUP);
  
  pinMode(13, OUTPUT);
}

void loop() {

  if (digitalRead(firstKeyPin) == LOW) {  //move the spaceship to the right 
    //Serial.write(1);   
    digitalWrite(13, HIGH); 
    Serial.println(1);                   
  }
  else if (digitalRead(secondKeyPin) == LOW) {  //move the spaceship to the left
    Serial.println(2);
    digitalWrite(13, HIGH);
                           
  }
  else if (digitalRead(thirdKeyPin) == LOW) {  //fire the bullet
    Serial.println(3);
    digitalWrite(13, HIGH);                       
  }
  else if (digitalRead(fourthKeyPin) == LOW) { 
    Serial.println(4);
    digitalWrite(13, HIGH);                       
  }
  else {
    Serial.write(0);
    digitalWrite(13, LOW);                       
  }
}
