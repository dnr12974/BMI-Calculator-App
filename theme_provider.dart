import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_app/main_page.dart';
import 'package:ultimate_app/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MaterialApp(
        home: UltimateApp(),
      ),
    ),
  );
}

class UltimateApp extends StatelessWidget {
  const UltimateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}
