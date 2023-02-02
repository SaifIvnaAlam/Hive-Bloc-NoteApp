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
              cubit.deleteNote(NoteModel(
                title: noteModel.title,
                description: noteModel.description,
              ));
            },
            icon: const Icon(Icons.delete),
            color: Colors.red,
          ),
          IconButton(
            onPressed: () {
              cubit.updateTodo(NoteModel(
                title: noteModel.title,
                description: noteModel.description,
              ));
            },
            icon: const Icon(Icons.edit),
            color: Colors.green,
          ),
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
