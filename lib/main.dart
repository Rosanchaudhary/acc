import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import 'nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        
          child: BottomNavyBar(
            selectedIndex: _currentIndex,
            showElevation: true,
            itemCornerRadius: 14,
            curve: Curves.easeIn,
            onItemSelected: (index) => setState(() => _currentIndex = index),
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.home,
                  color: Color.fromRGBO(80, 133, 254, 1),
                ),
                title: const Text( 
                  'Home',
                  style: TextStyle(
                    color: Color.fromRGBO(80, 133, 254, 1),
                  ),
                ),
                activeColor: const Color.fromRGBO(235, 241, 254, 1),
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.list,
                  color: Color.fromRGBO(80, 133, 254, 1),
                ),
                title: const Text(
                  'Users',
                  style: TextStyle(
                    color: Color.fromRGBO(80, 133, 254, 1),
                  ),
                ),
                activeColor: const Color.fromRGBO(235, 241, 254, 1),
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.message,
                  color: Color.fromRGBO(80, 133, 254, 1),
                ),
                title: const Text(
                  'Messages',
                  style: TextStyle(
                    color: Color.fromRGBO(80, 133, 254, 1),
                  ),
                ),
                activeColor: const Color.fromRGBO(235, 241, 254, 1),
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.person,
                  color: Color.fromRGBO(80, 133, 254, 1),
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    color: Color.fromRGBO(80, 133, 254, 1),
                  ),
                ),
                activeColor: const Color.fromRGBO(235, 241, 254, 1),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
