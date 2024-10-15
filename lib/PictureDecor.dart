import 'package:flutter/material.dart';
import 'package:venue_vibes/Specify.dart';

class PictureDecor extends StatefulWidget {
  final Function(int) onNavigate;
  const PictureDecor({super.key, required this.onNavigate});

  @override
  State<PictureDecor> createState() => _PictureDecorState();
}

class _PictureDecorState extends State<PictureDecor> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.all(16.0), // Increased padding for aesthetics
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Stretched to fill the width
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
              const SizedBox(height: 20), // Consistent spacing
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
              const SizedBox(height: 20), // Consistent spacing
              Specify().buildCardList("Choose Area"),
              const SizedBox(height: 20), // Consistent spacing
              Specify().buildCardList("Event Type"),
              const SizedBox(height: 20), // Consistent spacing
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
                    const SizedBox(height: 20), // Consistent spacing
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
              const SizedBox(height: 20), // Consistent spacing
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
              const SizedBox(height: 20), // Consistent spacing
            ],
          ),
        ),
      ),
    );
  }
}

// class PictureDecor extends StatefulWidget {
//   const PictureDecor({super.key, required this.onNavigate});

//   @override
//   State<PictureDecor> createState() => _PictureDecorState();
// }

// class _PictureDecorState extends State<PictureDecor> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const Center(
//                 child: Text(
//                   "Venue Vibes",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.orangeAccent,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Budget",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               Container(
//                 height: 150,
//                 decoration: BoxDecoration(
//                   color: Colors.purple[50],
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: "Enter your budget for Place",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           keyboardType: TextInputType.number,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Add set budget logic
//                         },
//                         style: ElevatedButton.styleFrom(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 16, horizontal: 24),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: const Text("Set Budget"),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: const Text("Switch to Food Estimation"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
