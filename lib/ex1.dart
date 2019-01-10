import 'package:flutter/material.dart';

class Ex1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Ex1',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BuildLayout(
        title: 'ex-build Layout',
      ),
    );
  }
}

class BuildLayout extends StatefulWidget {
  BuildLayout({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BuildLayoutState createState() => _BuildLayoutState();
}

class _BuildLayoutState extends State<BuildLayout> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
