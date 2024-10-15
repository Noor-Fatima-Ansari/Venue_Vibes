import 'package:flutter/material.dart';

class Specify {
  Widget buildCardList(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 90,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Picture',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
