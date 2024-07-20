import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:todo_list_signals/controllers/todo_controllers.dart';
import 'package:todo_list_signals/page/home/widget/add_modal.dart';
import 'package:todo_list_signals/page/home/widget/todo_card.dart';

class HomePage extends StatelessWidget {
  final TodoControllers controller;
  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Watch(
      (context) => Scaffold(
        appBar: AppBar(
          title: Text(controller.todosStatusString.value),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => const AddModal());
              },
              icon: const Icon(Icons.checklist_sharp),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            return TodoCard(todo: controller.todos[index]);
          },
        ),
      ),
    );
  }
}
