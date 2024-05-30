import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  ToDoTile(
      {super.key,
      required this.taskName,
      required this.onChanged,
      required this.taskCompleted,
      this.changedColor = Colors.red,
      required this.deleteFunction});


  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Color changedColor;
  Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(8),
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red,
              )
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                color: changedColor, borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text(
                  taskName,
                  style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ],
            ),
          ),
        ));
  }
}
