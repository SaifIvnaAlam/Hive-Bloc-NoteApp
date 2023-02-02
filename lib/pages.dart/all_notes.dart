import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_database/cubit/note_cubit.dart';
import 'package:hive_database/notemode.dart';
import 'package:hive_database/pages.dart/notes_page.dart';

class AllTodosScreen extends StatelessWidget {
  const AllTodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(builder: (context, state) {
      var cubit = NoteCubit.get(context);
      List<NoteModel>? noteList = [];
      for (var item in cubit.noteList!) {
        noteList.add(item);
      }
      return noteList.isEmpty
          ? const Center(
              child: Text('Todo list is empty.'),
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return TodoTile(noteModel: noteList[index]);
              },
              itemCount: noteList.length,
              shrinkWrap: true,
            );
    });
  }
}
