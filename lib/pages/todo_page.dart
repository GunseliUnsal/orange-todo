import 'package:flutter/material.dart';
import 'package:orange_todo/constants/colors.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 58.0),
          child: Center(
            child: Image.asset(
              "assets/png/orange_image.png",
              width: 40,
            ),
          ),
        ),
        backgroundColor: navbarColor,
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
