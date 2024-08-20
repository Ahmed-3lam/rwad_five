part of 'note_cubit.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NoteBodyChanged extends NoteState {}

class NoteLoadingState extends NoteState {}

class NoteSuccessState extends NoteState {}

class NoteErrorState extends NoteState {}
