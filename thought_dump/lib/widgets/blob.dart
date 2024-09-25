import 'package:flutter/material.dart';

class Blob extends StatelessWidget {
  final double scale;
  final double width;
  final double height;

  const Blob({
    super.key,
    required this.scale,
    this.width = 120,
    this.height = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.5),
            width: 2,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(150),
            topRight: Radius.circular(240),
            bottomLeft: Radius.circular(220),
            bottomRight: Radius.circular(180),
          ),
        ),
      ),
    );
  }
}
