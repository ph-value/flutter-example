import 'package:flutter_app/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'title - main',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new HomePage(),
    );
  }
}
