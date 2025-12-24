import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // Mock data for the current month's calendar (October 2025)
  final List<Map<String, dynamic>> calendarDays = [
    {'day': 1, 'weekday': 'Fri', 'is_active': true},
    {'day': 2, 'weekday': 'Sat', 'is_active': true},
    {'day': 3, 'weekday': 'Sun', 'is_active': true},
    {'day': 4, 'weekday': 'Mon', 'is_active': true},
    {'day': 5, 'weekday': 'Tue', 'is_active': true},
    {'day': 6, 'weekday': 'Wed', 'is_active': true},
    {'day': 7, 'weekday': 'Thu', 'is_active': true},
  ];

  // Mock time slots
  final List<String> timeSlots = [
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
  ];

  // Mock additional services (Extras)
  final List<Map<String, dynamic>> additionalServices = [
    {'name': 'Washing', 'price': '+10\$', 'icon': Icons.local_laundry_service},
    {'name': 'Fridge', 'price': '+8\$', 'icon': Icons.kitchen},
    {'name': 'Oven', 'price': '+8\$', 'icon': Icons.microwave},
    {'name': 'Windows', 'price': '+15\$', 'icon': Icons.window},
  ];

  // State variables for user selections
  int selectedDay = 2; // Defaults to Sat
  String selectedTime = '13:30';
  List<String> selectedExtras = [];

  // Widgets for the interactive calendar day buttons
  Widget _buildCalendarDay(Map<String, dynamic> dayData) {
    bool isSelected = dayData['day'] == selectedDay;
    Color primaryColor = const Color(0xFF1976D2);
    Color buttonColor = isSelected ? primaryColor : Colors.white;
    Color textColor = isSelected ? Colors.white : Colors.black;

    return GestureDetector(
      onTap:
          dayData['is_active']
              ? () {
                setState(() {
                  selectedDay = dayData['day'];
                });
              }
              : null,
      child: Container(
        width: 50,
        height: 60,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: dayData['is_active'] ? buttonColor : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: dayData['is_active'] ? primaryColor : Colors.grey.shade300,
            width: isSelected ? 0 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dayData['weekday'] as String,
              style: TextStyle(fontSize: 12, color: textColor),
            ),
            const SizedBox(height: 4),
            Text(
              '${dayData['day']}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widgets for the interactive time slot buttons
  Widget _buildTimeSlot(String time) {
    bool isSelected = time == selectedTime;
    Color primaryColor = const Color(0xFF1976D2);
    Color color = isSelected ? primaryColor.withOpacity(0.1) : Colors.white;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = time;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? primaryColor : Colors.grey.shade800,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // Widgets for the additional service cards
  Widget _buildAdditionalServiceCard(Map<String, dynamic> service) {
    bool isSelected = selectedExtras.contains(service['name']);
    Color primaryColor = const Color(0xFF1976D2);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedExtras.remove(service['name']);
          } else {
            selectedExtras.add(service['name']);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? primaryColor.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(service['icon'] as IconData, size: 30, color: primaryColor),
              const SizedBox(height: 5),
              Text(
                service['name'] as String,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                service['price'] as String,
                style: TextStyle(fontSize: 11, color: Colors.green.shade600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String>? service =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final String serviceTitle = service?['title'] ?? 'Service';

    return Scaffold(
      appBar: AppBar(title: Text("Book $serviceTitle"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. Date Selection ---
              const Text(
                "Select Date",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "October 2025",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: calendarDays.map(_buildCalendarDay).toList(),
                ),
              ),
              const Divider(height: 40),

              // --- 2. Time Slots Selection ---
              const Text(
                "Select Time Slot",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: timeSlots.map(_buildTimeSlot).toList(),
              ),
              const Divider(height: 40),

              // --- 3. Additional Services (Extras) ---
              const Text(
                "Add Extra Services",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: additionalServices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7, // Adjusted ratio for better fit
                ),
                itemBuilder: (context, index) {
                  return _buildAdditionalServiceCard(additionalServices[index]);
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            // Display a confirmation message with the selected data
            String extras =
                selectedExtras.isEmpty ? 'None' : selectedExtras.join(', ');
            String message =
                "Booking confirmed for $serviceTitle on Oct $selectedDay at $selectedTime. Extras: $extras.";

            // Show confirmation using SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                duration: const Duration(seconds: 4),
                behavior: SnackBarBehavior.floating,
              ),
            );

            // Optionally navigate back after confirmation
            // Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF1976D2),
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: const Text(
            'Confirm Booking',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
