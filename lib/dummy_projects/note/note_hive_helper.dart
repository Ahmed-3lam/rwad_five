import 'package:hive/hive.dart';

class NoteHiveHelper {
  static const noteBox = "NOTE_BOX";
  static const noteKey = "NOTE_Key";
  static List<String> noteList = [];

  static void addNote(String text) {
    noteList.add(text);
    Hive.box(noteBox).put(
      noteKey,
      noteList,
    );
  }

  static void updateNote({
    required int index,
    required String text,
  }) {
    noteList[index] = text;
    Hive.box(noteBox).put(noteKey, noteList);
  }

  static void removeNote(int index) {
    noteList.removeAt(index);
    Hive.box(noteBox).put(noteKey, noteList);
  }

  static void removeAll() {
    NoteHiveHelper.noteList.clear();
    Hive.box(noteBox).put(noteKey, noteList);
  }

  static void getNotes() {
    if (Hive.box(noteBox).get(
          noteKey,
        ) !=
        null)
      noteList = Hive.box(noteBox).get(
        noteKey,
      );
  }
}

/// Add Note
/// Remove Note
/// Remove All Notes
/// Update Note
/// Get All Notes
