import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/todo_viewmodel.dart';

class TodoFormPage extends StatefulWidget {
  const TodoFormPage({super.key});

  @override
  State<TodoFormPage> createState() => _TodoFormPageState();
}

class _TodoFormPageState extends State<TodoFormPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController headerController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController conclusionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    headerController.dispose();
    bodyController.dispose();
    conclusionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TodoViewModel>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: headerController,
              decoration: const InputDecoration(
                labelText: 'Header',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: conclusionController,
              decoration: const InputDecoration(
                labelText: 'Conclusion',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: vm.isLoading
                    ? null
                    : () {
                        final input = {
                          'title': titleController.text.trim(),
                          'header': headerController.text.trim(),
                          'body': bodyController.text.trim(),
                          'conclusion': conclusionController.text.trim(),
                        };

                        if (input.values.any((v) => v.isNotEmpty)) {
                          vm.addMultipleTodos([input]);
                        }

                        titleController.clear();
                        headerController.clear();
                        bodyController.clear();
                        conclusionController.clear();
                      },
                child: vm.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
