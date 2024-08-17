import 'package:flutter/material.dart';
import 'package:rwad/dummy_projects/note/note_hive_helper.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final _textController = TextEditingController();
  @override
  void initState() {
    NoteHiveHelper.getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Note App",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
            onTap: () {
              NoteHiveHelper.removeAll();
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Clear All",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _showDialog(context);
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemCount: NoteHiveHelper.noteList.length,
            separatorBuilder: (c, i) => SizedBox(
                  height: 20,
                ),
            itemBuilder: (c, i) => Stack(
                  alignment: Alignment.topRight,
                  children: [
                    InkWell(
                      onTap: () async {
                        await _showDialog(
                          context,
                          isUpdate: true,
                          index: i,
                        );
                      },
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: i == 0
                                ? Colors.red.withOpacity(.2)
                                : i % 2 == 0
                                    ? Colors.green.withOpacity(.2)
                                    : Colors.blue.withOpacity(.2),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(NoteHiveHelper.noteList[i]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          NoteHiveHelper.removeNote(i);
                          setState(() {});
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                )),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context,
      {bool isUpdate = false, int? index}) async {
    await showDialog(
      context: context,
      builder: (context) {
        if (isUpdate) {
          _textController.text = NoteHiveHelper.noteList[index!];
        }

        return AlertDialog(
          title: const Text('Add note'),
          content: TextField(
            controller: _textController,
            autofocus: true,
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text(isUpdate ? "Update" : 'Add'),
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  if (isUpdate) {
                    NoteHiveHelper.updateNote(
                      index: index!,
                      text: _textController.text,
                    );
                  } else {
                    NoteHiveHelper.addNote(_textController.text);
                    _textController.clear();
                  }

                  setState(() {});
                  Navigator.pop(
                    context,
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}

/// Add Note
/// Remove Note
/// Remove All Notes
/// Update Note
/// Get All Notes
