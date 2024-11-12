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
      'time': '8:00 pm',
      'title': 'احمد علي',
      'isBusiness': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColors,
      appBar: AppBar(
        backgroundColor: AppColors().backgroundColors,
        title: const Text('المواعيد',
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(index: _currentIndex),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1C1C1C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text('الغاء الموعد',
                    style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD2D6D2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text('تعديل الموعد',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
