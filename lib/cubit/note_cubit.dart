import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_database/notemode.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  static NoteCubit get(context) => BlocProvider.of(context);

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  List<NoteModel>? noteList = [];
  List<int>? keys = [];
  //Get box
  getBox() async {
    var box = await Hive.openBox<NoteModel>('todos');
    keys = [];
    keys = box.keys.cast<int>().toList();
    noteList = [];
    for (var key in keys!) {
      noteList!.add(box.get(key)!);
    }
    box.close();
    emit(GetBoxState());
  }

  addTodo(NoteModel noteModel) async {
    await Hive.openBox<NoteModel>('todos')
        .then((value) => value.add(noteModel))
        .then((value) => getBox());
    emit(AddNoteState());
  }

  updateNote(NoteModel noteModel) async {
    await Hive.openBox<NoteModel>('todos').then((value) {
      final Map<dynamic, NoteModel> todoMap = value.toMap();
      dynamic desiredKey;
      todoMap.forEach((key, value) {
        if (value.title == noteModel.title) {
          desiredKey = key;
        }
      });
      return value.put(desiredKey, noteModel);
    }).then((value) => getBox());
    emit(AddNoteState());
  }

  clearController() {
    descriptionController.clear();
    titleController.clear();
  }

  deleteNote(NoteModel todoModel) async {
    await Hive.openBox<NoteModel>('todos').then((value) {
      final Map<dynamic, NoteModel> todoMap = value.toMap();
      dynamic desiredKey;
      todoMap.forEach((key, value) {
        if (value.title == todoModel.title) {
          desiredKey = key;
        }
      });
      return value.delete(desiredKey);
    }).then((value) => getBox());
    emit(AddNoteState());
  }
}
