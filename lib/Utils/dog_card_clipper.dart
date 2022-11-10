import 'package:flutter/material.dart';

class DogCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 230;
    final double _yScaling = size.height / 230;
    path.lineTo(255.986 * _xScaling, 210.701 * _yScaling);
    path.cubicTo(
      251.19600000000003 * _xScaling,
      230.49099999999999 * _yScaling,
      233.36599999999999 * _xScaling,
      245.191 * _yScaling,
      212.096 * _xScaling,
      245.191 * _yScaling,
    );
    path.cubicTo(
      212.096 * _xScaling,
      245.191 * _yScaling,
      73.576 * _xScaling,
      245.191 * _yScaling,
      73.576 * _xScaling,
      245.191 * _yScaling,
    );
    path.cubicTo(
      48.626000000000005 * _xScaling,
      245.191 * _yScaling,
      28.396 * _xScaling,
      224.961 * _yScaling,
      28.396 * _xScaling,
      200.011 * _yScaling,
    );
    path.cubicTo(
      28.396 * _xScaling,
      200.011 * _yScaling,
      28.396 * _xScaling,
      135.411 * _yScaling,
      28.396 * _xScaling,
      135.411 * _yScaling,
    );
    path.cubicTo(
      28.646 * _xScaling,
      135.341 * _yScaling,
      28.776 * _xScaling,
      135.311 * _yScaling,
      28.776 * _xScaling,
      135.311 * _yScaling,
    );
    path.cubicTo(
      28.646 * _xScaling,
      135.341 * _yScaling,
      30.996000000000002 * _xScaling,
      140.36100000000002 * _yScaling,
      31.136 * _xScaling,
      140.61100000000002 * _yScaling,
    );
    path.cubicTo(
      33.696 * _xScaling,
      145.23100000000002 * _yScaling,
      37.136 * _xScaling,
      149.35100000000003 * _yScaling,
      40.996 * _xScaling,
      152.95100000000002 * _yScaling,
    );
    path.cubicTo(
      64.49600000000001 * _xScaling,
      174.89100000000002 * _yScaling,
      98.306 * _xScaling,
      176.64100000000002 * _yScaling,
      128.62599999999998 * _xScaling,
      176.48100000000002 * _yScaling,
    );
    path.cubicTo(
      160.80599999999998 * _xScaling,
      176.31100000000004 * _yScaling,
      193.43599999999998 * _xScaling,
      177.10100000000003 * _yScaling,
      223.976 * _xScaling,
      188.42100000000002 * _yScaling,
    );
    path.cubicTo(
      229.93599999999998 * _xScaling,
      190.63100000000003 * _yScaling,
      235.75599999999997 * _xScaling,
      193.26100000000002 * _yScaling,
      241.26599999999996 * _xScaling,
      196.45100000000002 * _yScaling,
    );
    path.cubicTo(
      243.926 * _xScaling,
      197.991 * _yScaling,
      246.50599999999997 * _xScaling,
      199.67100000000002 * _yScaling,
      248.986 * _xScaling,
      201.491 * _yScaling,
    );
    path.cubicTo(
      250.166 * _xScaling,
      202.36100000000002 * _yScaling,
      255.50599999999997 * _xScaling,
      205.57100000000003 * _yScaling,
      255.64599999999996 * _xScaling,
      207.04100000000003 * _yScaling,
    );
    path.cubicTo(
      255.64599999999996 * _xScaling,
      207.04100000000003 * _yScaling,
      255.77599999999995 * _xScaling,
      208.39100000000002 * _yScaling,
      255.99599999999998 * _xScaling,
      210.70100000000002 * _yScaling,
    );
    path.cubicTo(
      255.99599999999998 * _xScaling,
      210.70100000000002 * _yScaling,
      255.986 * _xScaling,
      210.701 * _yScaling,
      255.986 * _xScaling,
      210.701 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
