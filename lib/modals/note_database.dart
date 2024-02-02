import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:minimal_notes_app/modals/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;
  // INITIAL DATABASE
  static Future<void> inititialize() async {
    final dir = await getApplicationCacheDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  // list of notes
  final List<Note> currentNotes = [];

  // Create
  Future<void> addNote(String text) async {
    // create new Note obj
    final newNote = Note()..text = text;

    // save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    // re-read from db
    fetchNotes();
  }

  // READ
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  // UPDATE
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  // DELETE
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}