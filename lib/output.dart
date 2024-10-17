import 'package:flutter/material.dart';
import 'package:venue_vibes/decor.dart';

class OutputScreen extends StatefulWidget {
  // final Function(int) onNavigate;
  // const OutputScreen({super.key, required this.onNavigate});

  @override
  State<OutputScreen> createState() => _OutputScreenState();
}

class _OutputScreenState extends State<OutputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Venue Vibes",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),

                Text(
                  "your board",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  //color: Color(0xFFEDE6EE),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFFEDE6EE),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "images/output.png", // Use image from picture list
                      // width: 116,
                      height: 100,
                      fit: BoxFit.cover, // Cover the whole container
                    ),
                  ),
                ),
                // Second Container
                Container(
                  // color: Color(0xFFEDE6EE),
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFFEDE6EE),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Remaining",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Expense",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Total Budget",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      // Row 2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("45k"),
                          Text("55k"),
                          Text("100k"),
                        ],
                      ),
                      SizedBox(height: 8),
                      Divider(),
                      SizedBox(height: 8),
                      // Row 4
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Food"),
                          Text("30k"),
                        ],
                      ),
                      SizedBox(height: 8),
                      // Row 5
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Venue and Decor"),
                          Text("25k"),
                        ],
                      ),
                    ],
                  ),
                ),
                // Third Container
                Container(
                  //color: Color(0xFFEDE6EE),
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFFEDE6EE),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Activities",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Kids",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Adults",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      // Row 3
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Dance"),
                          Text("Dance"),
                        ],
                      ),
                      SizedBox(height: 8),
                      // Row 4
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Balloon Pop"),
                          Text("Cards"),
                        ],
                      ),
                      SizedBox(height: 8),
                      // Row 5
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Musical Chair"),
                          Text("Guessing Games"),
                        ],
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    if (Decor.decorKey.currentState != null) {
                      Decor.decorKey.currentState!.setState(() {
                        Decor.decorKey.currentState!.selectedIndex = 2;
                      });
                      Navigator.of(context).pop();
                    } else {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => Decor(key: Decor.decorKey)),
                        (route) => false, // Remove all routes before it
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF81717A),
                    padding:
                        EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
