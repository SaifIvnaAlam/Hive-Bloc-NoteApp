import 'package:hive_flutter/hive_flutter.dart';

part 'notemode.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String Description;

  NoteModel({required this.title, required this.Description});
}
