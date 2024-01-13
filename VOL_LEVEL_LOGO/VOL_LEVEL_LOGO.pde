import processing.sound.*;

AudioIn in;
Amplitude rms;

PImage img;

void setup()
{
  size(640, 480, OPENGL);
  noStroke();
  
  in = new AudioIn(this, 0);
  in.start();
  rms = new Amplitude(this);
  rms.input(in);

  img = loadImage("logo.png");
  
  frameRate(60);
}

void draw()
{
  background(0);
  
  float diameter = map(rms.analyze(), 0.0, 1.0, 0.0,width);

    tint(diameter);
    image(img, width / 4 - diameter, height / 4 - diameter, 320 + (diameter * 2), 320 + (diameter * 2));
}
