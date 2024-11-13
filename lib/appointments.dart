// appointments_page.dart
import 'package:flutter/material.dart';
import 'package:memar_tech_test/bottomNav.dart';
import 'package:memar_tech_test/utils/colors.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  final int _currentIndex = 1;

  final List<Map<String, dynamic>> appointments = [
    {
      'date': '2024-6-24',
      'time': '8:00 pm',
      'title': 'التحالف الهندسي',
      'isBusiness': true
    },
    {
      'date': '2024-6-24',
      'time': '10:00 pm',
      'title': 'احمد علي',
      'isBusiness': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors().backgroundColors,
        appBar: AppBar(
          backgroundColor: AppColors().backgroundColors,
          title: const Text('Appointments',
              style: TextStyle(color: Colors.black, fontSize: 24)),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/Layer1.png'), // Replace with your background image
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              _buildStatusBar(),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: appointments.length,
                  itemBuilder: (context, index) {
                    final appointment = appointments[index];
                    return _buildAppointmentCard(
                        appointment['date']!,
                        appointment['time']!,
                        appointment['title']!,
                        appointment['isBusiness']!);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  elevation: 6, // Adds a shadow for depth
                  shadowColor:
                      Colors.grey.withOpacity(0.3), // Subtle shadow color
                ),
                child: const Text(
                  'Make an Appointment',
                  style: TextStyle(
                    color: Color(0xFFD2D6D2),
                    fontSize: 20,
                    fontWeight: FontWeight.bold, // Makes text bolder
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(index: _currentIndex),
      ),
    );
  }

  Widget _buildStatusBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
    );
  }

  Widget _buildAppointmentCard(
      String date, String time, String title, bool isBusiness) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(date,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14)),
                  const SizedBox(height: 4.0),
                  Text(time,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 14)),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: AppColors().backgroundColors,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                  isBusiness
                      ? Icon(Icons.business, color: Colors.white, size: 30)
                      : Icon(Icons.person, color: Colors.white, size: 30),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // remove this appointment from the list
                  setState(() {
                    appointments
                        .removeWhere((element) => element['title'] == title);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1C1C1C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child:
                    const Text('cancel', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD2D6D2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text('reschedule',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
