import processing.sound.*;
import spout.*;

Spout spout;

AudioIn in;
Amplitude rms;

PImage img;
int i = 0;
int shape = 0;
int random_w = int(random(width));
int random_h = int(random(height));

   
void setup()
{
  size(640, 480, OPENGL);
  noStroke();
  
  in = new AudioIn(this, 0);
  in.start();
  rms = new Amplitude(this);
  rms.input(in);

  spout = new Spout(this);
  spout.createSender("VOL_LEVEL_SHAPES_SPOUT");
  
  frameRate(60);
  background(0);

}

void draw()
{

    float diameter = map(rms.analyze(), 0.0, 1.0, 0.0,width);    
    int d = int(diameter * 3);


      tint(d); //<>//
      fill(0);

      if (i == 60) {
        random_w = int(random(width));
        random_h = int(random(height));
        shape = int(random(3));
        background(0);
        i = 0;
      };
      i++;   

          rotate(radians(random(360)));
          strokeWeight(3);
          //line(0, random_h, 640, random_h);
          //line(random_w, 0, random_w, 480);

          noFill();
          
          
          if (shape == 0) {
            stroke(d/3, d/3, 255);
            circle(random_w, random_h, d); 
        }
          
          if (shape == 1) {
            stroke(255, d/3, 255);          
            rect(random_w - d / 2, random_h - d / 2, d, d);
          }
          
          if (shape == 2) {
            stroke(255, 255, d/3);  
            triangle(random_w, random_h - d, random_w - d, random_h + d / 1.5, random_w + d, random_h + d / 1.5);
          }
    spout.sendTexture();
}
