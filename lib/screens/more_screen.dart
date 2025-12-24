import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  // Helper widget for categorized menu items
  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0, // Keep cards flat for a cleaner list look
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF1976D2)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      ),
    );
  }

  // Helper for section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("More"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. Preferences Section ---
            _buildSectionTitle("Preferences"),
            _buildMenuItem(Icons.language, "Change Language", () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Open Language Settings')),
              );
            }),
            _buildMenuItem(
              Icons.notifications_none,
              "Notification Settings",
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Open Notification Settings')),
                );
              },
            ),
            _buildMenuItem(Icons.map_outlined, "Service Locations", () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('View Service Areas')),
              );
            }),

            // --- 2. Support Section ---
            _buildSectionTitle("Support & Help"),
            _buildMenuItem(Icons.help_outline, "FAQ / Help Center", () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Open Help Center')));
            }),
            _buildMenuItem(Icons.mail_outline, "Contact Us", () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Open Contact Form')),
              );
            }),
            _buildMenuItem(Icons.comment_outlined, "Give Feedback", () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Open Feedback Form')),
              );
            }),

            // --- 3. Legal & Info Section ---
            _buildSectionTitle("Legal & Info"),
            _buildMenuItem(Icons.policy_outlined, "Privacy Policy", () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('View Privacy Policy')),
              );
            }),
            _buildMenuItem(Icons.description_outlined, "Terms of Service", () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('View Terms of Service')),
              );
            }),
            _buildMenuItem(Icons.info_outline, "About App", () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('View App Version')));
            }),
          ],
        ),
      ),
    );
  }
}
