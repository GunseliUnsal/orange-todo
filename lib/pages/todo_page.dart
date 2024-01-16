import 'package:flutter/material.dart';
import 'package:orange_todo/constants/colors.dart';
import 'package:orange_todo/util/dialog_box.dart';
import 'package:orange_todo/util/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

const String _image = "assets/png/orange_image.png";

class _TodoPageState extends State<TodoPage> {
  //* text controller
  final _controller = TextEditingController();

  //* list of todo tasks
  List toDoList = [
    ["Make reels video", true],
    ["Go out with your sis", false]
  ];

  //* checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //*save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //* create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (builder) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: FloatingActionButton(
            onPressed: createNewTask,
            backgroundColor: buttonColor,
            shape: const CircleBorder(),
            elevation: 3,
            child: const Icon(Icons.add),
          ),
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, int index) {
            return ToDoTile(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index));
          },
        ));
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(right: 58.0),
        child: Center(
          child: Image.asset(
            _image,
            width: 40,
          ),
        ),
      ),
      backgroundColor: navbarColor,
    );
  }
}
