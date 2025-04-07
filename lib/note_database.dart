import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/note.dart';

class NoteDatabase {
  // note database -> todo
  final database = Supabase.instance.client.from('todo');

  // create
  Future createNote(Note newNote) async {
    await database.insert(newNote.toMap());
  }

  // read
  final stream = Supabase.instance.client
      .from('todo')
      .stream(primaryKey: ['id'])
      .map((data) => data.map((noteMap) => Note.fromMap(noteMap)).toList());

  // update
  Future updateNote(Note oldNote, String newContent) async {
    await database.update({'content': newContent}).eq('id', oldNote.id!);
  }

  // delete
  Future deleteNote(Note note) async {
    await database.delete().eq('id', note.id!);
  }
}
