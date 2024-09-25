import 'package:flutter/material.dart';

class RecordingProvider with ChangeNotifier {
  bool _isRecording = false;

  bool get isRecording => _isRecording;

  void toggleRecording() {
    _isRecording = !_isRecording;
    notifyListeners();
  }
}
