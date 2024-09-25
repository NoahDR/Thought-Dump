import 'package:flutter/material.dart';

class MicAnimationController {
  late final AnimationController rotationController;
  late final AnimationController pulseController;
  late final Animation<double> pulseAnimation;

  static const _rotationDuration = Duration(seconds: 5);
  static const _pulseDuration = Duration(milliseconds: 1200);

  MicAnimationController(TickerProvider vsync) {
    rotationController = AnimationController(
      vsync: vsync,
      duration: _rotationDuration,
    )..repeat();

    pulseController = AnimationController(
      vsync: vsync,
      duration: _pulseDuration,
    )..repeat(reverse: true);

    pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: pulseController, curve: Curves.easeInOut),
    );
  }

  void dispose() {
    rotationController.dispose();
    pulseController.dispose();
  }
}
