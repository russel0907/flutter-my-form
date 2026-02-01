import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:audio_service/audio_service.dart';

import 'data/repositories/todo_repositories.dart';
import 'viewmodels/todo_viewmodel.dart';
import 'views/splash_view.dart';
import 'core/audio/background_music_handler.dart';

late AudioHandler audioHandler;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  final supabaseUrl = dotenv.env['SUPABASE_URL']!;
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']!;

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  //INIT BACKGROUND AUDIO SERVICE (ONCE)
  audioHandler = await AudioService.init(
    builder: () => BackgroundMusicHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.example.bg_music',
      androidNotificationChannelName: 'Background Music',
      androidNotificationOngoing: true,
    ),
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
      child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
