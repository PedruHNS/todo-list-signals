import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_signals/controllers/todo_controllers.dart';
import 'package:todo_list_signals/my_app.dart';

void main() {
  runApp(
    Provider(
        create: (_) => TodoControllers(),
        builder: (context, child) => const MyApp()),
  );
}
