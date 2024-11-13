// engineering_offices_page.dart
import 'package:flutter/material.dart';
import 'package:memar_tech_test/bottomNav.dart';
import 'package:memar_tech_test/utils/colors.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors().backgroundColors,
        appBar: AppBar(
          backgroundColor: AppColors().backgroundColors,
        ),
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildToggleButton('Designers', false),
                  const SizedBox(width: 16.0),
                  _buildToggleButton('Architect Firms', true),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    _buildListItem(
                        'التحالف الهندسي', 'Request: Design room', 'Approve'),
                    _buildListItem('اعمار للاستشارات الهندسية',
                        'Request: Design room', 'Under study'),
                    _buildListItem(
                        'ALC Engineering', 'Request: Design room', 'modifying'),
                    _buildListItem('إحجاز للاستشارات الهندسية',
                        'Request: Design apartment', 'Active'),
                    _buildListItem('رحله البناء الهندسي',
                        'Request: Design apartment', 'Done'),
                    _buildListItem('الأوج للاستشارات الهندسية',
                        'Request: Design room', 'cancelled'),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(index: _currentIndex));
  }

  Widget _buildToggleButton(String label, bool isSelected) {
    return Expanded(
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(String title, String subtitle, String status) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 13.0),
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: AppColors().backgroundColors,
        borderRadius: BorderRadius.circular(60.0),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.arrow_back_ios_new),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: statusColor(status),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  status,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                ],
              ),
              const SizedBox(height: 3.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color statusColor(String status) {
    switch (status) {
      case 'اعتماد الطلب':
        return Colors.black;
      case 'قيد الدراسة':
        return Colors.black;
      case 'قيد التعديل':
        return Colors.black;
      case 'نشط':
        return Colors.black;
      case 'تمت':
        return Colors.black;
      case 'ملغاة':
        return Colors.black;
      default:
        return Colors.black;
    }
  }
}
