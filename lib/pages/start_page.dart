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

const String _orangeImg = "assets/png/orange_image.png";
const String _title = "ORGANIZE YOUR DAY";
const String _description = "add your daily to-do list";
const String _buttonText = "Start to Plan";

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(_orangeImg, width: 220),
            const SizedBox(height: 10), // Adjust the height between image and text
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: _StartText(),
            ),
            const SizedBox(height: 60), // Adjust the height between text and button
            const _Button(),
          ],
        ),
      ),
    );
  }
}

class _StartText extends StatelessWidget {
  const _StartText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _title,
          style: TextStyle(color: orangeTextColor, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(
          _description,
          style: TextStyle(color: greenTextColor, fontSize: 18),
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const TodoPage()));
      },
      child: Container(
        height: 60,
        width: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonColor,
        ),
        child: const Center(
          child: Text(
            _buttonText,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
