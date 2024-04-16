import 'package:flutter/material.dart';
import 'package:music_app/Models/playlist_provider.dart';
import 'package:music_app/components/Themes/light_theme.dart';
import 'package:music_app/play_list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => PlayListProvider())],
      child: MaterialApp(
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          home: const SongsPage()),
    );
  }
}
