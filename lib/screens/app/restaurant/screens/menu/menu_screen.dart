import 'package:flutter/material.dart';
import 'package:food_app/screens/app/components/containers/menu/menu_screen.dart';
import 'package:food_app/screens/app/restaurant/screens/menu/components/create_menu.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MenuScreenLists(id: null),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CreateMenuItem(
                  itemList: null,
                );
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
