import 'package:flutter/material.dart';

class ServiceDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Safely cast the arguments passed from HomeScreen
    final Map<String, String> service =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    // Retrieve the description (which was added to home_screen.dart)
    final String description =
        service['description'] ?? "Service details not yet provided.";

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0,
        title: Text(
          service['title']!,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black), // Dark back button
      ),

      // Use SingleChildScrollView to prevent overflow on smaller screens
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Service Image/Icon ---
              Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(
                      0.1,
                    ), // Light background circle
                    shape: BoxShape.circle,
                  ),
                  // Use Padding to make the image smaller than the container
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(service['image']!, fit: BoxFit.contain),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // --- Price Tag ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Starting Price:",
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                  Text(
                    service['price']!,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                    ),
                  ),
                ],
              ),
              const Divider(height: 30),

              // --- Description Section ---
              const Text(
                "Service Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Use the unique description field here
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 50),

              // --- Book Now Button ---
              ElevatedButton(
                onPressed: () {
                  // This is the route triggered when "Book Now" is pressed
                  Navigator.pushNamed(context, '/booking', arguments: service);
                },
                child: const Text(
                  "Book Now",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
