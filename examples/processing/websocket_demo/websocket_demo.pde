import websockets.*;

WebsocketClient wsc;
int now;
boolean newEllipse;

class Point {
  private int x;
  private int y;
  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
  void drawCircle() {
    circle(this.x, this.y, 20);
  }
}

ArrayList<Point> points = new ArrayList<Point>();


void setup(){
  size(200,200);
  
  newEllipse=true;
  
  wsc= new WebsocketClient(this, "ws://localhost:3000");
  now=millis();
}

void draw(){
  for (Point point : points) {
    point.drawCircle();
  }
}


void mouseClicked() {
  wsc.sendMessage(mouseX+","+mouseY);
}

void webSocketEvent(String msg){
  String[] point = split(msg, ',');
  points.add(new Point(int(point[0]), int(point[1])));
  println(msg);
  newEllipse=true;
}