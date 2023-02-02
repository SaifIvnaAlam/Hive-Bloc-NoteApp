import 'package:flutter/material.dart';
import 'package:hive_database/notemode.dart';
import 'package:hive_database/util/app_style.dart';

import '../cubit/note_cubit.dart';

class NoteTile extends StatelessWidget {
  final NoteModel noteModel;
  const NoteTile({Key? key, required this.noteModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = NoteCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onLongPress: () => showModalBottomSheet(
            backgroundColor: Colors.purpleAccent,
            context: context,
            isScrollControlled: true,
            isDismissible: true,
            builder: (BuildContext context) {
              return Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        cubit.deleteNote(NoteModel(
                          title: noteModel.title,
                          description: noteModel.description,
                        ));
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.remove_circle_outline),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Delete Note",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        cubit.updateNote(NoteModel(
                          title: noteModel.title,
                          description: noteModel.description,
                        ));
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.edit_attributes_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Edit Note",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.purpleAccent),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  noteModel.title.toUpperCase(),
                  style: kRobotoSemiBold.copyWith(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              const Divider(
                height: 2,
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                noteModel.description,
                style: kRobotoMedium.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// IconButton(
//   onPressed: () {
   
//   },
//   icon: const Icon(Icons.delete),
//   color: Colors.red,
// ),
