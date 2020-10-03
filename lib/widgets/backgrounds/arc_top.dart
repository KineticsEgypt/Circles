import 'package:circles/app_style/colors.dart';
import 'package:flutter/material.dart';

class ArcTop extends CustomPainter {
  final Color color;
  final double radius;
  ArcTop({
    this.color = CirclesColors.grey,
    this.radius = 100
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Rect rect = Rect.fromLTRB(
        0, 0, size.width, size.height);
    //rect = Rect.fromLTRB(0, 0, 350, 500);
    rect = new Rect.fromCircle(
      center: new Offset(-size.width/4 ,size.height/6,),
      radius: radius,
    );
    paint.color = color;
    paint.style = PaintingStyle.fill;
    canvas.drawArc(rect,0,360, true, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}