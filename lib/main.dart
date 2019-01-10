import 'package:flutter/material.dart';
import 'package:flutter_app/ex1.dart';
import 'package:flutter_app/nameGenerator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Startup Name Generator",
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        '/ex1': (BuildContext context) => Ex1(),
        '/nameGenerator': (BuildContext context) => NameGeneratorPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('header'),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              title: Text('Startup Name Generator'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/nameGenerator');
              },
            ),
            ListTile(
              title: Text('Building Layouts'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/ex1');
              },
            ),
            ListTile(
              title: Text('Next'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Text('aaa'),
    );
  }
}
