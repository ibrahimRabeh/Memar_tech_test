// home_page.dart
import 'package:flutter/material.dart';
import 'package:memar_tech_test/bottomNav.dart';
import 'package:memar_tech_test/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _currentIndex = 3;

  // List of items for the grid view to make it dynamic
  final List<Map<String, dynamic>> _gridItems = [
    {
      'icon': Icons.group,
      'label': 'Consultation',
      'route': '/appointments',
    },
    {
      'icon': Icons.note_add_outlined,
      'label': 'New Request',
      'route': '/createOrders',
    },
    {
      'icon': Icons.person,
      'label': 'Craftsmen',
      'route': '/IndividualsPage',
    },
    {
      'icon': Icons.business_outlined,
      'label': 'Architecture Firms',
      'route': '/_ArchitectureFirmsPageState',
    },
  ];

  final appBar = AppBar(
    backgroundColor: AppColors().backgroundColors,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.shopping_cart, color: Colors.black),
      onPressed: () {},
    ),
    title: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(90.0),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 13.0),
        ),
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.black),
      ),
    ),
    actions: const [
      SizedBox(width: 48), // Placeholder to balance the leading icon
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColors,
      appBar: appBar,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/Layer1.png'), // Replace with your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: _gridItems.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = _gridItems[index];
                return _buildGridItem(
                  item['icon'],
                  item['label'],
                  item['route'],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(index: _currentIndex),
    );
  }

  Widget _buildGridItem(IconData icon, String label, String route) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors().backgroundColors,
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.black),
            const SizedBox(height: 14.0),
            Text(
              label,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
