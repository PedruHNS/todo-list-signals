import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_signals/controllers/todo_controllers.dart';
import 'package:todo_list_signals/models/todo_model.dart';

class TodoCard extends StatelessWidget {
  final TodoModel todo;
  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TodoControllers>(context);
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: todo.completed,
          onChanged: (value) {
            controller.toggle(todo);
          },
        ),
        title: Text(todo.title, overflow: TextOverflow.ellipsis),
        subtitle: Text(
          todo.description != null ? todo.description! : '',
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          onPressed: () {
            controller.removeTodoById(todo.id);
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
