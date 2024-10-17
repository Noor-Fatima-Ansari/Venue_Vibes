import 'package:flutter/material.dart';
import 'package:venue_vibes/InputScreen.dart';
import 'package:venue_vibes/PictureDecor.dart';
import 'package:venue_vibes/profile.dart';

class Decor extends StatefulWidget {
  static final GlobalKey<_DecorState> decorKey = GlobalKey<_DecorState>();

  const Decor({super.key});

  @override
  State<Decor> createState() => _DecorState();
}

class _DecorState extends State<Decor> {
  int selectedIndex = 1;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      InputScreen(onNavigate: _onItemTapped),
      PictureDecor(onNavigate: _onItemTapped),
      Profile(onNavigate: _onItemTapped),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            label: "Food Estimation",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_motion),
            label: "Generate",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        selectedItemColor: Colors.orangeAccent,
      ),
    );
  }
}
