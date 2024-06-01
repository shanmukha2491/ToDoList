import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  // reference the box
  List toDoList = [];
  final _myBox = Hive.box("myBox");

  // run this method when opened for the first time
  void createInitialData() {
    toDoList = [
      ["Make Videos", false]
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
