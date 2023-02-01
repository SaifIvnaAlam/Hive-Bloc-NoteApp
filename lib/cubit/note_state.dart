part of 'note_cubit.dart';

@immutable
abstract class NoteState {}

class NoteInitial extends NoteState {}

class GetBoxState extends NoteState {}

class AddNoteState extends NoteState {}
