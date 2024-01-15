import 'package:flutter/material.dart';
import 'package:orange_todo/constants/colors.dart';
import 'package:orange_todo/pages/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orange To-Do',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const StartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
