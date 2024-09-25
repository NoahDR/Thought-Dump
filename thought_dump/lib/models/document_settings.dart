import 'package:meta/meta.dart';

@immutable
class Document {
  final String id;
  final String title;
  final String content;
  final DateTime createdDate;
  final String? filePath;

  const Document({
    required this.id,
    required this.title,
    required this.content,
    required this.createdDate,
    this.filePath,
  });

  factory Document.fromMap(Map<String, dynamic> map) {
    return Document(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      createdDate: DateTime.parse(map['createdDate'] as String),
      filePath: map['filePath'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdDate': createdDate.toIso8601String(),
      'filePath': filePath,
    };
  }

  Document copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? createdDate,
    String? filePath,
  }) {
    return Document(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdDate: createdDate ?? this.createdDate,
      filePath: filePath ?? this.filePath,
    );
  }
}
