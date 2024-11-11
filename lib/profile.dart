// engineering_offices_page.dart
import 'package:flutter/material.dart';
import 'package:memar_tech_test/utils/colors.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex =0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      if(index == 3){
        Navigator.of(context).pushNamed('/home');
      }else if(index == 2){
        Navigator.of(context).pushNamed('/order');
      }else if(index == 1){
        Navigator.of(context).pushNamed('/chat');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColors,
      appBar: AppBar(backgroundColor: AppColors().backgroundColors,),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Layer1.png'), // Replace with your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Icon(Icons.account_circle_outlined,size: 85,),
            SizedBox(height: 13,),
            Text("محمد فلفلان",style: TextStyle(fontSize: 30),),
            SizedBox(height: 13,),
            Expanded(
              child: ListView(
                children: [
                  _buildListItem('الملف الشخصي',Colors.black),
                  _buildListItem('المواعيد',Colors.black),
                  _buildListItem('الاعدادات',Colors.black),
                  _buildListItem('خيارات الدفع',Colors.black),
                  _buildListItem('اتصل بنا',Colors.black),
                  _buildListItem('تسجيل خروج',Colors.red),

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

  Widget _buildListItem(String title,Color cols) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 13.0),
      padding: EdgeInsets.all(14.0),
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
              
            ],
          ),
          
                    SizedBox(width: 20,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: cols),
                  ),
                  
                  SizedBox(width: 25,),
                ],
              ),
              
            ],
          ),
          
        ],
      ),
    );
  }

  
}
