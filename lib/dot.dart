import 'package:flutter/material.dart';

class DotsContainer extends StatelessWidget {
  final int dotsNum;
  final colorOne;
  final colorTwo;
  const DotsContainer(this.dotsNum, this.colorOne, this.colorTwo);

  @override
  Widget build(BuildContext context) {
    List<Widget> dots = [];
    for (var i = 0; i < dotsNum; i++) {
      dots.add(Dot(3.0, i < dotsNum-1 ? colorOne : colorTwo));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: dots.map((e) => e).toList(),
    );
  }
}

class Dot extends StatelessWidget {
  final radius;
  final color;
  const Dot(this.radius, this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(radius),
          child: Container(
        height: radius * 2,
        width: radius * 2,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
           ),
      ),
    );
  }
}
