// chat_interface.dart
import 'package:flutter/material.dart';
import 'package:memar_tech_test/bottomNav.dart';
import 'package:memar_tech_test/utils/colors.dart';

class ChatInterface extends StatefulWidget {
  const ChatInterface({super.key});

  @override
  _ChatInterfaceState createState() => _ChatInterfaceState();
}

class _ChatInterfaceState extends State<ChatInterface> {
  final int _currentIndex = 1;
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'content': 'صوره او فيديو', 'isUser': false, 'ismessage': false},
    {'content': 'الصك الالكتروني.PDF', 'isUser': false, 'ismessage': false},
    {'content': 'هذه نسخه من الصك', 'isUser': false},
    {'content': 'نموذج مبدئي.PDF', 'isUser': true, 'ismessage': false},
    {'content': 'هذه نسخه من الملف', 'isUser': true},
    {'content': 'شكرا لك', 'isUser': false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColors,
      appBar: AppBar(
        backgroundColor: AppColors().backgroundColors,
        title: const Text('التحالف الهندسي',
            style: TextStyle(color: Colors.black)),
        centerTitle: true,
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
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return _buildMessage(message['content'], message['isUser'],
                      message['ismessage'] ?? true);
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: _buildInputBar(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(index: _currentIndex),
    );
  }

  Widget _buildMessage(String content, bool isUser, bool ismessage) {
    final alignment = isUser ? MainAxisAlignment.end : MainAxisAlignment.start;
    final backgroundColor =
        isUser ? Colors.black : AppColors().backgroundColors;
    final textColor =
        isUser ? Colors.white : const Color.fromARGB(180, 0, 0, 0);
    final padding = ismessage
        ? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0)
        : const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0);

    return Row(
      mainAxisAlignment: alignment,
      children: [
        Container(
          padding: padding,
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: textColor),
          ),
          child: Text(
            content,
            style: TextStyle(
              color: textColor,
              fontSize: 16.0,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              ),
              onSubmitted: (value) => _sendMessage(), // Send message on "Enter"
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.black),
            onPressed: _sendMessage, // Send message on button press
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final messageText = _controller.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        _messages.add({'content': messageText, 'isUser': true});
      });
      _controller.clear(); // Clear the text field
    }
  }
}
