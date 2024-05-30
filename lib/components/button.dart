import "package:flutter/material.dart";

// ignore: must_be_immutable
class dialogButton extends StatelessWidget {
  dialogButton(
      {super.key, required this.buttonName, required this.onPressed});

  String buttonName;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(buttonName),
    );
  }
}
