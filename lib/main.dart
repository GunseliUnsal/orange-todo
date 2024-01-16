import 'package:flutter/material.dart';
import "package:hive_flutter/hive_flutter.dart";
import 'package:orange_todo/constants/colors.dart';
import 'package:orange_todo/pages/start_page.dart';

void main() async {
  //* init the hive
  await Hive.initFlutter();

  //* open a box
  var box = await Hive.openBox("myBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orange To-Do',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const StartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
