import "package:flutter/material.dart";
import "package:todoapp/components/button.dart";

// ignore: must_be_immutable
class TaskAlert extends StatelessWidget {
  TaskAlert({super.key, required this.controller, required this.onCancel, required this.onSave});

  TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text(
        "What's your Task",
        textAlign: TextAlign.center,
      ),
      content:Container(
        height: 120,
        child:Column (
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
        TextField(
            controller: controller,
            decoration:  const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "give your task name here")),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          
          children: [
        
            dialogButton(buttonName: "Add Task", onPressed: onSave),
            dialogButton(buttonName: "Cancel", onPressed: onCancel),
          ],
        )
      ],
    )
    )
    );
  }
}
