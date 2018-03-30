import processing.sound.*;

SinOsc[] sineWaves;      // Array of sines
float[]  sineFreq;       // Array of frequencies
int      numSines = 5;   // Number of oscillations

void setup() {
  size(640, 480);
  background(255);
  
  sineWaves = new SinOsc[numSines];
  sineFreq  = new float[numSines];
  
  for (int i = 0; i < numSines; i++) {
    // Calculate amplitude
    float sineVolume = (1.0 / numSines) / (i + 1);
    
    // Create oscillators
    sineWaves[i] = new SinOsc(this);
    
    // Start Oscillators
    sineWaves[i].play();
    
    // Set volume
    sineWaves[i].amp(sineVolume);
  }
}

void draw() {
  // Map mouse Y to control frequency 
  float yOffset = map(mouseY, 0, height, 0, 1);
  float frequency = pow(1000, yOffset) + 150;
  
  // Map mouse X to control detune
  float detune = map(mouseX, 0, width, -0.5, 0.5);
  
  for (int i = 0; i < numSines; i++) {
    sineFreq[i] = frequency * (i + 1 * detune);
    sineWaves[i].freq(sineFreq[i]);
  }
}