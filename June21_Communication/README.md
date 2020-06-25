
## Concepts:
In this assignment, I use the communications between Processing and Arduino to improve my piano. In this new version, when I play any note with Arduino, there will be note played on the laptop screen. 

When you play Do, you will se the note Do played on the screen. 

## Details: 
My circuit contain 4 push buttons, 1 potentiometer, and 1 buzzer. 
I have organized the button direction suitable for the piano's hand position. 

### Input: 
- Button 1: Do 
- Button 1 & potentiometer: Do#
- Button 1 & 2: Re
- Button 1 & 2 & potentiometer: Re#
- Button 2: Mi 
- Button 2 & 3: Fa
- Button 2 & 3 & potentiometer: Fa#
- Button 3: Sol
- Button 3 & potentiometer: Sol#
- Button 3 & 4: La
- Button 3 & 4 & potentiometer: La
- Button 4: Si 
- Button 4 & potentionmeter: Si# = Do 

### Output:
- Buzzer
- Screen 

## Media: 

Video: https://www.youtube.com/watch?v=0U2wVNKgt1Y

![](RealPiano.png)

Keyboard pressed when a note is played on Arduino: 


White note played:


![](105975967_734413287326174_4660013472796609683_n.jpg)


![](105455647_1640978119391123_9099283337618653554_n.jpg)


Black note played:


![](105516867_2654131164828989_1489226824288474011_n.jpg)


![](105485467_679804395932192_6564220251899142553_n.jpg)



Circuit is the same as before: 


![](104884724_3115256061853395_836413844354909050_n.jpg)



Schematic: 

![](106038404_290375358996672_43371593115091600_n.jpg)

## Dificulties:
I encountered difficulties in drawing the circles when I pressed the button. My idea is whenever I play a note on Arduino, there will be a circle appear on the piano keyboard on the scree. I had to figure out how to make the circle disappear when the note is not played. My solution is creating boolean (explained in the code file). I apply this same concept on my final. 

 
