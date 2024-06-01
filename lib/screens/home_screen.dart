import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:todoapp/components/add_task_alert.dart";
import "package:todoapp/components/to_do_tile.dart";
import "package:todoapp/data/database.dart";

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // reference the hive box

  final myBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

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
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
                deleteFunction: (context) => deleteTask(index),
                taskName: db.toDoList[index][0],
                onChanged: (value) => onChangedFun(value, index),
                taskCompleted: db.toDoList[index][1],
                changedColor: changeBackGroundColor(index));
          },
        ));
  }

  onChangedFun(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  Color changeBackGroundColor(int index) {
    if (db.toDoList[index][1] == true) {
      return Colors.green;
    }
    
    return Colors.lightBlueAccent;
  }

  void saveText() {
    setState(() {
      db.toDoList.add([textController.text, false]);
      textController.clear();
    });
    
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }
}
