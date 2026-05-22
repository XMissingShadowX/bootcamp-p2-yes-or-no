import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto2yes_or_no_bootcamp/config/theme/app_theme.dart';
import 'package:proyecto2yes_or_no_bootcamp/providers/chat_provider.dart';
import 'package:proyecto2yes_or_no_bootcamp/screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: "Flutter Demo",
        theme: AppTheme(selectedColor: 3).theme(),
        home: ChatScreen(),
      )
    );
  }
}

