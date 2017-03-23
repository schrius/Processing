
boolean game = false;
int count = 0;
int attempt = 0;
int match;
int px1, py1, px2, py2;
cards back[][];
int Board[][] = new int[34][19];
PImage cardback;
color cl[] = new color[12];
int startTime;
int curtime;
int time;

void setup() {  
    size(720, 425);    
    ellipseMode(CORNER);
    textFont(createFont("Courier", 20));
    textAlign(CENTER, CENTER);
    cardback = loadImage("timg.jpg");
    for(int x = 0; x < 34 ; x++)
        for(int y = 0; y < 19; y++){
        if(random(100) < 40) Board[x][y] = (int)random(8);
        }
      cl[0] = #22F209;
      cl[1] = #06A7FC;
      cl[2] = #BD06FC;
      cl[3] = #FC5106;
      cl[4] = #D0FC06;
      cl[5] = #FC061C;
      cl[6] = #FC06C4;
      cl[7] = #06FCE6;
      cl[8] = #060DFC;
      cl[9] = #C3EEC8;
      cl[10] = #C3DD6A;
      cl[11] = #862471;
} 

void draw(){
  if(count == 3){
    delay(500);
    count = 0;
        }
    background(0);
    noStroke();
    if(!game){
    for(int x = 0; x < 34 ; x++)
        for(int y = 0; y < 19; y++){
        if(Board[x][y] == 0) fill(10, 200, 100);
        else if (Board[x][y] == 1) fill(50, 150, 255);
        else if (Board[x][y] == 2) fill(0, 0, 255);
        else if (Board[x][y] == 3) fill(250, 150, 5);
        else if (Board[x][y] == 4) fill(250, 205, 5);
        else if (Board[x][y] == 5) fill(100, 255, 0);
        else if (Board[x][y] == 6) fill(150, 0, 150);
        else fill(255, 0, 5);
        rect(x*20+20, y*20+20, 20, 20);
        }
        
      fill(0, 200);
      rect(0, 0 , width, height);
      textFont(createFont("Courier", 40));
      fill(255);
      text("Find Match", width/2, 100);
      textFont(createFont("Courier", 13));
      text("Click on the cards and find two match", width/2, height/2);
      text("Press Enter to Start", width/2, 240);
     noLoop();
    }
    else {
            
             display();
             curtime = hour()*3600 + minute()*60 + second();
             time = curtime - startTime;
              text("Attemp: "+ attempt, 50, 20);
              text("Time:  " + time/60 + ":" + time%60, 200, 20);
    }
}

void mousePressed(){
  if(game){
    if(mouseX>25 && mouseY > 55 && mouseX <685 && mouseY < 400){
        if(count==0){
              px1 = (mouseX-25)/85;
              py1 = (mouseY-55)/120;
              count++;
              attempt++;
        }
         else if(count==1){
           if((mouseX-25)/85 != px1 || (mouseY-55)/120 !=py1 ){
              px2 = (mouseX-25)/85;
              py2 = (mouseY-55)/120;
              if(px2>8)px2 =8;
              if(py2>3)py2 =3;
              count++;
              attempt++;
           }
        }
    }
  }
}

void keyPressed(){
    if(keyCode == ENTER){
    if(!game){
    game = true;
    int x, y;
     back = new cards[8][3];
     for(x =0; x < 8 ; x++)
     for(y = 0; y< 3 ; y++)
     back[x][y] = new cards(x);
     
     for(int k = 0 ; k < 12 ; k++){
         cards card = new cards(k);
           x = (int)random(8);
           y = (int)random(3);
      while(back[x][y].getPos()){
           x = (int)random(8);
           y = (int)random(3);
      }
      back[x][y] = card;
      back[x][y].setPos(true);
           while(back[x][y].getPos()){
           x = (int)random(8);
           y = (int)random(3);
      }
      back[x][y] = card;
      back[x][y].setPos(true);
      }
     attempt = 0;
     match = 0;
     time = 0;
     startTime = hour()*3600 + minute()*60 + second();
     
    loop();
    }
  }
}

void GameOver(){
  noLoop();
      fill(0, 200);
      rect(0, 0 , width, height);
      textFont(createFont("Courier", 40));
      fill(255);
      text("You Win!", width/2, 40);
      textFont(createFont("Courier", 20));
      text("Total Attemp: "+ attempt, width/2, 100);
      text("Total Time:  " + time/60 + ":" + time%60, width/2, 180);
      textFont(createFont("Courier", 13));
      text("Press Enter to Start Again.", width/2, 240);
      game = false;
}

void drawshape(int s, int dx, int dy){
    switch(s){
              case 0: {
                fill(back[dx][dy].getColor());
                rect(dx*85+25, dy*120+55, cardback.width/8,cardback.height/8);
              break;
              }
               case 1: {
                 fill(back[dx][dy].getColor());
                 ellipse(dx*85+25, dy*120+55, cardback.width/8,cardback.height/8);
              break;
              }
               case 2: {
                 fill(back[dx][dy].getColor());
                 triangle(dx*85+25+cardback.width/16, dy*120+75, dx*85+25, dy*120+55+cardback.height/8, dx*85+25+cardback.width/8, dy*120+55+cardback.height/8);
              break;
              }
               case 3: {
                 fill(back[dx][dy].getColor());
                 quad(dx*85+25, dy*120+55+cardback.height/16,dx*85+25+cardback.width/16, dy*120+55, dx*85+25+cardback.width/8, dy*120+55+cardback.height/16, dx*85+25+cardback.width/16, dy*120+55+cardback.height/8);
              break;
              }
               case 4: {
                 fill(back[dx][dy].getColor());
                 quad(dx*85+25, dy*120+55, dx*85+25+cardback.width/8, dy*120+55+cardback.height/8, dx*85+25+cardback.width/8, dy*120+55+cardback.height/16, dx*85+25+cardback.width/16, dy*120+55+cardback.height/8);
              break;
              }
                case 5: {
                 fill(back[dx][dy].getColor());
                 triangle(dx*85+25, dy*120+55, dx*85+25+cardback.width/8, dy*120+55, dx*85+25+cardback.width/16, dy*120+55+cardback.height/8);
              break;
              }
              default:
               image(cardback, px1*85+25, py1*120+55, cardback.width/8,cardback.height/8);
              }
    }


void display(){                     
       for(int i = 0; i < 8; i++)
         for(int j = 0; j < 3; j++)
             if(!back[i][j].getFound()){
              if(count==1 && px1 == i && py1 == j)
              drawshape(back[px1][py1].getShape(), px1, py1);
              
            else if(count == 2 && px2 == i && py2 == j){
              drawshape(back[px2][py2].getShape(), px2, py2);
  
              if(back[px1][py1].getId() == back[px2][py2].getId()){
                back[px1][py1].setFound(true);
                match++;
                }
                }
               else {
                 if(count == 2 && px1 == i && py1 == j)
                 drawshape(back[i][j].getShape(), i, j);
                else image(cardback, i*85+25, j*120+55, cardback.width/8,cardback.height/8);
                 }
             }
            else drawshape(back[i][j].getShape(), i, j);
              
          if(count == 2) {
          count++;
        } 
      if(match==12)GameOver();

}


class cards{
  boolean found;
  boolean Pos;
  int id;
  int shape;
  color col;
 
  cards(int d){
    id = d;
    found = false;
    Pos = false;
    col = cl[d];
    shape = (int)random(6);
  }
  
  boolean getFound(){
    return found;
  }
  
   void setFound(boolean f){
    found = f;
  }
  
   boolean getPos(){
    return Pos;
  }
  
   void setPos(boolean p){
    Pos = p;
  }

   int getId(){
    return id;
  }
  
   void setId(int i){
    id = i;
  }
  
     int getShape(){
    return shape;
  }
  
  color getColor(){
  return col;
  }

}