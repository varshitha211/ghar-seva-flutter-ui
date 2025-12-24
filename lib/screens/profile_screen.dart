import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Mock User Data (The Booker)
  final String userName = "Alex Johnson";
  final String userEmail = "alex.j@booker.com";
  final String profileImageUrl =
      "https://i.pravatar.cc/150?img=1"; // Mock user image

  // Mock Recommended Worker Data
  final List<Map<String, dynamic>> recommendedWorkers = [
    {
      'name': 'Isabel Kirkland',
      'role': 'Expert Cleaner',
      'rating': 4.9,
      'image': 'https://i.pravatar.cc/150?img=47',
    },
    {
      'name': 'Alfredo Schafer',
      'role': 'Certified Plumber',
      'rating': 4.8,
      'image': 'https://i.pravatar.cc/150?img=50',
    },
    {
      'name': 'Sarah Chen',
      'role': 'Master Electrician',
      'rating': 4.7,
      'image': 'https://i.pravatar.cc/150?img=33',
    },
  ];

  // Helper widget for user account menu items
  Widget _buildProfileMenuItem(
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 1,
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1976D2)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
    );
  }

  // NEW: Helper widget to display a recommended worker
  Widget _buildWorkerCard(Map<String, dynamic> worker) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(worker['image'] as String),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    worker['name'] as String,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    worker['role'] as String,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(
                      '${worker['rating']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                ElevatedButton(
                  onPressed: () {
                    // Action to view the worker's full profile
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Viewing profile for ${worker['name']}'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF1976D2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    minimumSize:
                        Size.zero, // Allows button to size based on padding
                  ),
                  child: const Text('Book Now', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile & Bookings"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. USER Profile Card ---
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(profileImageUrl),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          userEmail,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Color(0xFF1976D2)),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Edit Personal Info')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // --- 2. Account Settings Section ---
            const Text(
              "My Activity & Settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildProfileMenuItem(Icons.history, "Booking History", () {}),
            _buildProfileMenuItem(Icons.payment, "Payment Methods", () {}),
            _buildProfileMenuItem(
              Icons.location_on_outlined,
              "Manage Addresses",
              () {},
            ),
            _buildProfileMenuItem(
              Icons.settings,
              "General App Settings",
              () {},
            ),
            _buildProfileMenuItem(Icons.logout, "Log Out", () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Logging out...')));
            }),

            const SizedBox(height: 30),

            // --- 3. Recommended Workers Section (The part you wanted to add) ---
            const Text(
              "Recommended Workers",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...recommendedWorkers.map(_buildWorkerCard).toList(),
          ],
        ),
      ),
    );
  }
}
