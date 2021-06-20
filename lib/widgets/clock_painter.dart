import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    ///minutes Calculation
    double minutesX =
        centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minutesY =
        centerX + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);

    ///minutes Line
    Paint minutesPainter = Paint()
      ..color = Theme.of(context).accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawLine(center, Offset(minutesX, minutesY), minutesPainter);

    ///hour Calculation
    double hourX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerX +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    ///hour Line
    Paint hourPainter = Paint()
      ..color = Theme.of(context).colorScheme.secondary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    canvas.drawLine(center, Offset(hourX, hourY), hourPainter);

    ///second Calculation
    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerX + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    ///Second Line
    Paint secondPainter = Paint()..color = Theme.of(context).primaryColor;

    canvas.drawLine(center, Offset(secondX, secondY), secondPainter);

    ///Center Dots
    Paint dotPainter = Paint()
      ..color = Theme.of(context).primaryIconTheme.color;
    Paint sDotPainter = Paint()..color = Theme.of(context).backgroundColor;
    canvas.drawCircle(center, 24, dotPainter);
    canvas.drawCircle(center, 23, sDotPainter);
    canvas.drawCircle(center, 10, dotPainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
