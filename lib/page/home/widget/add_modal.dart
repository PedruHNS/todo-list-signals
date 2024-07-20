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
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: height * 0.3,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Adicionar tarefa'),
              TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Título')),
              const SizedBox(height: 8),
              TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Descrição')),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48)),
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
        ),
      ),
    );
  }
}
