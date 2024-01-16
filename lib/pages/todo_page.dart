import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:orange_todo/constants/colors.dart';
import 'package:orange_todo/data/database.dart';
import 'package:orange_todo/util/dialog_box.dart';
import 'package:orange_todo/util/todo_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

const String _image = "assets/png/orange_image.png";

class _TodoPageState extends State<TodoPage> {
  //* reference the hive box
  final _myBox = Hive.box("myBox");
  ToDoDateBase db = ToDoDateBase();

  @override
  void initState() {
    // TODO: if this is the 1st time ever opening the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //* there already exists data
      db.loadData();
    }

    super.initState();
  }

  //* text controller
  final _controller = TextEditingController();

  //* checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  //*save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
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

  //* delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
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
          itemCount: db.toDoList.length,
          itemBuilder: (BuildContext context, int index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
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
