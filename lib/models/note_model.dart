import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String? id;
  String title;
  String content;
  String category;
  DateTime createdAt;

  Note({
    this.id,
    required this.title,
    required this.content,
    this.category = 'Genel',
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Note.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Note(
      id: doc.id,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      category: data['category'] ?? 'Genel',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'category': category,
      'createdAt': createdAt,
    };
  }
}
