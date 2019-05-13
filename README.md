# Thing

5/6/19
James worked on LivingRock move.
Nathan worked on LivingRock display.
Derek worked on Ball move.
Chong worked on Ball display.

5/7/19
Chong and Derek worked on the Ball methods and tried to make it stay in boundary, still working on it.
Nathan and James continued working on the movement and display methods for rock.
Afternoon: Derek has successfully made Ball stay in boundary.

5/8/19
Early Morning: Derek added the Collideable interface, but due to the nature of the display method in Ball and Derek's lack of computer science experience/lack of knowledge of java/lack of will to dig deeply to learn completely how processing3 works, he has saved this part for the next day.
Nathan: was able to randomly pick from two rocks and display one for each rock
James : added eyes to the living rock

5/9/19:
Derek Lao; Add red and tested code to make rock colliding with ball to produce red. Also added FPS thing, maybe helpful.
Nathan: finalized the display methods for rock

5/11/19:
Chong : Edited display method of the Ball class so that it is compatible with the collideable interface. Also added display method for BallTwo, which is one of the subclass of the Ball class.

5/12/19:
Chong:
Added a display method for BallOne, the other subclass of the Ball class. The different display methods for the two subclasses ensure that they appear differently. Also edited display for BallTwo so that it turns blue when it collides with a rock rather than turning red. Added more changes to the BallTWo class. BallTwo has random speeds and direction when it is created. When it hits the wall, it changes to random speed and random direction. Changes were made to the constructor to implement different variable regarding speed. Also BallTwo are slightly smaller than BallOne so that it is differentiate them.

Derek:
shortened out of bounds checking/colliding code, removed obsolete code, implemented private method moveDirection() for BallOne
Added to force widthIncrement or heightIncrement to not be trivially small so movement is hard to be observed
added randomDirectionMovement, and added a mechanism to randomly choose between those paths

Nathan:
Code wasn't working so he fixed it.  Also fixed the frame rate problem that was caused because a line that was deleted before made its way back into the code and so an image was being re loaded with every call to draw.  Helped fix the movement of the living rock. Put the finishing touches on the project so that it can work.

James:
Worked on the different movement methods for the living rock. Utilized random() for one method in which the rock will just move in sporatic movements in short little bursts. The other method the rock utilizes directions calculated by the pythagorean theorem and additionally can move in any direction.

5/13/19
Early Morning: Derek made bounce random for BallOne, attempted to make code unredundant for BallOne movement, took out print statements, merged the outside file with inner file.
Added moveLoop() and moveLag() move methods for BallOne, did it largely for fun, and was not hard to code.

