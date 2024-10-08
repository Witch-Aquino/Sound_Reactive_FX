import processing.sound.*;
import spout.*;

Spout spout;

AudioIn in;
Amplitude rms;
FFT fft;

int bands = 256;
float scale = 20.0;

PImage img;

void setup()
{
  size(640, 480, OPENGL);
  noStroke();
  
  in = new AudioIn(this, 0);
  in.start();
  rms = new Amplitude(this);
  rms.input(in);
  fft = new FFT(this, bands);
  fft.input(in);
  
  img = loadImage("logo.png");

  spout = new Spout(this);
  spout.createSender("FFT_LEVEL_2_SPOUT");
 
  frameRate(60);
}

void draw()
{

  float diameter = map(rms.analyze(), 0.0, 1.0, 0.0,width);

  if (diameter > 170) {
    background(255, 255, 255);    
  } else {
    background(0, 0, 0);
  }

  tint(0, 0, 0);
  image(img, width / 4, height / 4, 320, 320);
 
  fft.analyze();
  float w = width/float(bands);
  noFill();
  beginShape();
  for (int i = 0; i < bands; i++) {
    stroke(255);
    vertex(i * width / float(bands), height / 2 - fft.spectrum[i] * height * scale); 
    vertex(i * width / float(bands), height / 2 - fft.spectrum[i] * height * scale * -1); 
  }
  endShape();
  
  spout.sendTexture();

}
