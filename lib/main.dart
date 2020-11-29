import 'package:new_chat/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NewChat",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
