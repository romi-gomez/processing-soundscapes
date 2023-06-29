/**
 * This sketch shows how to use the Waveform class to analyze a stream
 * of sound. Change the number of samples to extract and draw a longer/shorter
 * part of the waveform.
 */

import processing.sound.*;

// Declare the sound source and Waveform analyzer variables
SoundFile sample;
Waveform waveform;

// Define how many samples of the Waveform you want to be able to read at once
int samples = 300;

public void setup() {
  fullScreen(P2D);
  background(255);
  samples = width;

  // Load and play a soundfile and loop it.
  sample = new SoundFile(this, "test.mp3");
  sample.loop();

  // Create the Waveform analyzer and connect the playing soundfile to it.
  waveform = new Waveform(this, samples);
  waveform.input(sample);
}

public void draw() {
  // Set background color, noFill and stroke style
  noStroke();
  fill(0,0,0,20);
  rect(0,0,width, height);
  strokeWeight(2);
  noFill();

  // Perform the analysis
  waveform.analyze();
  
  //beginShape();
  //for(int i = 0; i < samples; i++){
  //  // Draw current data of the waveform
  //  // Each sample in the data array is between -1 and +1 
  //  println(waveform.data[i]);
  //  vertex(
  //    map(i, 0, samples, 0, width),
  //    map(waveform.data[i], -1, 1, 0, height)
  //  );
  //}
  //endShape();
    
    stroke(random(100),random(200),255, random(100));
    for(int i = 0; i < samples; i++){
    int pointYtop = int(map(waveform.data[i], -1, 1, 0, height));
    float pointYbottom = height;
    line(i, pointYtop/2,i,pointYbottom);
  }
  
   stroke(255,255,255, random(100));
   for(int i = 0; i < samples; i++){
    int pointYtop = int(map(waveform.data[i], -1, 1, 0, height));
    float pointYbottom = height;
    line(i, pointYtop,i,pointYbottom);

  }
}
