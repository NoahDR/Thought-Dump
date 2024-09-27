import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform;

class SettingsManager {
  static const String _pathKey = 'selected_path';

  static Future<void> savePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_pathKey, path);
  }

  static Future<String> loadPath() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_pathKey) ?? '';
  }
}

void showSettingsDialog(BuildContext context) async {
  String selectedPath = await SettingsManager.loadPath();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      final size = MediaQuery.of(context).size;

      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            backgroundColor: const Color.fromARGB(255, 30, 30, 30),
            child: Container(
              width: size.width * 0.9,
              height: size.height * 0.5,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Settings',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          leading:
                              const Icon(Icons.folder, color: Colors.white),
                          title: const Text('Path',
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text(
                            selectedPath.isEmpty
                                ? 'No path selected'
                                : selectedPath,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          onTap: () async {
                            String path = await _pickDirectory(context);
                            setState(() {
                              selectedPath = path;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text('Cancel',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Save',
                            style: TextStyle(color: Colors.white)),
                        onPressed: () async {
                          await SettingsManager.savePath(selectedPath);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Future<String> _pickDirectory(BuildContext context) async {
  if (Platform.isIOS) {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  } else if (Platform.isAndroid) {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    return selectedDirectory ?? '';
  }
  return '';
}
