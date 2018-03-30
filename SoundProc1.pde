import processing.sound.*;

SinOsc[] sineWaves;     // Array of sine waves.
float[]  sineFreq;      // Array of frequencies. //<>//
int      numSines = 5;  // Number of oscillators to use.

void setup() {
  size (640, 360); //<>//
  background(250);

  sineWaves = new SinOsc[numSines];    // Init the oscillators. //<>//
  sineFreq  = new float[numSines];     // Init the frequency array.
/*
  SinOsc test; //<>//
  test = new SinOsc(this);
  test.play();
*/
  for (int i = 0; i < numSines; i++) {
    // Calculate the amplitude
    float sineVolume = (1.0 / numSines) / (i + 1);
    
    // Create the oscillators
    sineWaves[i] = new SinOsc(this);
    
    // Start oscillators
    sineWaves[i].play();
    
    // Set the amplitude for all oscillators
    sineWaves[i].amp(sineVolume);
  }
}


void draw() {
  // Map mouse Y from 0 to 1
  float yOffset = map(mouseY, 0, height, 0, 1); //<>//
  // Map mouse Y logarithmically to 160 - 115- to create base frequency
  float frequency = pow(1000, yOffset) + 150;
  // Use mous X mapped from -0.5 to +0.5 as detune argument
  float deTune = map(mouseX, 0, width, -0.5, 0.5); //<>//
  
  for (int i = 0; i < numSines; i++) {
    sineFreq[i] = frequency * (i + 1 * deTune); //<>//
    sineWaves[i].freq(sineFreq[i]);
  }
}