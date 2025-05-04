// ====================
// payment_receipt_screen.dart (Mock Payment Receipt) ✅ FIXED
// ====================
import 'package:flutter/material.dart';

class PaymentReceiptScreen extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String consultationFee;

  const PaymentReceiptScreen({
    super.key,
    this.doctorName = 'Dr. Jane Smith',
    this.specialty = 'Cardiologist',
    this.consultationFee = '\$50.00',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Receipt'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 80),
            const SizedBox(height: 20),
            const Text(
              'Payment Successful!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 30),
            Text('Doctor: $doctorName', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Specialty: $specialty', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Consultation Fee: $consultationFee', style: const TextStyle(fontSize: 18)),
            const Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to Home'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
