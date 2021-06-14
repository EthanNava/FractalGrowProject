int timer = 0;
ArrayList<Cell> cells;

/*
PVector v1 = new PVector(0,0);
PVector v2 = new PVector(10,0);
*/

void setup(){
  size(1080,1080);
  background(255);
  //frameRate(24);
  cells = new ArrayList<Cell>();
  Cell centerCell = new Cell(width / 2.0, height / 2.0, 30, width / 2.0, height / 2.0); 
  cells.add(centerCell);
}

void draw(){
  background(255);
  
  if(timer > 2){
    newCell();
    timer = 0;
  }
  
  //newCell();
  renderCells();
  
  
  timer++;
}

/*
void newCell(){
  PVector rPos = new PVector(random(width),random(height));
  float cellDist = width+height;
  PVector closestCell = new PVector();
  float closestCellR = 0;
  float cellRadius = random(10,30);
  float theta = 0;

  for (int i = 0; i < cells.size(); i++) {
    Cell cellLecture = cells.get(i);
    PVector lastPos = new PVector(cellLecture.position.x, cellLecture.position.y);
    float newDist = lastPos.dist(rPos);
    if(newDist < cellDist){
      cellDist = newDist;
      closestCell.x = lastPos.x;
      closestCell.y = lastPos.y;
      closestCellR = cellLecture.radius;
      //theta = PVector.angleBetween(rPos,lastPos);
    }
  }
  
 stroke(0);
 line(closestCell.x,closestCell.y,rPos.x,rPos.y);
 
 cells.add(new Cell(rPos.x,rPos.y,cellRadius)); 
}*/

void newCell(){
  PVector rPos = new PVector(random(width),random(height));
  PVector newPos = new PVector();
  float cellDist = width + height;
  PVector closestCell = new PVector();
  float cellRadius = random(10,30);
  float closestCellR = 0;
  //float theta = 0;

  for (int i = 0; i < cells.size(); i++) {
    Cell cellLecture = cells.get(i);
    PVector lastPos = new PVector(cellLecture.position.x, cellLecture.position.y);
    float newDist = lastPos.dist(rPos);
    if(newDist < cellDist){
      cellDist = newDist;
      closestCell.x = lastPos.x;
      closestCell.y = lastPos.y;
      closestCellR = cellLecture.radius;
      //theta = PVector.angleBetween(rPos,lastPos);
    }
  }
  
  
 newPos = rPos.copy();
 newPos.sub(closestCell);
 
  float totalRadius = cellRadius + closestCellR;
  float distanceBetweenCells = totalRadius/cellDist;
 
 //cells.add(new Cell(rPos.x, rPos.y, cellRadius, closestCell.x, closestCell.y)); 
 //ESTE DE ABAJO ES EL BUENO
  //cells.add(new Cell(closestCell.x+newPos.x*0.2, closestCell.y+newPos.y*0.2, cellRadius, closestCell.x, closestCell.y)); 
  cells.add(new Cell(closestCell.x+newPos.x*distanceBetweenCells, closestCell.y+newPos.y*distanceBetweenCells, cellRadius, closestCell.x, closestCell.y)); 

}

void renderCells(){
  for (Cell actualCell : cells) {
    actualCell.render();
  }
}

void keyPressed(){
  //noLoop();
}
