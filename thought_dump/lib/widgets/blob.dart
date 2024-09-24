import 'package:flutter/material.dart';

class Blob extends StatelessWidget {
  final double scale;

  const Blob({Key? key, required this.scale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Container(
        width: 90,
        height: 90,
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
