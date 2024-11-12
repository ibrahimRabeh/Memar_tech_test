// architecture_firms_page.dart
import 'package:flutter/material.dart';
import 'profile_card.dart';
import 'package:memar_tech_test/bottomNav.dart';
import 'package:memar_tech_test/utils/colors.dart';

class ArchitectureFirmsPage extends StatelessWidget {
  final List<Map<String, dynamic>> firms = [
    {'name': 'التحالف الهندسي', 'rating': 4.7, 'distance': '2.1 km'},
    {'name': 'اعمار للاستشارات', 'rating': 4.8, 'distance': '3.5 km'},
    {'name': 'التحالف الهندسي', 'rating': 4.7, 'distance': '2.1 km'},
    {'name': 'اعمار للاستشارات', 'rating': 4.8, 'distance': '3.5 km'},
    {'name': 'التحالف الهندسي', 'rating': 4.7, 'distance': '2.1 km'},
    {'name': 'اعمار للاستشارات', 'rating': 4.8, 'distance': '3.5 km'},
    {'name': 'التحالف الهندسي', 'rating': 4.7, 'distance': '2.1 km'},
    {'name': 'اعمار للاستشارات', 'rating': 4.8, 'distance': '3.5 km'},
    // Add more firms as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColors,
      appBar: AppBar(
        title:
            const Text("مكاتب هندسية", style: TextStyle(color: Colors.black87)),
        backgroundColor: AppColors().backgroundColors,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/Layer1.png'), // Replace with your background image
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: firms.map((firm) {
            return ProfileCard(
              name: firm['name'],
              rating: firm['rating'],
              distance: firm['distance'],
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavBar(index: 2),
    );
  }
}
