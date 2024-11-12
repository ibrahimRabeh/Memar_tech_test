// individuals_page.dart
import 'package:flutter/material.dart';
import 'profile_card.dart';
import 'package:memar_tech_test/bottomNav.dart';
import 'package:memar_tech_test/utils/colors.dart';

class IndividualsPage extends StatelessWidget {
  final List<Map<String, dynamic>> individuals = [
    {'name': 'احمد علي', 'rating': 4.7},
    {'name': 'خالد السعد', 'rating': 4.6},
    // Add more individuals as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColors,
      appBar: AppBar(
        title: const Text("الأفراد", style: TextStyle(color: Colors.black87)),
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
          children: individuals.map((individual) {
            return ProfileCard(
              name: individual['name'],
              rating: individual['rating'],
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavBar(index: 3),
    );
  }
}
