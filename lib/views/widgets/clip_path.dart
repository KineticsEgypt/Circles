import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  final double radius;

  CustomClipPath(this.radius);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        radius, size.height - radius,
        size.width/2, size.height-radius);
    path.quadraticBezierTo(
        size.width/2, size.height-radius,
        size.width - radius, size.height);
    path.lineTo(size.width, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}