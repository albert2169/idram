import 'package:flutter/material.dart';
import 'dart:math';

class SlantedRectangle extends StatelessWidget {
  final String imagePath;

  const SlantedRectangle({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SlantedRectangleClipper(),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        width: 100,
        height: 200,
        child: Image.asset(imagePath, fit: BoxFit.fitHeight),
      ),
    );
  }
}

class SlantedRectangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    double topAngle = 5 * pi / 180;
    double bottomAngle = 10 * pi / 180;

    double topOffset = tan(topAngle) * size.width;
    double bottomOffset = tan(bottomAngle) * size.width;

    path.moveTo(0, topOffset);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - bottomOffset);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
