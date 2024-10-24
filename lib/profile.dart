import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final Function(int) onNavigate;
  const Profile({super.key, required this.onNavigate});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // List of images to be used for the background of each profile card
  List<String> images = [
    "images/d1.png",
    "images/d2.png",
    "images/d3.png",
    "images/d4.png",
    "images/d5.png"
  ];

  @override
  Widget build(BuildContext context) {
    // Get the user ID from FirebaseAuth
    final uid = FirebaseAuth.instance.currentUser?.uid;
    // Firestore reference to the profile data
    final CollectionReference reference = FirebaseFirestore.instance
        .collection("User Data")
        .doc(uid)
        .collection("Profile Data");

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: reference.snapshots(),
              builder: (context, snapshot) {
                // Handle the loading state
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Handle error state
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                // Handle empty data state
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No profile data available"));
                }

                // Data is available, show the profile list
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var userData = snapshot.data!.docs[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            // Background image for the card
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                images[index % images.length],
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Semi-transparent overlay for text readability
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.black.withOpacity(0.4),
                              ),
                            ),
                            // Profile info at the bottom
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Cuisine Type
                                    Text(
                                      userData["Cuisine Type"] ??
                                          "Unknown Cuisine",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        // Budget
                                        Expanded(
                                          child: Text(
                                            "Budget: ${userData["Cuisine Budget"] ?? 'N/A'}",
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        // Info button to display more details
                                        IconButton(
                                          icon: const Icon(
                                            Icons.info_outline,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            // Show details dialog
                                            _showEventDetailsDialog(
                                                context, userData);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Method to show a dialog with event details
  void _showEventDetailsDialog(BuildContext context, dynamic userData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Event Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow(
                  "Total People", userData["Total People"] ?? "N/A"),
              _buildDetailRow("No of Males", userData["No of Males"] ?? "N/A"),
              _buildDetailRow(
                  "No of Females", userData["No of Females"] ?? "N/A"),
              _buildDetailRow("No of Kids", userData["No of Kids"] ?? "N/A"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // Method to build a row displaying event details
  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Text(value),
      ],
    );
  }
}
