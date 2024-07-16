import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

class TodoModel {
  String id;
  String title;
  String? description;
  bool completed;

  TodoModel({
    String? id,
    required this.title,
    this.description,
    this.completed = false,
  }) : id = id ?? const Uuid().v4();

  TodoModel copyWith({
    String? id,
    String? title,
    ValueGetter<String?>? description,
    bool? completed,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description != null ? description() : this.description,
      completed: completed ?? this.completed,
    );
  }
}
