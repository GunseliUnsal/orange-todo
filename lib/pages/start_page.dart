import 'package:flutter/material.dart';
import 'package:orange_todo/constants/colors.dart';
import 'package:orange_todo/pages/todo_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({
    super.key,
  });

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/png/orange_image.png", width: 220),
            const SizedBox(height: 10), // Adjust the height between image and text
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  Text(
                    "ORGANIZE YOUR DAY",
                    style: TextStyle(color: orangeTextColor, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "add your daily to-do list",
                    style: TextStyle(color: greenTextColor, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60), // Adjust the height between text and button
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TodoPage()));
              },
              child: Container(
                height: 60,
                width: 190,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange,
                ),
                child: const Center(
                  child: Text(
                    "Start to Plan",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
