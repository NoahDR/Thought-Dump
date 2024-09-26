import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io' show Platform;

void showSettingsDialog(BuildContext context) {
  String? selectedPath;
  String selectedFilenameFormat = 'MM-dd-yyyy HH:mm';

  final List<String> filenameOptions = [
    'MM-dd-yyyy HH:mm',
    'MM-dd-yyyy',
    'dd-MM-yyyy HH:mm',
    'dd-MM-yyyy',
    'Default',
  ];

  String generateFilename(String format) {
    if (format == 'Default') return 'Thought Dump.md';
    DateTime now = DateTime.now();
    String dateTimeString = DateFormat(format).format(now);
    return '$dateTimeString Thought Dump.md';
  }

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
              height: size.height * 0.9,
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
                            selectedPath ?? 'No path selected',
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          onTap: () async {
                            String? path = await _pickDirectory(context);
                            if (path != null) {
                              setState(() {
                                selectedPath = path;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text('Filename Format:',
                            style: TextStyle(color: Colors.white)),
                        DropdownButton<String>(
                          value: selectedFilenameFormat,
                          dropdownColor: const Color.fromARGB(255, 50, 50, 50),
                          style: const TextStyle(color: Colors.white),
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                selectedFilenameFormat = newValue;
                              });
                            }
                          },
                          items: filenameOptions
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Preview: ${generateFilename(selectedFilenameFormat)}',
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontStyle: FontStyle.italic),
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
                        onPressed: () {
                          String filename =
                              generateFilename(selectedFilenameFormat);
                          print('Selected path: $selectedPath');
                          print('Generated filename: $filename');
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

Future<String?> _pickDirectory(BuildContext context) async {
  if (Platform.isIOS) {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  } else if (Platform.isAndroid) {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    return selectedDirectory;
  }
  return null;
}
