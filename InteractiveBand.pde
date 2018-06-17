import processing.sound.*; //using sound library
SoundFile guitar1, guitar2, bass, drum, vocal, scrowd; //import sound files

PImage bassB, bassR, crowdB, crowdR, drumB, drumR, guitar1B, guitar1R, guitar2B, guitar2R, vocalB, vocalR, character; //import images 
Boolean bassPlaying=false, crowdPlaying=false, drumPlaying=false, guitar1Playing=false, guitar2Playing=false, vocalPlaying=false; //to aviod multiple-playing

void setup() {
  size(1000, 600);
  background(190, 190, 0);
  character=loadImage("character.png");
  bassB=loadImage("bassB.png");
  bassR=loadImage("bassR.png");  
  crowdB=loadImage("crowdB.png");
  crowdR=loadImage("crowdR.png");
  drumB=loadImage("drumB.png");  
  drumR=loadImage("drumR.png");
  guitar1B=loadImage("guitar1B.png");  
  guitar1R=loadImage("guitar1R.png");
  guitar2B=loadImage("guitar2B.png");  
  guitar2R=loadImage("guitar2R.png");
  vocalB=loadImage("vocalB.png");  
  vocalR=loadImage("vocalR.png");
  vocal=new SoundFile(this, "vocal.mp3");
  guitar1=new SoundFile(this, "guitar1.mp3");
  guitar2=new SoundFile(this, "guitar2.mp3");
  bass=new SoundFile(this, "bass.mp3");
  drum=new SoundFile(this, "drum.mp3");
  scrowd=new SoundFile(this, "crowd.mp3");
}

void draw() {
  image(character, 0, 0, width, height);
  image(crowdB, 0, 0, width, height);
  image(bassB, 0, 0, width, height);
  image(drumB, 0, 0, width, height);  
  image(guitar1B, 0, 0, width, height);  
  image(guitar2B, 0, 0, width, height);  
  image(vocalB, 0, 0, width, height);
  if (90<mouseX&&mouseX<200&&100<mouseY&&mouseY<500) {      
    image(guitar1R, 0, 0, width, height);
  } else if (200<mouseX&&mouseX<400&&100<mouseY&&mouseY<500) {
    image(guitar2R, 0, 0, width, height);
  } else if (400<mouseX&&mouseX<630&&100<mouseY&&mouseY<500) {
    image(drumR, 0, 0, width, height);
  } else if (630<mouseX&&mouseX<750&&100<mouseY&&mouseY<500) {
    image(vocalR, 0, 0, width, height);
  } else if (750<mouseX&&mouseX<900&&100<mouseY&&mouseY<500) {
    image(bassR, 0, 0, width, height);
  } else if (0<mouseX&&mouseX<1000&&500<mouseY&&mouseY<600) {
    image(crowdR, 0, 0, width, height);
  }
  if (keyPressed) {
    if (key=='q' || key=='Q') {
      guitar1.stop();
      guitar2.stop();
      vocal.stop();
      drum.stop();
      bass.stop();
      scrowd.stop();
      guitar1Playing=false;
      guitar2Playing=false;
      vocalPlaying=false;
      drumPlaying=false;
      bassPlaying=false;
      crowdPlaying=false;
    }
  }
}

void mousePressed() {
  if (90<mouseX&&mouseX<200&&100<mouseY&&mouseY<500&&!guitar1Playing) {
    guitar1.loop(1.14);
    guitar1Playing=true;
  } else if (200<mouseX&&mouseX<400&&100<mouseY&&mouseY<500&&!guitar2Playing) {
    guitar2.loop(1.14);
    guitar2Playing=true;
  } else if (400<mouseX&&mouseX<630&&100<mouseY&&mouseY<500&&!drumPlaying) {
    drum.loop(1.13);
    drumPlaying=true;
  } else if (630<mouseX&&mouseX<750&&100<mouseY&&mouseY<500&&!vocalPlaying) {
    vocal.loop();
    vocalPlaying=true;
  } else if (750<mouseX&&mouseX<900&&100<mouseY&&mouseY<500&&!bassPlaying) {
    bass.loop(1.13);
    bass.amp(3);
    bassPlaying=true;
  } else if (0<mouseX&&mouseX<1000&&500<mouseY&&mouseY<600&&!crowdPlaying) {
    scrowd.loop();
    scrowd.amp(0.5);
    crowdPlaying=true;
  }
}