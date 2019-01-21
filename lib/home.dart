import 'package:flutter_app/pages/ex1.dart';
import 'package:flutter_app/pages/ex2.dart';
import 'package:flutter_app/pages/nameGenerator.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  final drawerItems = [
    new DrawerObj("Startup Name Generator", Icons.local_pizza),
    new DrawerObj("ex1 - Build Layout", Icons.time_to_leave),
    new DrawerObj("FriendlychatApp", Icons.chat),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new NameGeneratorPage();
      case 1:
        return new Ex1();
      case 2:
        return new Ex2();
        case 3:
        break;
    }
  }

  _onSelectItem(int index){
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; ++i) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("ph-value's flutter lab"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

class DrawerObj {
  String title;
  IconData icon;

  DrawerObj(this.title, this.icon);
}