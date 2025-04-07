import 'package:flutter/material.dart';
import 'package:todo/note.dart';
import 'package:todo/note_database.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  //notes db
  final notesDatabase = NoteDatabase();

  //text controller
  final noteController = TextEditingController();
  //user wants to add new note
  void addNewNote() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("New Note"),
            content: TextField(controller: noteController),
            actions: [
              //cancel button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  noteController.clear();
                },
                child: Text("Cancel"),
              ),

              //save button
              TextButton(
                onPressed: () {
                  //create a new note
                  final newNote = Note(content: noteController.text);
                  //save in db
                  notesDatabase.createNote(newNote);
                  Navigator.pop(context);
                  noteController.clear();
                },
                child: const Text("Save"),
              ),
            ],
          ),
    );
  }

  //user wants to update note
  void updateNote(Note note) {
    //pre-fill controller with existing note
    noteController.text = note.content;
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Update Note"),
            content: TextField(controller: noteController),
            actions: [
              //cancel button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  noteController.clear();
                },
                child: Text("Cancel"),
              ),

              //save button
              TextButton(
                onPressed: () {
                  //save in db
                  notesDatabase.updateNote(note, noteController.text);
                  Navigator.pop(context);
                  noteController.clear();
                },
                child: const Text("Save"),
              ),
            ],
          ),
    );
  }

  //user wants to delete note
  void deleteNote(Note note) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Delete Note?"),
            actions: [
              //cancel button
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  noteController.clear();
                },
                child: Text("Cancel"),
              ),

              //save button
              TextButton(
                onPressed: () {
                  //save in db
                  notesDatabase.deleteNote(note);
                  Navigator.pop(context);
                  noteController.clear();
                },
                child: const Text("Delete"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Center(
          child: Text(
            "How are you feelin' today?",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewNote,
        child: Icon(Icons.add),
      ),

      //Body->StreamBuilder
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StreamBuilder(
            //listenstothisstream
            stream: notesDatabase.stream,
            //to buildourUI
            builder: (context, snapshot) {
              //loading..
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              //loaded!
              final notes = snapshot.data!;
              //list of notes UI
              return ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  //get each note
                  final note = notes[index];
                  //list tile UI
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ), // more spacing

                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      title: Text(
                        note.content,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            //update button
                            IconButton(
                              onPressed: () => updateNote(note),
                              icon: Icon(
                                Icons.edit,
                                color: const Color.fromARGB(255, 183, 35, 209),
                              ),
                            ),

                            //delete buttton
                            IconButton(
                              onPressed: () => deleteNote(note),
                              icon: Icon(Icons.delete, color: Colors.yellow),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
