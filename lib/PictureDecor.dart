import 'package:flutter/material.dart';
import 'package:venue_vibes/Specify.dart';

class PictureDecor extends StatefulWidget {
  final Function(int) onNavigate;
  const PictureDecor({super.key, required this.onNavigate});

  @override
  State<PictureDecor> createState() => _PictureDecorState();
}

class _PictureDecorState extends State<PictureDecor> {
  List<String> Apics = [
    "images/hyd.png",
    "images/karachi.png",
    "images/Islamabad.png",
    "images/lahore.png"
  ];
  List<String> Atitle = ["Hyderabad", "Karachi", "Islamabad", "Lahore"];
  List<String> Epics = [
    "images/graduation.png",
    "images/wedding.png",
    "images/christmas.png",
    "images/baby.png",
    "images/bachelor.png"
        "images/birthday.png"
  ];
  List<String> Etitle = [
    "Graduation Celebration",
    "Wedding Celebration",
    "Christmas Celebration",
    "Baby Shower",
    "Bachlor celebration",
    "Birthday celebration"
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: Text(
                  "Venue Vibes",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Budget",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your budget for Place",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Set budget logic
                        },
                        child: const Text("Set Budget"),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Specify().buildCardListArea("Choose Area", Apics, Atitle),
              const SizedBox(height: 20),
              Specify().buildCardListEvent("Event Type", Epics, Etitle),
              const SizedBox(height: 20),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Add Photo",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: FloatingActionButton(
                        mini: true,
                        backgroundColor: Colors.purple,
                        child: Icon(Icons.add, size: 20, color: Colors.grey),
                        onPressed: () {
                          // Add photo logic here
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    widget.onNavigate(0);
                    setState(() {});
                  },
                  child: const Text("Generate"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
