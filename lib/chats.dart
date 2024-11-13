// engineering_offices_page.dart
import 'package:flutter/material.dart';
import 'package:memar_tech_test/bottomNav.dart';
import 'package:memar_tech_test/utils/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _currentIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 3) {
        Navigator.of(context).pushNamed('/home');
      } else if (index == 2) {
        Navigator.of(context).pushNamed('/order');
      } else if (index == 0) {
        Navigator.of(context).pushNamed('/profile');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColors,
      appBar: AppBar(
        backgroundColor: AppColors().backgroundColors,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
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
                _buildToggleButton('حرفيين', false),
                SizedBox(width: 16.0),
                _buildToggleButton('مكاتب هندسية', true),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildListItem('التحالف الهندسي', 'طلب: تصميم عمارة', 5),
                  _buildListItem('اعمار للاستشارات الهندسية',
                      'طلب: تصميم حديقة خارجية', 9),
                  _buildListItem('اعمار للاستشارات الهندسية',
                      'طلب: تصميم حديقة خارجية', null),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors().backgroundColors,
        items: [
          BottomNavigationBarItem(
            backgroundColor: AppColors().backgroundColors,
            icon: Icon(Icons.account_circle_outlined),
            label: 'الحساب',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors().backgroundColors,
            icon: Icon(Icons.message_outlined),
            label: 'المحادثات',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors().backgroundColors,
            icon: Icon(Icons.receipt_outlined),
            label: 'الطلبات',
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors().backgroundColors,
            icon: const Icon(Icons.home_filled),
            label: 'الرئيسية',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
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

  Widget _buildListItem(String title, String subtitle, int? num) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 13.0),
      padding: EdgeInsets.all(6.0),
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
              Icon(Icons.arrow_back_ios_new),
              if (num != null)
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "$num",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
          SizedBox(
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                ],
              ),
              SizedBox(height: 3.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
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
}
