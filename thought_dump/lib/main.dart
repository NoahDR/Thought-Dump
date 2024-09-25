import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thought_dump/providers/recording_provider.dart';
import 'package:thought_dump/screens/recording_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecordingProvider()),
      ],
      child: const ThoughtDumpApp(),
    ),
  );
}

class ThoughtDumpApp extends StatelessWidget {
  const ThoughtDumpApp({super.key});

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
