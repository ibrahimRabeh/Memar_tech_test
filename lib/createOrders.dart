import 'package:flutter/material.dart';
import 'package:memar_tech_test/utils/colors.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  bool isFirmSelected = false;
  bool IsRoshanSelected = false;
  bool isDesignersSelected = false;
  bool isEntireBuildingSelected = true;
  bool isBuildingSelected = true;
  String? selectedProvider;
  final TextEditingController electronicNumberController =
      TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController attachmentsController = TextEditingController();
  bool includeMemartechTeam = false;

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColors,
      appBar: AppBar(
        backgroundColor: AppColors().backgroundColors,
        leading: const BackButton(),
        title: const Text(
          'Create order',
          style: TextStyle(fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            // Toggle options for "Architecture Firms" and "Individuals"
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 115.0,
                    child:
                        _buildToggleButton("Designer", isDesignersSelected, () {
                      setState(() {
                        isDesignersSelected = true;
                        isFirmSelected = false;
                        IsRoshanSelected = false;
                      });
                    }),
                  ),
                  SizedBox(
                    width: 115.0,
                    child: _buildToggleButton(
                        "Architecture Firm", isFirmSelected, () {
                      setState(() {
                        isFirmSelected = true;
                        IsRoshanSelected = false;
                        isDesignersSelected = false;
                      });
                    }),
                  ),
                  SizedBox(
                    width: 115.0,
                    child: _buildToggleButton(
                        "Roshan Provider", IsRoshanSelected, () {
                      setState(() {
                        IsRoshanSelected = true;
                        isFirmSelected = false;
                        isDesignersSelected = false;
                      });
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // Design Type Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 345,
                  child: _buildToggleButton(
                      "Interior design", !isEntireBuildingSelected, () {
                    setState(() => isEntireBuildingSelected = false);
                  }),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Building Type Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 172.5, // Specify the width here
                  child: _buildToggleButton("Room", isBuildingSelected, () {
                    setState(() => isBuildingSelected = true);
                  }),
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  width: 172.5, // Specify the width here
                  child:
                      _buildToggleButton("Apartment", !isBuildingSelected, () {
                    setState(() => isBuildingSelected = false);
                  }),
                ),
                const SizedBox(height: 8.0),
              ],
            ),
            const SizedBox(height: 16.0),

            // Service Provider Selection

            // Electronic Number Field

            // Details Text Box
            TextFormField(
              controller: detailsController,
              decoration: InputDecoration(
                labelText: 'Order details',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16.0),

            // Address Field
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Attachments Field
            TextFormField(
              controller: attachmentsController,
              decoration: InputDecoration(
                labelText: 'Folders',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: const Icon(Icons.attach_file),
              ),
            ),
            const SizedBox(height: 16.0),

            // Include Memartech Engineering Team Toggle
            ListTile(
              title: const Text('Include Memartech Engineering Team'),
              trailing: Switch(
                value: includeMemartechTeam,
                onChanged: (value) =>
                    setState(() => includeMemartechTeam = value),
              ),
            ),
            const SizedBox(height: 16.0),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Handle form submission
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                backgroundColor: Colors.black87,
              ),
              child: const Text('Submit',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(
      String label, bool isSelected, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black87 : Colors.transparent,
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(color: Colors.black87),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
