import 'package:flutter/material.dart';
import 'screens/recording_screen.dart';

void main() => runApp(const ThoughtDump());

class ThoughtDump extends StatelessWidget {
  const ThoughtDump({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thought Dump',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const RecordingAnimationScreen(),
    );
  }
}
