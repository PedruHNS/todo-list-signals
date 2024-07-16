import 'package:flutter/material.dart';
import 'package:todo_list_signals/controllers/todo_controllers.dart';

class HomePage extends StatelessWidget {
  final TodoControllers controller;
  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.todosStatusString.value),
      ),
      body: ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (context, index) {
          return null;
        },
      ),
    );
  }
}
