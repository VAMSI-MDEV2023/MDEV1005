import 'package:flutter/material.dart';
import 'package:myapp/note_model.dart';

// NoteView Widget for displaying the details of a single note
class NoteView extends StatelessWidget {
  const NoteView({
    super.key,
    required this.note,
    required this.onNoteDeleted,
    required this.index,
  });

  final Note note;
  final int index;
  final Function(int) onNoteDeleted; // Callback function for note deletion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note View"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          // IconButton for deleting the current note
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Delete This?"),
                    content: Text("Note ${note.title} will be deleted!"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          onNoteDeleted(index); // Invoke the callback to delete the note
                          Navigator.of(context).pop();
                        },
                        child: const Text("Delete"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(fontSize: 26),
            ),
            const SizedBox(height: 10),
            Text(
              'Body: ${note.body}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}