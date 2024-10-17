import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final Function(int) onNavigate;
  const Profile({super.key, required this.onNavigate});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
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
              const Text(
                "Your Board",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Container(
                height: 242,
                width: 409,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFEDE6EE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "images/d1.png", // Use image from picture list
                    width: 409,
                    height: 224,
                    fit: BoxFit.cover, // Cover the whole container
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 174,
                      width: 116,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE6EE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "images/d2.png", // Use image from picture list
                          height: 174,
                          width: 116,
                          fit: BoxFit.cover, // Cover the whole container
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 0),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 174,
                      width: 224,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE6EE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "images/d3.png", // Use image from picture list
                          width: 224,
                          height: 174,
                          fit: BoxFit.cover, // Cover the whole container
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 174,
                      width: 224,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE6EE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "images/d4.png", // Use image from picture list
                          width: 224,
                          height: 174,
                          fit: BoxFit.cover, // Cover the whole container
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 174,
                      width: 116,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFEDE6EE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "images/d5.png", // Use image from picture list
                          width: 116,
                          height: 174,
                          fit: BoxFit.cover, // Cover the whole container
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
