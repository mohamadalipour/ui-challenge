import 'package:flutter/material.dart';
import 'package:ui_challenge/home_page.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  var currentEnableIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        currentIndex: currentEnableIndex,
        onTap: (index) {
          setState(() {
            currentEnableIndex = index;
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.home,
              color: Colors.grey,
            ),
            title: new Text(''),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite_border, color: Colors.grey),
            title: new Text(''),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.location_city, color: Colors.grey),
            title: new Text(''),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.shopping_cart, color: Colors.grey),
            title: new Text(''),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.time_to_leave, color: Colors.grey),
            title: new Text(''),
          ),
        ],
      ),
      body: HomePage(),
    );
  }
}
