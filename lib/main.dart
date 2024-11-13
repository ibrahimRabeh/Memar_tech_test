import 'package:flutter/material.dart';
import 'package:memar_tech_test/ArchititureFirmsPage.dart';
import 'package:memar_tech_test/IndividualsPage.dart';
import 'package:memar_tech_test/appointments.dart';
import 'package:memar_tech_test/chats.dart';
import 'package:memar_tech_test/chatInterface.dart';
import 'package:memar_tech_test/createOrders.dart';
import 'package:memar_tech_test/details.dart';
import 'package:memar_tech_test/home_screen.dart';
import 'package:memar_tech_test/orders.dart';
import 'package:memar_tech_test/profile.dart';
import 'package:memar_tech_test/splash_screen.dart';
import 'package:memar_tech_test/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppColors().backgroundColors),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/order': (context) => OrdersPage(),
        '/chat': (context) => ChatPage(),
        '/profile': (context) => ProfilePage(),
        '/chatInterface': (context) => ChatInterface(),
        '/appointments': (context) => AppointmentsPage(),
        '/_ArchitectureFirmsPageState': (context) => ArchitectureFirmsPage(),
        '/IndividualsPage': (context) => IndividualsPage(),
        '/details': (context) => DetailsPage(),
        '/createOrders': (context) => RequestScreen(),
      },
    );
  }
}
