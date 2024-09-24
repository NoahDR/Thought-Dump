import 'package:flutter/material.dart';
import 'screens/recording_screen.dart';

void main() => runApp(const ThoughtDump());

class ThoughtDump extends StatelessWidget {
  const ThoughtDump({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thought Dump',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const RecordingAnimationScreen(),
    );
  }
}
