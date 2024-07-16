import 'package:signals/signals.dart';
import 'package:todo_list_signals/models/todo_model.dart';

class TodoControllers {
  final todos = <TodoModel>[].toSignal();

  late final Computed<String> todosStatusString = computed(() {
    final notCompletedTodos = todos.where((todo) => !todo.completed);

    if (todos.isEmpty) {
      return 'sem tarefas';
    } else if (notCompletedTodos.isEmpty) {
      return 'vc já completou todas as tarefas';
    }
    return 'você possui ${notCompletedTodos.length} tarefa${notCompletedTodos.length > 1 ? 's' : ''} pendente${notCompletedTodos.length > 1 ? 's' : ''}';
  });

  void addTodo(TodoModel todo) => todos.add(todo);

  void removeTodoById(String id) => todos.removeWhere((todo) => todo.id == id);

  void toggle(TodoModel todoUpdate) {
    todos.value = todos.map((todo) {
      if (todo.id == todoUpdate.id) {
        return todo.copyWith(completed: !todo.completed);
      }
      return todo;
    }).toList();
  }
}
