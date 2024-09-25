import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double size;

  const SettingsButton({
    super.key,
    required this.onPressed,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
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
            Icons.settings,
            color: Colors.black,
            size: size * 0.5,
          ),
        ),
      ),
    );
  }
}
