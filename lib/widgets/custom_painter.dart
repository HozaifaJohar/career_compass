import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomCardPainter extends CustomPainter {
  final double raduis;
  final Color start;
  final Color end;
  CustomCardPainter(this.raduis, this.start, this.end);
  @override
  void paint(Canvas canvas, Size size) {
    var raduis = 24.0;
    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        const Offset(0, 0),
        Offset(size.width, size.height),
        [HSLColor.fromColor(start).withLightness(0.8).toColor(), end]);
    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - raduis, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - raduis)
      ..lineTo(size.width, raduis)
      ..quadraticBezierTo(size.width, 0, size.width - raduis, 0)
      ..lineTo(size.width - 1.5 * raduis, 0)
      ..quadraticBezierTo(-raduis, 2 * raduis, 0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint( CustomPainter oldDelegate) {
    return true;
  }
}