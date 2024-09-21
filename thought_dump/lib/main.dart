import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // Hier ein leerer Scaffold für eine leere App
        body: Center(
          child: Text('Leere App'), // Oder ein komplett leerer Body
        ),
      ),
    );
  }
}
