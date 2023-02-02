import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_database/notemode.dart';
import 'package:hive_database/pages.dart/all_notes.dart';
import 'package:hive_database/util/app_style.dart';

import '../cubit/note_cubit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NoteCubit.get(context);

        return Scaffold(
            appBar: AppBar(
              title: Text(
                "NOTES",
                style: kRobotoBold.copyWith(
                    fontSize: 50, color: Colors.purpleAccent),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Add Note'),
                          content: BlocBuilder<NoteCubit, NoteState>(
                            builder: (context, state) {
                              return Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      controller: cubit.titleController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Title',
                                        hintText: 'Enter Title',
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'hey bro dont leave it empty';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    TextFormField(
                                      controller: cubit.descriptionController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Description',
                                        hintText: 'Enter Description',
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'hey bro dont leave it empty';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  cubit.clearController();
                                },
                                child: const Text('Cancel')),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton.icon(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.addTodo(NoteModel(
                                      title: cubit.titleController.text,
                                      description:
                                          cubit.descriptionController.text,
                                    ));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          '${cubit.titleController.text} Added'),
                                      backgroundColor: Colors.green.shade500,
                                    ));
                                    Navigator.pop(context);
                                    cubit.clearController();
                                  }
                                },
                                icon: const Icon(Icons.add),
                                label: const Text('Add'))
                          ],
                        ));
              },
              child: const Icon(Icons.add),
            ),
            body: Column(
              children: const [
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 5,
                  color: Colors.purpleAccent,
                ),
                AllTodosScreen(),
              ],
            ));
      },
    );
  }
}
