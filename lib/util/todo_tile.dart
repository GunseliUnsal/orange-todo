import 'package:flutter/material.dart';
import 'package:orange_todo/constants/colors.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoTile({super.key, required this.taskName, required this.taskCompleted, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: buttonColor, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            //*checkbox
            Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: navbarColor),

            //*task name
            Text(
              taskName,
              style: TextStyle(
                fontSize: 16,
                decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
