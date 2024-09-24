import 'package:flutter/material.dart';

class Blob extends StatelessWidget {
  final double scale;

  const Blob({super.key, required this.scale});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Container(
        width: 120,
        height: 120,
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
