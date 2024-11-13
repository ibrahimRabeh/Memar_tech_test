import 'package:flutter/material.dart';
import 'package:memar_tech_test/utils/colors.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String name = args['name'] ?? 'Architecture Firm';
    final double rating = args['rating'] ?? 4.5;
    final String email = args['email'] ?? 'info@architecturefirm.com';
    final String phone = args['phone'] ?? '0538693873';
    final String description = args['description'] ??
        'This firm provides comprehensive engineering services and creative solutions for building and designing projects.';

    return Scaffold(
      backgroundColor: AppColors().backgroundColors,
      appBar: AppBar(
        title: const Text("Office Details",
            style: TextStyle(color: Colors.black87)),
        backgroundColor: AppColors().backgroundColors,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Layer1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors().backgroundColors,
                  border: Border.all(color: Colors.black87, width: 1.5),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.3,
                ),
                child: Column(
                  children: [
                    // Title, Email/Phone, Rating in structured layout
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name, Email, and Phone in one column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    email,
                                    style: TextStyle(
                                      color: Colors.black54.withOpacity(0.7),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    phone,
                                    style: TextStyle(
                                      color: Colors.black54.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Rating and Link to Rating Page
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.orange[600], size: 24),
                                const SizedBox(width: 4.0),
                                Text(
                                  "$rating",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/rating');
                              },
                              child: const Text(
                                "Rate",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Description Section
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/chatInterface');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                            ),
                            child: const Text(
                              "Chat",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/appointments');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                            ),
                            child: const Text(
                              "Book session",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Implement location navigation logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                            ),
                            child: const Text(
                              "Address",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
