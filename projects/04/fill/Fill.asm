// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
    @pixel
    M=-1
(LOOP)
    //Look at pixel position and move within bounds [@SCREEN to 1 less than @KBD] or [0 to 8192]
    @pixel
    MD=M+1
    @8191
    D=D-A
    @ZEROPIXEL
    D; JGT
    @CHECKKBD
    0; JMP
(ZEROPIXEL)
    @pixel
    M=0
    
    //Look at keyboard and determine fill type
(CHECKKBD)
    @KBD
    D=M
    @FILLBLACK
    D; JGT
    
    //Fill pixel position either black or white
    //Fill white
    @pixel
    D=M
    @SCREEN
    A=D+A
    M=0
    @LOOP
    0; JMP
    
(FILLBLACK)
    @pixel
    D=M
    @SCREEN
    A=D+A
    M=-1
    //Return to loop
    @LOOP
    0; JMP