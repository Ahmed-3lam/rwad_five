import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rwad/dummy_projects/note/cubit/note_cubit.dart';
import 'package:rwad/dummy_projects/note/note_hive_helper.dart';

class NoteScreen extends StatelessWidget {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NoteCubit>();
    return BlocListener<NoteCubit, NoteState>(
      listener: (context, state) {
        if (state is NoteErrorState) {
          Get.snackbar(
            "Error",
            "Error Happened",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
        if (state is NoteSuccessState) {
          Get.snackbar(
            "Success",
            "Data Fetched Succefully",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Note App",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            InkWell(
              onTap: () {
                cubit.removeAll();
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
            await _showDialog(context, cubit);
          },
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) {
              if (state is NoteLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NoteErrorState) {
                return Center(
                  child: Text(
                    "ERROR",
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                );
              } else {
                return ListView.separated(
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
                                  cubit,
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
                                  cubit.removeSingleNote(i);
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ));
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context, NoteCubit cubit,
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
                    cubit.updateNote(
                      index: index!,
                      text: _textController.text,
                    );
                  } else {
                    cubit.addNote(_textController.text);
                    _textController.clear();
                  }
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
