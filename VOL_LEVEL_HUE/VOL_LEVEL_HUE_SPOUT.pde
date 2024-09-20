import processing.sound.*;
import spout.*;

Spout spout;

AudioIn in;
Amplitude rms;

PImage img;

void setup()
{
  size(640, 480, OPENGL);
  noStroke();
  colorMode(HSB, 360, 100, 100);

  in = new AudioIn(this, 0);
  in.start();
  rms = new Amplitude(this);
  rms.input(in);

  spout = new Spout(this);
  spout.createSender("VOL_LEVEL_HUE_SPOUT");


  frameRate(60);
}

void draw()
{
  float diameter = map(rms.analyze(), 0.0, 1.0, 0.0, width);

  background(diameter, 100, 100);
  delay(10);
  spout.sendTexture();
}
