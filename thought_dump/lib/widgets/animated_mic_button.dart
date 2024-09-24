import 'dart:math';
import 'package:flutter/material.dart';
import 'blob.dart';

class AnimatedMicButton extends StatefulWidget {
  final bool isRecording;
  final VoidCallback onPressed;

  const AnimatedMicButton({
    Key? key,
    required this.isRecording,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<AnimatedMicButton> createState() => _AnimatedMicButtonState();
}

class _AnimatedMicButtonState extends State<AnimatedMicButton>
    with TickerProviderStateMixin {
  static const _kRotationDuration = Duration(seconds: 5);
  static const _kPulseDuration = Duration(milliseconds: 1200);

  late final AnimationController _rotationController;
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: _kRotationDuration,
    )..repeat();

    _pulseController = AnimationController(
      vsync: this,
      duration: _kPulseDuration,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_rotationController, _pulseController]),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            if (widget.isRecording) ...[
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
      angle: _rotationController.value * 2 * pi + angleOffset,
      child: Blob(scale: widget.isRecording ? _pulseAnimation.value : 1.0),
    );
  }

  Widget _buildButton() {
    return Transform.scale(
      scale: widget.isRecording ? _pulseAnimation.value : 1.0,
      child: Material(
        elevation: 8.0,
        shape: const CircleBorder(),
        color: Colors.white,
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: widget.onPressed,
          child: SizedBox(
            width: 100,
            height: 100,
            child: Icon(
              widget.isRecording ? Icons.stop : Icons.mic,
              color: Colors.black,
              size: 100 * 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
