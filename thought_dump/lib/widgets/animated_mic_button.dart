import 'dart:math';
import 'package:flutter/material.dart';
import '../controllers/mic_animation_controller.dart';
import 'blob.dart';

class AnimatedMicButton extends StatelessWidget {
  final bool isRecording;
  final VoidCallback onPressed;
  final double size;
  final MicAnimationController animationController;

  const AnimatedMicButton({
    super.key,
    required this.isRecording,
    required this.onPressed,
    required this.size,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        animationController.rotationController,
        animationController.pulseController,
      ]),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            if (isRecording) ...[
              _buildBlob(0),
              _buildBlob(2 * pi / 3),
              _buildBlob(4 * pi / 3),
            ],
            _buildButton(),
          ],
        );
      },
    );
  }

  Widget _buildBlob(double angleOffset) {
    return Transform.rotate(
      angle:
          animationController.rotationController.value * 2 * pi + angleOffset,
      child: Blob(
        scale: isRecording ? animationController.pulseAnimation.value : 1.0,
      ),
    );
  }

  Widget _buildButton() {
    return Transform.scale(
      scale: isRecording ? animationController.pulseAnimation.value : 1.0,
      child: Material(
        elevation: 8.0,
        shape: const CircleBorder(),
        color: Colors.white,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(
              isRecording ? Icons.stop : Icons.mic,
              color: Colors.black,
              size: size * 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
