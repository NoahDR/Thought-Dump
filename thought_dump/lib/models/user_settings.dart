import 'package:meta/meta.dart';

@immutable
class UserSettings {
  final String id;
  final String defaultPath;
  final String defaultFileNameTemplate;
  final List<String> defaultProperties;

  const UserSettings({
    required this.id,
    required this.defaultPath,
    required this.defaultFileNameTemplate,
    required this.defaultProperties,
  });

  // Factory-Konstruktor für die Erstellung aus einem Map
  factory UserSettings.fromMap(Map<String, dynamic> map) {
    return UserSettings(
      id: map['id'] as String,
      defaultPath: map['defaultPath'] as String,
      defaultFileNameTemplate: map['defaultFileNameTemplate'] as String,
      defaultProperties: List<String>.from(map['defaultProperties']),
    );
  }

  // Methode zum Konvertieren in ein Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'defaultPath': defaultPath,
      'defaultFileNameTemplate': defaultFileNameTemplate,
      'defaultProperties': defaultProperties,
    };
  }

  // Kopier-Methode mit optionaler Aktualisierung von Feldern
  UserSettings copyWith({
    String? id,
    String? defaultPath,
    String? defaultFileNameTemplate,
    List<String>? defaultProperties,
  }) {
    return UserSettings(
      id: id ?? this.id,
      defaultPath: defaultPath ?? this.defaultPath,
      defaultFileNameTemplate:
          defaultFileNameTemplate ?? this.defaultFileNameTemplate,
      defaultProperties: defaultProperties ?? this.defaultProperties,
    );
  }
}
