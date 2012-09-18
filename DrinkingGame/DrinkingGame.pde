PFont f;
PFont g;
String [] people = {"Ackerman", "Olivia", "CC", "Kiera", "Ryan", "Dreamy", "Fitzy", "Chelsea", "Ted", "Charles", "Briney"};
int peopleIndex = int(random(people.length));
int start = 0;
String randomPerson = "";
import ddf.minim.*;


AudioPlayer player;
Minim minim;

void setup() {
  size(1024, 768);
  f = createFont("Arial",80,true);
  g = createFont("Arial",66,true);
  textAlign(CENTER, CENTER);
  PImage img;
  img = loadImage("start.jpg");
  background(img);
  smooth();
  frameRate(1);
  PImage btn;
  btn = loadImage("startbtn.png");
  image(btn,362,440);
  mouseClicked();
}

void mouseClicked() {
  if(mouseX >362 && mouseX<662 && mouseY>440 && mouseY<500) {
    loop();
  } else { noLoop(); }
} 

void draw() {
  int s = second();
  if(s == 0 || s == 15 || s == 30 || s == 45){
    PImage img;
    img = loadImage("bg.jpg");
    background(img);
    fill(255, 255, 255);
    randomPerson = people[round(random(people.length-1))];
    textFont(f);
    text(randomPerson + " DRINK " + (round(random(4))+1) + "!", width/2, 409);
    minim = new Minim(this);
    player = minim.loadFile("ping.mp3");
    player.play();
  }
  int r = second();
  int t = round(random(60));
  if(r == t) {
    PImage img;
    img = loadImage("bg.jpg");
    background(img);
    randomPerson = people[round(random(people.length-1))];
    textFont(f);
    text("BONUS DRINK!", width/2, 405);
    textFont(f, 26);
    text(randomPerson + " TAKE A SHOT", width/2, 660);
    minim = new Minim(this);
    player = minim.loadFile("shot.wav");
    player.play();
  }
}


