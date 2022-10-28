import 'package:flutter/material.dart';

class CircleClipper extends CustomClipper<Rect> {

  @override
  Rect getClip(Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double minDimension = size.width < size.height ? size.width : size.height;
    return Rect.fromCircle(center: center, radius: minDimension / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
  
}