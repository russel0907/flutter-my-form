import 'package:flutter/material.dart';
import '../data/models/todo_model.dart';
import '../data/repositories/todo_repositories.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoRepository repository;

  TodoViewModel(this.repository);

  List<Todo> todos = [];
  bool isLoading = false;

  Future<void> loadTodos() async {
    isLoading = true;
    notifyListeners();

    todos = await repository.fetchTodos();

    isLoading = false;
    notifyListeners();
  }

  Future<void> addTodo(String title) async {
    await repository.addTodo(title);
    await loadTodos();
  }

  Future<void> addMultipleTodos(List<Map<String, String>> inputs) async {
    final todosToInsert = inputs
        .where((row) =>
            row['title']!.trim().isNotEmpty ||
            row['header']!.trim().isNotEmpty ||
            row['body']!.trim().isNotEmpty ||
            row['conclusion']!.trim().isNotEmpty)
        .map((row) => {
              'title': row['title']!.trim(),
              'header': row['header']!.trim(),
              'body': row['body']!.trim(),
              'conclusion': row['conclusion']!.trim(),
            })
        .toList();

    if (todosToInsert.isEmpty) return;

    isLoading = true;
    notifyListeners();

    await repository.addMultipleTodos(todosToInsert);

    isLoading = false;
    notifyListeners();
  }
}
