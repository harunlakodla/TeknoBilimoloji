
import 'dart:math';
import 'package:flutter/material.dart';

class Balon extends StatefulWidget {
  @override
  _Balon createState() => _Balon();
}

class _Balon extends State<Balon> with SingleTickerProviderStateMixin {

    AnimationController _controller;
    List<Bubble> bubbles;
    final int numberOfBubbles =200;
    final Color color=Colors.amber;
    final double maxBubbleSize=10.0;

    @override
    void initState() {
    // TODO: implement initState
    super.initState();

    bubbles=List();
    int i=numberOfBubbles;
    while(i>0){
      bubbles.add(Bubble(color,maxBubbleSize));      
      i--;
    }
    _controller= new AnimationController(
        duration: const Duration(seconds: 1000),
        vsync: this
      );
      _controller.addListener((){
        updateBubblePosition();
       }
      );
    _controller.forward();
    }

     @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
   
    return Scaffold(
      body:CustomPaint(
        foregroundPainter: BubblePainter(
          bubbles: bubbles,controller: _controller
        ),
        size: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
      ),
    );
  }

  void updateBubblePosition(){
    bubbles.forEach((it)=>it.updatePosition());
    setState(() {
      
    });
  } 
}

class BubblePainter extends CustomPainter {
  
  List<Bubble> bubbles;

  AnimationController controller;

  BubblePainter({this.bubbles,this.controller});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    bubbles.forEach((it)=>it.draw(canvas, size));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class Bubble {

  Color _color;
  double direction;
  double speed;
  double radius;
  double x;
  double y;
  
  Bubble(Color color,double maxBubbleSize){
    this._color=color.withOpacity(Random().nextDouble());
    this.direction=Random().nextDouble()*360;
    this.speed=1;
    this.radius=Random().nextDouble()*maxBubbleSize;
  }

  draw(Canvas canvas,Size canvasSize){
    Paint paint=new Paint()
    ..color=_color
    ..strokeCap=StrokeCap.round
    ..style=PaintingStyle.fill;
    
    assignRandomPositionIfUninitialized(canvasSize);

    randomlyChangeDirectionIfEdgeReached(canvasSize);

    canvas.drawCircle(Offset(x, y), radius, paint);
  }

  void assignRandomPositionIfUninitialized(Size canvasSize) {
    if (x == null) {
      this.x = Random().nextDouble() * canvasSize.width;
    }

    if (y == null) {
      this.y = Random().nextDouble() * canvasSize.height;
    }
  }

  updatePosition(){
    var a =180-(direction+90);
    direction>0 && direction<180
    ? x+=speed*sin(direction)/sin(speed)
    : x-=speed*sin(direction)/sin(speed);
     direction > 90 && direction < 270
        ? y += speed * sin(a) / sin(speed)
        : y -= speed * sin(a) / sin(speed);
  }

  randomlyChangeDirectionIfEdgeReached(Size canvasSize) {
    if (x > canvasSize.width || x < 0 || y > canvasSize.height || y < 0) {
      direction = Random().nextDouble() * 360;
    }
  }
}