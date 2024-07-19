import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_signals/controllers/todo_controllers.dart';
import 'package:todo_list_signals/models/todo_model.dart';

class AddModal extends StatefulWidget {
  const AddModal({super.key});

  @override
  State<AddModal> createState() => _AddModalState();
}

class _AddModalState extends State<AddModal> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TodoControllers>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Adicionar tarefa'),
          TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Título')),
          TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Descrição')),
          ElevatedButton(
            onPressed: () {
              TodoModel todo = TodoModel(
                  title: _titleController.text,
                  description: _descriptionController.text);
              controller.addTodo(todo);
              Navigator.of(context).pop();
            },
            child: const Text('Adicionar'),
          )
        ],
      ),
    );
  }
}
