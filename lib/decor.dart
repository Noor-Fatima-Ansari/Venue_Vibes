// import 'package:flutter/material.dart';
// import 'package:venue_vibes/InputScreen.dart';
// import 'package:venue_vibes/PictureDecor.dart';

// class Decor extends StatefulWidget {
//   const Decor({super.key});

//   @override
//   State<Decor> createState() => _DecorState();
// }

// class _DecorState extends State<Decor> {
//   int selectedIndex = 1;

//    List<Widget> _widgetOptions = <Widget>[
//     InputScreen(),
//      PictureDecor(),
//     const Center(child: Text('Profile Screen')),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       selectedIndex = index; // Update the selected index
//     });
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Colors.grey[200],
//       //   elevation: 0,
//       //   toolbarHeight: 20,
//       // ),
//       body: _widgetOptions.elementAt(selectedIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex,
//         onTap: _onItemTapped,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.fastfood),
//             label: "Food Estimation",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.auto_awesome_motion),
//             label: "Generate",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: "Profile",
//           ),
//         ],
//         selectedItemColor: Colors.orangeAccent,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:venue_vibes/InputScreen.dart';
import 'package:venue_vibes/PictureDecor.dart';

class Decor extends StatefulWidget {
  const Decor({super.key});

  @override
  State<Decor> createState() => _DecorState();
}

class _DecorState extends State<Decor> {
  int selectedIndex = 1;

  // Define the widget options
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();

    // Pass the callback `_onItemTapped` to the child widgets
    _widgetOptions = <Widget>[
      InputScreen(onNavigate: _onItemTapped), // Pass callback to InputScreen
      PictureDecor(
        onNavigate: _onItemTapped,
      ), // Pass callback to PictureDecor
      const Center(child: Text('Profile Screen')),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index; // Update the selected index
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
