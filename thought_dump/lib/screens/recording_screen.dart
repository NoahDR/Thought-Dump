import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/mic_animation_controller.dart';
import '../providers/recording_provider.dart';
import '../widgets/animated_mic_button.dart';
import '../widgets/settings_button.dart';

class RecordingAnimationScreen extends StatefulWidget {
  const RecordingAnimationScreen({super.key});

  @override
  State<RecordingAnimationScreen> createState() =>
      _RecordingAnimationScreenState();
}

class _RecordingAnimationScreenState extends State<RecordingAnimationScreen>
    with TickerProviderStateMixin {
  late MicAnimationController _micAnimationController;

  @override
  void initState() {
    super.initState();
    _micAnimationController = MicAnimationController(this);
  }

  @override
  void dispose() {
    _micAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final width = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(child: _buildMainContent()),
          Padding(
            padding: EdgeInsets.only(bottom: height * 0.15),
            child: Consumer<RecordingProvider>(
              builder: (context, recordingProvider, _) {
                return AnimatedMicButton(
                  isRecording: recordingProvider.isRecording,
                  onPressed: recordingProvider.toggleRecording,
                  size: width * 0.25,
                  animationController: _micAnimationController,
                );
              },
            ),
          ),
          Positioned(
            top: height * 0.1,
            left: width * 0.08,
            child: SettingsButton(
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return const Text(
      'Recording...',
      style: TextStyle(color: Colors.white, fontSize: 24),
    );
  }
}
