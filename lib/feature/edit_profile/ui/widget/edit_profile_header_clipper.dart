import 'package:flutter/material.dart';

class EditHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final curveDepth = size.height * 0.22; 
    Path path = Path();
    path.lineTo(0, size.height - curveDepth);
    path.quadraticBezierTo(
      size.width / 2,
      size.height + curveDepth,
      size.width,
      size.height - curveDepth,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}