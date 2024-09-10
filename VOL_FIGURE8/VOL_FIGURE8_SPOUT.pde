import processing.sound.*;
import spout.*;

Spout spout;

AudioIn in;
Amplitude rms;

PImage img;
int count = 0;


void setup(){
  size(640, 480, OPENGL);
  fill(204);
  strokeWeight(2);
    
  in = new AudioIn(this, 0);
  in.start();
  rms = new Amplitude(this);
  rms.input(in);

  img = loadImage("logo.png");

  spout = new Spout(this);
  spout.createSender("VOL_FIGURE8_SPOUT");
  
  frameRate(60);
  
}

void draw(){
  count++;
  lights();
  background(0);

  ortho(-width/2, width/2, -height/2, height/2);
  translate(width/2, height/2, 0);
    
  float diameter = map(rms.analyze(), 0.0, 1.0, 0.0,width);

  if (count <= 360){
    //rotateX(radians(count));
    rotateY(radians(count));
    rotateZ(radians(count));
    image(img, -width / 4 -diameter / 2, -height / 4 -diameter / 2, 320 + diameter, 320 + diameter);
  } else {
    count = 0;
  }
  spout.sendTexture(); 
}
