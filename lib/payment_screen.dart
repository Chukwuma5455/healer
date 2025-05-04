// ===============================
// payment_screen.dart - Mock Payment UI ✅ (Auto-Navigate)
// ===============================
import 'package:flutter/material.dart';
import 'consultation_room.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameOnCardController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  final String doctorName = 'Dr. Jane Smith';
  final String specialty = 'Cardiologist';
  final String consultationFee = '\$50.00';

  void _processPayment() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context);

        // Show a quick SnackBar for visual feedback (optional)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Payment Successful'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ConsultationRoom(
                doctorName: doctorName,
                specialty: specialty,
              ),
            ),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation Payment'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameOnCardController,
                decoration: const InputDecoration(labelText: 'Name on Card'),
                validator: (value) => value!.isEmpty ? 'Enter name on card' : null,
              ),
              TextFormField(
                controller: _cardNumberController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Card Number'),
                validator: (value) => value!.isEmpty ? 'Enter card number' : null,
              ),
              TextFormField(
                controller: _expiryController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Expiry Date (MM/YY)'),
                validator: (value) => value!.isEmpty ? 'Enter expiry date' : null,
              ),
              TextFormField(
                controller: _cvvController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'CVV'),
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Enter CVV' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _processPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Pay Consultation Fee'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
