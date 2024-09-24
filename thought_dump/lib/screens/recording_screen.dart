import 'package:flutter/material.dart';
import '../widgets/animated_mic_button.dart';

class RecordingAnimationScreen extends StatefulWidget {
  const RecordingAnimationScreen({Key? key}) : super(key: key);

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
      backgroundColor: const Color.fromARGB(255, 236, 232, 232),
      body: Stack(
        alignment: Alignment
            .bottomCenter, // Stack positioniert den Button am unteren Rand
        children: [
          Center(
            child: _buildMainContent(),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height *
                    0.15), // Button im unteren Drittel
            child: AnimatedMicButton(
              isRecording: _isRecording,
              onPressed: _toggleRecording,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return const Text(
      ' ',
      style: TextStyle(color: Colors.white, fontSize: 24),
    );
  }
}
