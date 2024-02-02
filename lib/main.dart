import 'package:flutter/material.dart';
import 'package:minimal_notes_app/modals/note_database.dart';
import 'package:minimal_notes_app/pages/notes_page.dart';
import 'package:minimal_notes_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // initilize note isar db
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.inititialize();

  runApp(
    MultiProvider(
    providers: [
      // Note Provider
      ChangeNotifierProvider(create: (context) => NoteDatabase()),

      // Theme Provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NotesPage(),
      theme: Provider.of<ThemeProvider>(context).themeData
    );
  }
}