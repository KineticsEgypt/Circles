import 'package:circles/app_style/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CinemaScreenArc extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black45;
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    Path path  = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width/2, -size.height/2, size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}