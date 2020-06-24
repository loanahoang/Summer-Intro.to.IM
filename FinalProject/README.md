# Introduction to Interactive Media - Final Project 

## Concepts:
- Improving Space Ship Invasion (midterm project) by changing the interaction with game via physical button on Arduino instead of using the mouse like before


At first, I wanted to upgrade my initial game as a 1-player interaction with the mouse into a 2-player one using the push button on Arduino. However, when thinking about my project practicality based on what we have in the kit, I think it is not possible to do it. We have 2 spaceships which requires each at least 2 buttons to change directions and 1 more to shoot the bullet; this means each ship needs 3 buttons in total for my initial idea. Yet, there are only 4 buttons in our kit. Therefore, I changed my plan into a less complex way: a 1-player game but controling through arduino instead of using a mouse. 




## Details:

### Input:
 - Yellow push button: Going left 
 - Red push button: Going right 
 - Blue push button: Shoot the bullet from the spaceship
 - Green push button: Restart the game 
 
 ### Output:
- Motion on Processing 

## Media:

Video: https://www.youtube.com/watch?v=0U2wVNKgt1Y


![](schematic1.jpg)

![](105846841_607422366862777_4387858964236092607_n.jpg)
## Difficulties: 
- Communication between Arduino and Processing 
- Understanding the speed of the ship 
- When Processing read data from Arduino directly, the result was not like I expected. If read directly, my ship will moving left or right forever depsite not pressing the buttons. So I had to think of creating a boolean so that the ship only does action when button pressed

