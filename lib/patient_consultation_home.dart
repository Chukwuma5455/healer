import 'package:flutter/material.dart';

class PatientConsultationHome extends StatelessWidget {
  const PatientConsultationHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation Home'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Consultation Page!',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic to navigate to booking or chat page
              },
              child: const Text('Start Consultation'),
            ),
          ],
        ),
      ),
    );
  }
}
