import 'package:bloc/bloc.dart';

import '../note_hive_helper.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  void removeAll() {
    NoteHiveHelper.removeAll();
    emit(NoteBodyChanged());
  }

  void removeSingleNote(int i) {
    NoteHiveHelper.removeNote(i);
    emit(NoteBodyChanged());
  }

  void addNote(String text) {
    NoteHiveHelper.addNote(text);
    emit(NoteBodyChanged());
  }

  void updateNote({
    required int index,
    required String text,
  }) {
    NoteHiveHelper.updateNote(
      index: index,
      text: text,
    );
    emit(NoteBodyChanged());
  }

  void getNotes() async {
    emit(NoteLoadingState());
    await Future.delayed(Duration(seconds: 4));
    try {
      NoteHiveHelper.getNotes();
      emit(NoteSuccessState());
    } catch (e) {
      emit(NoteErrorState());
    }
  }
}
