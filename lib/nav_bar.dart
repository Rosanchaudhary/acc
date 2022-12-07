import 'package:acc/models/nav_model.dart';
import 'package:acc/screens/chat_screen.dart';
import 'package:acc/screens/home_screen.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Text("Test"),
     ChatScreen(),
    const Text("Home"),
  ];
  bool showAppBar = true;
  int _currentIndex = 0;
  final List _pageStack = [];

  void _pushPage(index) {
    if (_pageStack.isEmpty) {
      _pageStack.add(_currentIndex);
    }

    if (index == _currentIndex) {
      return;
    }

    if (_pageStack.contains(index) && _pageStack.length != 1) {
      _pageStack.remove(index);
    }

    if (!_pageStack.contains(_currentIndex)) {
      _pageStack.add(_currentIndex);
    }

    setState(() {
      _currentIndex = index;
    });
  }

  _popPage(BuildContext context) {
    if (_pageStack.isEmpty) {
      return Future<bool>.value(true);
    } else {
      int t = _pageStack.removeLast();
      setState(() {
        _currentIndex = (_currentIndex != t) ? t : _pageStack.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _popPage(context),
      child: Scaffold(
        body: _widgetOptions[_currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BottomNavyBar(
              selectedIndex: _currentIndex,
              showElevation: true,
              itemCornerRadius: 14,
              curve: Curves.easeIn,
              onItemSelected: (index) {
                setState(() => _currentIndex = index);
                _pushPage(index);
              },
              backgroundColor: Colors.white,
              items: allScreens.map((Screens screen) {
                return BottomNavyBarItem(
                  icon: Icon(
                    screen.icon,
                    color: const Color.fromRGBO(80, 133, 254, 1),
                  ),
                  activeColor: const Color.fromRGBO(235, 241, 254, 1),
                  textAlign: TextAlign.center,
                  title: Text(
                    screen.label,
                    style: const TextStyle(
                      color: Color.fromRGBO(80, 133, 254, 1),
                    ),
                  ),
                );
              }).toList()),
        ),
      ),
    );
  }
}
