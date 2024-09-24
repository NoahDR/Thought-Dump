import 'package:flutter/material.dart';
import '../widgets/animated_mic_button.dart';
import '../widgets/settings_button.dart';

class RecordingAnimationScreen extends StatefulWidget {
  const RecordingAnimationScreen({super.key});

  @override
  State<RecordingAnimationScreen> createState() =>
      _RecordingAnimationScreenState();
}

class _RecordingAnimationScreenState extends State<RecordingAnimationScreen> {
  bool _isRecording = false;

  void _toggleRecording() => setState(() => _isRecording = !_isRecording);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: _buildMainContent(),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.15),
            child: AnimatedMicButton(
              isRecording: _isRecording,
              onPressed: _toggleRecording,
            ),
          ),
          Positioned(
              top: 60,
              left: 30,
              child: SettingsButton(
                onPressed: () {},
              )),
        ],
      ),
    );
  }
}

Widget _buildMainContent() {
  return const Text(
    ' ',
    style: TextStyle(color: Colors.white, fontSize: 24),
  );
}
