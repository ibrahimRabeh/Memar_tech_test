import 'package:flutter/material.dart';

class RequestScreen extends StatefulWidget {
  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('انشاء طلب',style: TextStyle(fontSize: 35),),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Layer1.png'), // Replace with your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    _buildToggleButton("مكتب هندسي",false),
                    _buildToggleButton("مكتب هندسي",false)
                  ],
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'اختيار مزود الخدمة',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
                  ),
                  items: ['مزود 1', 'مزود 2', 'مزود 3']
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'رقم الصك الالكتروني',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'تفاصيل الطلب',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'العنوان',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'المرفقات',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(80)),
                    suffixIcon: Icon(Icons.attach_file),
                  ),
                ),
                SizedBox(height: 16.0),
                ListTile(
                  title: Text('فريق معمارتك الهندسي'),
                  trailing: Radio(
                    value: true,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('إرسال'),
                ),
              ],
            ),
          ),
        ),
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
}
