import processing.serial.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import cc.arduino.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
Arduino arduino;
FFT fft;

int RGBRedPin = 4;    
int RGBGreenPin = 3; 
int RGBBluePin = 2;
int newRed;
int newGreen;
int newBlue;
int bassTotal;

int rgbLed = 23;
int ledPinRed =  35;    
int ledPinGreen =  29;   
int ledPinBlue = 33;
int ledPinYellow =  27;   
int ledPinWhiteOne = 5;
int ledPinWhiteTwo = 6;
int ledPinWhiteThree = 7;
int ledPinWhiteFour = 8;
int ledPinWhiteFive = 9;
int ledPinWhiteSix = 10;
int ledPinWhiteSeven = 11;
int ledPinWhiteEight = 12;
int ledPinWhiteNine = 13;
int elWireOne = 25;

int playSong = 0;
int i = 80;
int scale = 20;
int r;
int scatterOn = 0;
int count = 0;
int bassSensitivity;
int scatterSpeed;

long previousMillis = 0;
long currentMillis;
int millisCount = 0;

float bassOne, bassTwo, kick, leadOne, leadTwo, leadThree, leadFour, leadFive, leadSix, RGBRed, RGBGreen, RGBBlue;

float redSize, greenSize, yellowSize, elwireSize, blueSize, rgbSize;

void setup() {
  frameRate(120);
  smooth(4);
  size(1366, 700, P2D);

  minim = new Minim(this);
  arduino = new Arduino(this, Arduino.list()[0], 57600);

  //song = minim.getLineIn();

  redSize = greenSize = yellowSize = elwireSize = rgbSize = blueSize = 16;

  textFont(createFont("Helvetica", 16));
  textAlign(CENTER);

  arduino.pinMode(ledPinRed, Arduino.OUTPUT);    
  arduino.pinMode(ledPinGreen, Arduino.OUTPUT);  
  arduino.pinMode(ledPinYellow, Arduino.OUTPUT);  
  arduino.pinMode(ledPinBlue, Arduino.OUTPUT);
  arduino.pinMode(elWireOne, Arduino.OUTPUT);
  arduino.pinMode(rgbLed, Arduino.OUTPUT);
  arduino.digitalWrite(ledPinRed, Arduino.LOW);    
  arduino.digitalWrite(ledPinGreen, Arduino.LOW);    
  arduino.digitalWrite(ledPinYellow, Arduino.LOW);    
  arduino.analogWrite(ledPinWhiteOne, 0); 
  arduino.analogWrite(ledPinWhiteTwo, 0);
  arduino.analogWrite(ledPinWhiteThree, 0);
  arduino.analogWrite(ledPinWhiteFour, 0);
  arduino.analogWrite(ledPinWhiteFive, 0);
  arduino.analogWrite(ledPinWhiteSix, 0);
  arduino.analogWrite(ledPinWhiteSeven, 0);
  arduino.analogWrite(ledPinWhiteEight, 0);
  arduino.analogWrite(ledPinWhiteNine, 0);
  arduino.digitalWrite(ledPinBlue, Arduino.LOW);
  arduino.digitalWrite(elWireOne, Arduino.LOW);
  arduino.digitalWrite(rgbLed, Arduino.LOW);
}

void draw() {
  background(0);
  fill(255, 0, 0);

  if (mouseInRect(1050, 60, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Different.mp3", 2048);
    rect(1050, 60, 100, 50);
    bassSensitivity = 205;
    scatterSpeed = 12;
  } else if (mouseInRect(1050, 110, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Faded.mp3", 2048);
    rect(1050, 110, 100, 50);
    bassSensitivity = 165;
    scatterSpeed = 10;
  } else if (mouseInRect(1050, 160, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Frontier.mp3", 2048);
    rect(1050, 160, 100, 50);
    bassSensitivity = 170;
    scatterSpeed = 10;
  } else if (mouseInRect(1050, 210, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Humble.mp3", 2048);
    rect(1050, 210, 100, 50);
    bassSensitivity = 180;
    scatterSpeed = 10;
  } else if (mouseInRect(1050, 260, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Ignite.mp3", 2048);
    rect(1050, 260, 100, 50);
    bassSensitivity = 180;
    scatterSpeed = 10;
  } else if (mouseInRect(1050, 310, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Legend.mp3", 2048);
    rect(1050, 310, 100, 50);
    bassSensitivity = 145;
    scatterSpeed = 10;
  } else if (mouseInRect(1050, 360, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Melodic.mp3", 2048);
    rect(1050, 360, 100, 50);
    bassSensitivity = 100;
    scatterSpeed = 10;
  } else if (mouseInRect(1050, 410, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Venice.mp3", 2048);
    rect(1050, 410, 100, 50);
    bassSensitivity = 150;
    scatterSpeed = 8;
  } else if (mouseInRect(1050, 460, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Do.mp3", 2048);
    rect(1050, 460, 100, 50);
    bassSensitivity = 180;
    scatterSpeed = 15;
  } else if (mouseInRect(1050, 510, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Here.mp3", 2048);
    rect(1050, 510, 100, 50);
    bassSensitivity = 180;
    scatterSpeed = 10;
  } else if (mouseInRect(1050, 560, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Reality.mp3", 2048);
    rect(1050, 560, 100, 50);
    bassSensitivity = 160;
    scatterSpeed = 11;
  } else if (mouseInRect(1150, 60, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Now.mp3", 2048);
    rect(1150, 60, 100, 50);
    bassSensitivity = 180;
    scatterSpeed = 10;
  } else if (mouseInRect(1150, 110, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Restore.mp3", 2048);
    rect(1150, 110, 100, 50);
    bassSensitivity = 180;
    scatterSpeed = 10;
  } else if (mouseInRect(1150, 160, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Spectre.mp3", 2048);
    rect(1150, 160, 100, 50);
    bassSensitivity = 180;
    scatterSpeed = 10;
  } else if (mouseInRect(1150, 210, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Summit.mp3", 2048);
    rect(1150, 210, 100, 50);
    bassSensitivity = 150;
    scatterSpeed = 8;
  } else if (mouseInRect(1150, 260, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Thrones.mp3", 2048);
    rect(1150, 260, 100, 50);
    bassSensitivity = 180;
    scatterSpeed = 19;
  } else if (mouseInRect(1150, 310, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Toca.mp3", 2048);
    rect(1150, 310, 100, 50);
    bassSensitivity = 180;
    scatterSpeed = 12;
  } else if (mouseInRect(1150, 360, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Would.mp3", 2048);
    rect(1150, 360, 100, 50);
    bassSensitivity = 180;
    scatterSpeed = 10;
  } else if (mouseInRect(1150, 410, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Selfie.wav", 2048);
    rect(1150, 410, 100, 50);
    bassSensitivity = 160;
    scatterSpeed = 12;
  } else if (mouseInRect(1150, 460, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Area.mp3", 2048);
    rect(1150, 460, 100, 50);
    bassSensitivity = 160;
    scatterSpeed = 10;
  } else if (mouseInRect(1150, 510, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Move.mp3", 2048);
    rect(1150, 510, 100, 50);
    bassSensitivity = 215;
    scatterSpeed = 16;
  } else if (mouseInRect(1150, 560, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Thunder.mp3", 2048);
    rect(1150, 560, 100, 50);
    bassSensitivity = 150;
    scatterSpeed = 6;
  } else if (mouseInRect(1000, 610, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Presentation1.wav", 2048);
    rect(1000, 610, 100, 50);
    bassSensitivity = 180;
    scatterSpeed = 10;
  } else if (mouseInRect(1200, 610, 100, 50) && mousePressed && playSong == 0)
  {
    song = minim.loadFile("data/Presentation2.mp3", 2048);
    rect(1200, 610, 100, 50);
    bassSensitivity = 180;
    scatterSpeed = 19;
  }

  fill(255);
  textSize(16);
  text("Play Song", 1050, 10, 100, 50);
  text("Stop Song", 1150, 10, 100, 50);
  text("Exit", 1250, 10, 100, 50);
  text("Different", 1050, 60, 100, 50);
  text("Faded", 1050, 110, 100, 50);
  text("Frontier", 1050, 160, 100, 50);
  text("Humble", 1050, 210, 100, 50);
  text("Ignite", 1050, 260, 100, 50);
  text("Legend", 1050, 310, 100, 50);
  text("Melodic Mix", 1050, 360, 100, 50);
  text("Venice", 1050, 410, 100, 50);
  text("Do", 1050, 460, 100, 50);
  text("Here", 1050, 510, 100, 50);
  text("Reality", 1050, 560, 100, 50);  
  text("Now", 1150, 60, 100, 50);
  text("Restore", 1150, 110, 100, 50);
  text("Spectre", 1150, 160, 100, 50);
  text("Summit", 1150, 210, 100, 50);
  text("Thrones", 1150, 260, 100, 50);
  text("Toca", 1150, 310, 100, 50);
  text("Would", 1150, 360, 100, 50);
  text("Selfie", 1150, 410, 100, 50);
  text("Area", 1150, 460, 100, 50);
  text("Move", 1150, 510, 100, 50);
  text("Thunder", 1150, 560, 100, 50);
  text("Presentation Pt.1", 1000, 610, 100, 50);
  text("Presentation Pt.2", 1200, 610, 100, 50);

  text("Bass Sensitivity: " + bassSensitivity, 85, 50);
  text("White LED Scatter Speed: " + scatterSpeed, 118, 100);

  fill(255);
  textSize(redSize);
  text("RED LED", 400, 100);
  textSize(greenSize);
  text("GREEN LED", 590, 100);
  textSize(blueSize);
  text("BLUE LED", 800, 100);
  textSize(yellowSize);
  text("YELLOW LED", 400, 200);
  textSize(rgbSize);
  text("RGB LED ON", 590, 200);
  textSize(elwireSize);
  text("ELWIRE", 800, 200);
  textSize(16);
  text("WHITE LED : " + bassTotal, 72, 150);
  redSize = constrain(redSize * 0.95, 16, 32);
  greenSize = constrain(greenSize * 0.95, 16, 32);
  blueSize = constrain(blueSize * 0.95, 16, 32);
  yellowSize = constrain(yellowSize * 0.95, 16, 32);
  elwireSize = constrain(elwireSize * 0.95, 16, 32);
  rgbSize = constrain(elwireSize * 0.95, 16, 32);

  if (mouseInRect(1150, 10, 100, 50) && mousePressed && playSong == 1)
  {
    song.close();
    count = 0;
    playSong = 0;
    scatterOn = 0;
    arduino.digitalWrite(ledPinRed, Arduino.LOW);    
    arduino.digitalWrite(ledPinGreen, Arduino.LOW);    
    arduino.digitalWrite(ledPinYellow, Arduino.LOW);    
    arduino.analogWrite(ledPinWhiteOne, 0); 
    arduino.analogWrite(ledPinWhiteTwo, 0);
    arduino.analogWrite(ledPinWhiteThree, 0);
    arduino.analogWrite(ledPinWhiteFour, 0);
    arduino.analogWrite(ledPinWhiteFive, 0);
    arduino.analogWrite(ledPinWhiteSix, 0);
    arduino.analogWrite(ledPinWhiteSeven, 0);
    arduino.analogWrite(ledPinWhiteEight, 0);
    arduino.analogWrite(ledPinWhiteNine, 0);
    arduino.digitalWrite(ledPinBlue, Arduino.LOW);
    arduino.digitalWrite(elWireOne, Arduino.LOW);
    arduino.digitalWrite(rgbLed, Arduino.LOW);
  }

  if (mouseInRect(1050, 10, 100, 50) && mousePressed && playSong == 0)
  {
    song.play();
    beat = new BeatDetect(song.bufferSize(), song.sampleRate());
    fft = new FFT(song.bufferSize(), song.sampleRate());
    fft.linAverages(30);
    beat.setSensitivity(40); 

    bl = new BeatListener(beat, song);  

    playSong = 1;
  }
  if (mouseInRect(1250, 10, 100, 50) && mousePressed)
  {
    song.close();
    arduino.digitalWrite(ledPinRed, Arduino.LOW);    
    arduino.digitalWrite(ledPinGreen, Arduino.LOW);    
    arduino.digitalWrite(ledPinYellow, Arduino.LOW);    
    arduino.analogWrite(ledPinWhiteOne, 0); 
    arduino.analogWrite(ledPinWhiteTwo, 0);
    arduino.analogWrite(ledPinWhiteThree, 0);
    arduino.analogWrite(ledPinWhiteFour, 0);
    arduino.analogWrite(ledPinWhiteFive, 0);
    arduino.analogWrite(ledPinWhiteSix, 0);
    arduino.analogWrite(ledPinWhiteSeven, 0);
    arduino.analogWrite(ledPinWhiteEight, 0);
    arduino.analogWrite(ledPinWhiteNine, 0);
    arduino.digitalWrite(ledPinBlue, Arduino.LOW);
    arduino.digitalWrite(elWireOne, Arduino.LOW);
    arduino.digitalWrite(rgbLed, Arduino.LOW);
    exit();
  }

  if (playSong == 1)
  {    
    fft.forward(song.mix);

    bassOne = fft.getBand(2);
    bassTwo = fft.getBand(3);
    kick = fft.getBand(4);

    leadOne = fft.getAvg(11)*scale;
    leadTwo = fft.getAvg(6)*scale;
    leadThree = fft.getAvg(7)*scale;
    leadFour = fft.getAvg(8)*scale;
    leadFive = fft.getAvg(9)*scale;
    leadSix = fft.getAvg(10)*scale;

    RGBRed = fft.getAvg(1);
    RGBGreen = fft.getAvg(2);
    RGBBlue = fft.getAvg(3);
    RGBRed = RGBRed*scale;
    RGBGreen = RGBGreen*scale;
    RGBBlue = RGBBlue*scale;

    newRed = (int)RGBRed;
    newGreen = (int)RGBGreen;
    newBlue = (int)RGBBlue;

    bassTotal = (int)bassOne + (int)bassTwo;
    bassTotal = bassTotal / 5;
    if (bassTotal < 15)
    {
      bassTotal = 0;
    }

    textSize(16);
    for (int i = 0; i < 80; i++)
    {
      float b = fft.getBand(i);
      rect(i*18, height - b, 15, b);
      text(i, i*18, height - b);
      if (b >= 50)
      {

        fill(255, 0, 0);
      } else if (b < 50)
      {

        fill(255);
      }
    }

    if (kick > 100) {
      arduino.digitalWrite(ledPinRed, Arduino.HIGH);   
      redSize = 32;
    }
    if (beat.isSnare() || leadTwo >= 80|| leadThree > 80) {
      arduino.digitalWrite(ledPinGreen, Arduino.HIGH);   
      greenSize = 32;
    }
    if (beat.isHat()) {
      arduino.digitalWrite(ledPinYellow, Arduino.HIGH);   
      yellowSize = 32;
    }
    if (bassOne > 80 || bassTwo > 80) {
      arduino.digitalWrite(elWireOne, Arduino.HIGH);
      elwireSize = 32;
    }
    if (bassOne > 130 || bassTwo > 130) {
      arduino.digitalWrite(rgbLed, Arduino.HIGH);
      rgbSize = 32;
    }
    if (bassOne < 35 || bassTwo < 35) {
      arduino.digitalWrite(elWireOne, Arduino.LOW);
    }
    if (bassOne < 70 || bassTwo < 70) {
      arduino.digitalWrite(rgbLed, Arduino.LOW);
    }
    if (leadOne > 100 || leadTwo > 120 || leadThree > 110 || leadFour > 110 || leadFive > 100 || leadSix > 100) {
      arduino.digitalWrite(ledPinBlue, Arduino.HIGH);
      blueSize = 32;
    }

    if (bassTotal >= bassSensitivity)
    {
      float rNum = random(1, 3);
      r = (int)rNum;
      scatterOn = 1;
    }
    if (scatterOn == 1)
    {
      scatter();
    } else if (scatterOn == 0)
    {
      arduino.analogWrite(ledPinWhiteOne, bassTotal); 
      arduino.analogWrite(ledPinWhiteTwo, bassTotal);
      arduino.analogWrite(ledPinWhiteThree, bassTotal);
      arduino.analogWrite(ledPinWhiteFour, bassTotal);
      arduino.analogWrite(ledPinWhiteFive, bassTotal);
      arduino.analogWrite(ledPinWhiteSix, bassTotal);
      arduino.analogWrite(ledPinWhiteSeven, bassTotal);
      arduino.analogWrite(ledPinWhiteEight, bassTotal);
      arduino.analogWrite(ledPinWhiteNine, bassTotal);
    }

    arduino.analogWrite(RGBRedPin, newRed);
    arduino.analogWrite(RGBGreenPin, newGreen);
    arduino.analogWrite(RGBBluePin, newBlue);

    arduino.digitalWrite(ledPinRed, Arduino.LOW);    
    arduino.digitalWrite(ledPinGreen, Arduino.LOW);    
    arduino.digitalWrite(ledPinYellow, Arduino.LOW);
    arduino.digitalWrite(ledPinBlue, Arduino.LOW);
  }
}

void stop() {
  song.close();
  minim.stop();
  super.stop();
}

boolean mouseInRect(int x, int y, int rectWidth, int rectHeight)
{
  if (mouseX > x && mouseX < x + rectWidth && mouseY > y && mouseY < y + rectHeight) 
  {
    return true;
  } else
  {
    return false;
  }
}