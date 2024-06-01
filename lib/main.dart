import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:todoapp/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const TodoList(),
        });
  }
}
