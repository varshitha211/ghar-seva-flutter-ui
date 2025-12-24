import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String image;
  final String price;

  ServiceCard({required this.title, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      // Added shape for cleaner corners, matching modern UI
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      // Removed vertical margin here, let the GridView handle spacing
      margin: EdgeInsets.zero,

      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          // Align content to the center horizontally within the card
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Ensure image fits and is visually prominent
            Image.asset(
              image,
              // Set a reasonable size. Using BoxFit.contain is crucial for safety.
              width: 70,
              height: 70,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10), // Spacing between image and title
            // Service Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              // Use softWrap to allow text to wrap if the title is long
              softWrap: true,
              overflow: TextOverflow.ellipsis, // Prevents text overflow
              maxLines: 1,
            ),
            const SizedBox(height: 4), // Small spacing to price
            // Service Price/Starting Rate
            Text(
              'Starting from $price',
              style: TextStyle(
                color: Colors.blue[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
