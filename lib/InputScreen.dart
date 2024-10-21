import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:venue_vibes/Specify.dart';
import 'package:venue_vibes/output.dart';

class InputScreen extends StatefulWidget {
  final Function(int) onNavigate; // Add this line

  InputScreen({required this.onNavigate});

  @override
  createState() => _FoodEstimationScreenState();
}

class _FoodEstimationScreenState extends State<InputScreen> {
  TextEditingController budgetController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController maleController = TextEditingController();
  TextEditingController femaleController = TextEditingController();
  TextEditingController kidsController = TextEditingController();
  int budget = 0;

  List<String> Cpics = [
    "images/indian.png",
    "images/italian.png",
    "images/pakistani.png",
    "images/arabian.png"
  ];
  List<String> Ctitle = [
    "Indian Cuisine",
    "Italian Cuisine",
    "Pakistani Cuisine",
    "Arabian Cuisine"
  ];
  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    final CollectionReference reference = FirebaseFirestore.instance
        .collection("User Data")
        .doc(uid)
        .collection("Profile Data");

    Specify specify = Specify();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  "Food Estimation",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Cuisine section with ListView.builder
              specify.buildCardListCuisine("Choose  Cuisine", Cpics, Ctitle),
              const SizedBox(height: 20),

              const Text(
                "Budget",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: budgetController,
                          decoration: InputDecoration(
                            hintText: "Enter your budget for Food",
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
                          // Add set budget logic
                          budget = budgetController.text as int;
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Set Budget"),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // People input section
              const Text(
                "People",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: totalController,
                        decoration: InputDecoration(
                          hintText: "Enter Total Number of People",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 9),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: maleController,
                              decoration: InputDecoration(
                                hintText: "Number of Males",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              controller: femaleController,
                              decoration: InputDecoration(
                                hintText: "Number of Females",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextFormField(
                              controller: kidsController,
                              decoration: InputDecoration(
                                hintText: "Number of Kids",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    reference.add({
                      "Cuisine Type": specify.cuisineType,
                      "Total People": totalController.text,
                      "No of Males": maleController.text,
                      "No of Females": femaleController.text,
                      "No of Kids": kidsController.text,
                      "Cuisine Budget": budgetController.text,
                    }).then((_) => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OutputScreen())));

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => OutputScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Generate"),
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
