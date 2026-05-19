import 'package:flutter/material.dart';
import 'package:proyecto2yes_or_no_bootcamp/config/theme/app_theme.dart';
import 'package:proyecto2yes_or_no_bootcamp/screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme(selectedColor: 3).them(),
      home: ChatScreen(),
    );
  }
}

