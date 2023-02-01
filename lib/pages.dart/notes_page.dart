import 'package:flutter/material.dart';
import 'package:hive_database/notemode.dart';

import '../cubit/note_cubit.dart';

class TodoTile extends StatelessWidget {
  final NoteModel noteModel;
  const TodoTile({Key? key, required this.noteModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = NoteCubit.get(context);
    return ListTile(
      title: Row(
        children: [
          Text(noteModel.title),
          const Spacer(),
          IconButton(
            onPressed: () {
              cubit.updateTodo(NoteModel(
                title: noteModel.title,
                description: noteModel.description,
              ));
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.amber,
          ),
          IconButton(
            onPressed: () {
              cubit.updateTodo(NoteModel(
                title: noteModel.title,
                description: noteModel.description,
              ));
            },
            icon: const Icon(Icons.done),
            color: Colors.green,
          ),
          IconButton(
            onPressed: () {
              cubit.updateTodo(NoteModel(
                title: noteModel.title,
                description: noteModel.description,
              ));
            },
            icon: const Icon(Icons.book),
          )
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(noteModel.description),
          ],
        ),
      ),
    );
  }
}
