import 'package:flutter/material.dart';
import 'package:minimal_notes_app/modals/note_database.dart';
import 'package:minimal_notes_app/pages/notes_page.dart';
import 'package:provider/provider.dart';

void main() async {
  // initilize note isar db
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.inititialize();

  runApp(
    ChangeNotifierProvider(
      create: (context) => NoteDatabase(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage()
    );
  }
}