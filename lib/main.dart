import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'data/repositories/todo_repositories.dart';
import 'viewmodels/todo_viewmodel.dart';
import 'views/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xhwgcnzvjjqzndnaxbhw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhod2djbnp2ampxem5kbmF4Ymh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njc3NjQ0MzEsImV4cCI6MjA4MzM0MDQzMX0.tWuvvQfix5iGlpPDIk5CDx_fU2C932jrbHmkDwBsHJA',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TodoViewModel(TodoRepository())..loadTodos(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TodoFormPage(),
      ),
    );
  }
}
