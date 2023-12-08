import 'package:flutter/material.dart';
import 'package:myapp/note_model.dart';
import 'package:myapp/noteview.dart';
import 'create_note.dart';  // Import the NoteView class

// Notes Page Widget
class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  _NotesPageState createState() => _NotesPageState();
}

// State class for the Notes Page
class _NotesPageState extends State<NotesPage> {
  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            // Navigate to the NoteView page when a note is tapped
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NoteView(
                  note: notes[index],
                  index: index,
                  onNoteDeleted: onNoteDeleted,  // Pass the callback function
                ),
              ));
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notes[index].title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      notes[index].body,
                      style: const TextStyle(fontSize: 20),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Navigate to the CreateNote page when the FloatingActionButton is pressed
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CreateNote(
              onNewNoteCreated: onNewNoteCreated,
            ),
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

// Callback function when a new note is created
  void onNewNoteCreated(Note note) {
    notes.add(note);
    setState(() {});
  }

  // Callback function when a note is deleted
  void onNoteDeleted(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}
