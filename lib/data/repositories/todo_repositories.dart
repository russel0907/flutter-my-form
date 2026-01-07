import '../../core/supabase_client.dart';
import '../models/todo_model.dart';

class TodoRepository {
  Future<List<Todo>> fetchTodos() async {
    final response = await supabase.from('todos').select().order('id');

    return response.map<Todo>((json) => Todo.fromJson(json)).toList();
  }

  Future<void> addTodo(String title) async {
    await supabase.from('todos').insert({
      'title': title,
    });
  }

  Future<void> addMultipleTodos(List<Map<String, dynamic>> todos) async {
    if (todos.isEmpty) return;
    await supabase.from('todos').insert(todos);
  }
}
