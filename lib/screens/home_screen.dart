import 'package:flutter/material.dart';
import '../widgets/service_card.dart';

class HomeScreen extends StatelessWidget {
  // --- UPDATED SERVICE LIST WITH UNIQUE DESCRIPTIONS ---
  final List<Map<String, String>> services = [
    {
      "title": "Cleaning",
      "image": "assets/cleaning.png",
      "price": "\$30",
      "description":
          "Thorough home cleaning service covering floors, kitchen, bathrooms, and dusting. Book our top-rated professionals for a sparkling clean space. We offer deep cleaning, standard cleaning, and move-in/move-out options.",
    },
    {
      "title": "Plumber",
      "image": "assets/plumber.png",
      "price": "\$50",
      "description":
          "Expert plumbing services for leak repairs, drain unclogging, fixture installation, and emergency pipe work. Fast, reliable, and guaranteed. Available 24/7 for urgent calls.",
    },
    {
      "title": "Electrician",
      "image": "assets/electrician.png",
      "price": "\$40",
      "description":
          "Certified electricians for wiring, fuse box repairs, light installations, and solving all your home electrical issues safely and efficiently. We specialize in smart home integration and safety audits.",
    },
    {
      "title": "Carpenter",
      "image": "assets/carpenter.png",
      "price": "\$60",
      "description":
          "Professional carpentry services for custom furniture, cabinet repair, door installation, and general wood maintenance for your home. Quality craftsmanship guaranteed for all projects, big or small.",
    },
  ];
  // --- END UPDATED SERVICE LIST ---

  @override
  Widget build(BuildContext context) {
    const double maxContentWidth = 500.0;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        title: const Text(
          "Home Services",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: maxContentWidth),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Text(
                  "Which service do you need?",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 25),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  itemCount: services.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    final service = services[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/service-detail',
                          arguments: service,
                        );
                      },
                      child: ServiceCard(
                        title: service['title']!,
                        image: service['image']!,
                        price: service['price']!,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
