import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  noSuchMethod(Invocation i) => super.noSuchMethod(i);
  @override
  Path getClip(Size size) {
    // depugPrint(size.path);
    var path = Path();
    path.lineTo(0, size.height); //start path with this if you are making
    //(note : the height is from the container in the ClipPath that have waveClipper as clipper:)
    var firstStart = Offset(size.width / 5, size.height);
    //first point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant WaveClipper oldClipper) {
    // Implement logic to determine if the clipper should reclip.
    // This should return true if the old clipper differs from the current clipper in a way that affects the clipped path.
    // For instance, you might compare properties of the two clippers.
    return false; // Update with actual reclip conditions.
  }
}
