size(800,800);

//face
//noStroke();
fill(color(234, 208, 192));
ellipse(800/2, 800/2, 300, 350);

arc(400, 400, 300, 300, PI, 2*PI);

//pupils
fill(color(67, 34, 14, 180));
  ellipse(330, 380, 23, 23);
  ellipse(470, 380, 23, 23);

//outer of the eyes
noFill();
  ellipse(330,380,50,23);
  ellipse(470,380,50,23);
  
//nose
triangle(390, 460, 400, 430, 410, 460);

//lips
noStroke();
fill(color(224, 118, 100));
ellipse(390, 520, 23, 18);
ellipse(410, 520, 23, 18);
ellipse(400, 528, 38, 20);

//heart shape
translate(330, 440);
beginShape(); 
noStroke();
fill(color(250,250,126));

for (float a = 0; a < PI; a+=0.01) {
     float r = 1;
     float x = r* 16* pow(sin(a),3); 
     float y = -r * (13 * cos(a)- 5* cos(2*a) - 2*cos(3*a) -cos(4*a));
     vertex(x,y);
}
endShape();

beginShape(); 
for (float a = 0; a < PI; a+=0.01) {
     float r = 1;
     float x = -r* 16* pow(sin(a),3); 
     float y = -r * (13 * cos(a)- 5* cos(2*a) - 2*cos(3*a) -cos(4*a));
     vertex(x,y);
}
endShape();





  
