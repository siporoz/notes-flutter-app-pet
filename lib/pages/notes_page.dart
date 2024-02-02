import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_notes_app/modals/note.dart';
import 'package:minimal_notes_app/modals/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});


  @override
  State<NotesPage> createState() {
    return _NotesPageState();
  }
}

class _NotesPageState extends State<NotesPage> {
  // text controller to access what the user typed
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // On app start, fetch existing notes
    readNots();
  }

  // read note
  void readNots() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // update a note
  void updateNote(Note note) {
    // pre-fill the current note text
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update Note'),
        content: TextField(controller: textController),
        actions: [
          // update button
          MaterialButton(onPressed: () {
            // update note in db
            context.read<NoteDatabase>().updateNote(note.id, textController.text);
            // clear controller
            textController.clear();
            // pop dialog
            Navigator.pop(context);
          },
          child: const Text('Update'),
          )
        ],
      )
    );
  }

  // delete a note
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  // Create note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          // create button
          MaterialButton(
            onPressed: () {
              // add to db
              context.read<NoteDatabase>().addNote(textController.text);

              // clear controller
              textController.clear();

              // pop dialog box
              Navigator.pop(context);
            },
            child: const Text('Create'),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // note database
    final noteDatabase = context.watch<NoteDatabase>();

    // current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add)
      ),
      drawer: Drawer(),
      body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PADDING
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'Notes',
                style: GoogleFonts.dmSerifText(
                  fontSize: 48,
                  color: Theme.of(context).colorScheme.inversePrimary
                )
              ),
            ),
            // HEADING

            // LIST OF NOTES
            Expanded(
              child: ListView.builder(
              itemCount: currentNotes.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // get individual note
                  final note = currentNotes[index];

                  // list tile UI
                  return ListTile(
                    title: Text(note.text),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // edit btn
                        IconButton(onPressed: () => updateNote(note), icon: const Icon(Icons.edit)),
                        // delete btn
                        IconButton(onPressed: () => deleteNote(note.id), icon: const Icon(Icons.delete ))
                      ],
                    ),
                  );
              })
            )
          ],
        )
  );
  }
}