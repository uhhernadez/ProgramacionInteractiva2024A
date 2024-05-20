class MessageReceived {
  String _msg;
  color _color;
  PVector _pos;
  int _start_time;
  int _font_size;
  
  MessageReceived(String msg, color c, PVector pos) {
    _msg = msg;
    _color = c;
    _pos = pos;
    _start_time = millis();
    _font_size = 64;
  }

  boolean Remove() {
    return _pos.y- textAscent() > height;
  }
  
  void Draw(){
    pushMatrix();
    textSize(64);
    translate(_pos.x,_pos.y);
    fill(_color);
    text(_msg,0,0);
    popMatrix();
    _pos.y+=1.0;
  }
}
