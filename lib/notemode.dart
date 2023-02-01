import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'notemode.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  const NoteModel({required this.title, required this.description});
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;

  Map<String, dynamic> tojson() {
    return {"title": title, "description": description};
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(title: json["title"], description: json["description"]);
  }
}
