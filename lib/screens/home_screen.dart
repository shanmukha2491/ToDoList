import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:todoapp/components/add_task_alert.dart";
import "package:todoapp/components/to_do_tile.dart";

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List tasks = [
    ["Make tutorials", false],
    ["Complete DSA", false],
    ["Eat healthy", true]
  ];

  void createNewTask() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return TaskAlert(
            onSave: saveText,
            onCancel: () {
              Navigator.of(context).pop();
            },
            controller: textController,
          );
        });
  }

  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Tasks"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add), onPressed: createNewTask),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return ToDoTile(
                deleteFunction: (context) => deleteTask(index),
                taskName: tasks[index][0],
                onChanged: (value) => onChangedFun(value, index),
                taskCompleted: tasks[index][1],
                changedColor: changeBackGroundColor(index));
          },
        ));
  }

  onChangedFun(bool? value, int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

  Color changeBackGroundColor(int index) {
    if (tasks[index][1] == true) {
      return Colors.green;
    }
    return Colors.lightBlueAccent;
  }

  void saveText() {
    setState(() {
      tasks.add([textController.text, false]);
      textController.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }
}
