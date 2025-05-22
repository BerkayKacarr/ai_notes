import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note_model.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void _saveNote() async {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    if (title.isEmpty || content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen başlık ve içerik girin')),
      );
      return;
    }

    final newNote = Note(
      title: title,
      content: content,
    );

    await FirebaseFirestore.instance.collection('notes').add(newNote.toMap());
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yeni Not')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Başlık'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: 'İçerik'),
              maxLines: 8,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveNote,
              child: const Text('Kaydet'),
            )
          ],
        ),
      ),
    );
  }
}
