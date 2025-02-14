import 'package:flutter/material.dart';
import 'package:notes_app/db/database_helper.dart';
import 'package:notes_app/models/node_model.dart';

class NotesProvider extends ChangeNotifier {
  List<Note> _notes = [];
  List<Note> get notes => _notes;

  NotesProvider() {
    loadNotes();
  }

  Future<void> loadNotes() async {
    _notes = await DatabaseHelper.instance.fetchNotes();
    notifyListeners();
  }

  Future<void> addNote(Note note) async {
    await DatabaseHelper.instance.insert(note);
    await loadNotes();
  }

  Future<void> updateNote(Note note) async {
    await DatabaseHelper.instance.update(note);
    await loadNotes();
  }

  Future<void> deleteNote(int id) async {
    await DatabaseHelper.instance.delete(id);
    await loadNotes();
  }
}
