import 'package:flutter/material.dart';
import '../utils/recording_logic.dart';

class RecordingProvider with ChangeNotifier {
  final RecordingLogic _recordingLogic = RecordingLogic();
  bool _isRecording = false;

  bool get isRecording => _isRecording;

  Future<void> toggleRecording() async {
    if (_isRecording) {
      await _recordingLogic.stopListening();
    } else {
      await _recordingLogic.startListening((result) {});
    }
    _isRecording = !_isRecording;
    notifyListeners();
  }

  Future<void> initialize() async {
    await _recordingLogic.initialize();
  }
}
