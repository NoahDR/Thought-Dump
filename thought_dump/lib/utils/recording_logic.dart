import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:io';
import '../utils/path_manager.dart';
import 'package:intl/intl.dart';

class RecordingLogic {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = '';

  Future<bool> initialize() async {
    return await _speech.initialize();
  }

  Future<void> toggleListening(Function(String) onResult) async {
    if (_isListening) {
      await stopListening();
    } else {
      await startListening(onResult);
    }
  }

  Future<void> startListening(Function(String) onResult) async {
    if (await _speech.initialize()) {
      _isListening = true;
      await _speech.listen(
        onResult: (result) {
          _text = result.recognizedWords;
          onResult(_text);
        },
      );
    }
  }

  Future<void> stopListening() async {
    _isListening = false;
    await _speech.stop();
    await _saveToFile();
  }

  Future<void> _saveToFile() async {
    if (_text.isNotEmpty) {
      final path = await PathManager.getPath();
      if (path.isNotEmpty) {
        final dir = Directory(path);
        final dateFormat = DateFormat('MM:dd:yyyy HH:mm');
        final fileName = '${dateFormat.format(DateTime.now())} Thought.md';
        final file = File('${dir.path}/$fileName');
        await file.writeAsString(_text);
        _text = '';
      }
    }
  }

  bool get isListening => _isListening;
}
