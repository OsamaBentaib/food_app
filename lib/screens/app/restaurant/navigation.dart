import "package:flutter/material.dart";
import 'package:food_app/components/icons.dart';
import 'package:food_app/screens/app/restaurant/screens/orders/order_screen.dart';
import 'package:food_app/screens/app/restaurant/screens/home/home_screen.dart';
import 'package:food_app/screens/app/restaurant/screens/menu/menu_screen.dart';
import 'package:food_app/screens/app/restaurant/screens/settings/settings_screen.dart';

class RestaurantNavigationScreen extends StatefulWidget {
  @override
  _RestaurantNavigationScreenState createState() =>
      _RestaurantNavigationScreenState();
}

class _RestaurantNavigationScreenState
    extends State<RestaurantNavigationScreen> {
  int _currentTab = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MenuScreen(),
    OrdersScreen(),
    SettingsScreen(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Container(
        child: _widgetOptions.elementAt(_currentTab),
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              child: _selectedIndex == 0
                  ? House(
                      selected: true,
                    )
                  : House(
                      selected: false,
                    ),
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: _selectedIndex == 1
                  ? MenuIcon(selected: true)
                  : MenuIcon(selected: false),
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: _selectedIndex == 2
                  ? Bagoutline(selected: true)
                  : Bagoutline(selected: false),
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Container(
              child: _selectedIndex == 3
                  ? FilterL(selected: true)
                  : FilterL(selected: false),
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
