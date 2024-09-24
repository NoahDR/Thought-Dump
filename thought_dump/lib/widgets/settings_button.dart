import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SettingsButton({
    super.key,
    required this.onPressed,
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
        child: const SizedBox(
          width: 50.0,
          height: 50.0,
          child: Icon(
            Icons.settings,
            color: Colors.black,
            size: 50.0 * 0.5,
          ),
        ),
      ),
    );
  }
}
