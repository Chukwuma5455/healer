// ============================
// patient_ai_consultation.dart ✅ (Updated to navigate to PaymentScreen)
// ============================
import 'package:flutter/material.dart';
import 'package:healer/payment_screen.dart';

class PatientAIConsultation extends StatefulWidget {
  const PatientAIConsultation({super.key});

  @override
  State<PatientAIConsultation> createState() => _PatientAIConsultationState();
}

class _PatientAIConsultationState extends State<PatientAIConsultation> {
  final TextEditingController _symptomController = TextEditingController();
  String? matchedSpecialist;
  String? matchedDoctor;
  bool paymentDone = false;
  bool consultationStarted = false;

  final List<Map<String, String>> mockDoctors = [
    {'name': 'Dr. Heart', 'specialty': 'Cardiologist', 'location': 'USA'},
    {'name': 'Dr. Skin', 'specialty': 'Dermatologist', 'location': 'Canada'},
    {'name': 'Dr. Bones', 'specialty': 'Orthopedic', 'location': 'UK'},
    {'name': 'Dr. Mind', 'specialty': 'Psychiatrist', 'location': 'Germany'},
    {'name': 'Dr. Smith', 'specialty': 'Family Doctor', 'location': 'France'},
  ];

  String suggestSpecialist(String symptoms) {
    final lower = symptoms.toLowerCase();
    if (lower.contains('heart') || lower.contains('chest')) {
      return 'Cardiologist';
    } else if (lower.contains('skin') || lower.contains('rash')) {
      return 'Dermatologist';
    } else if (lower.contains('bone') || lower.contains('joint')) {
      return 'Orthopedic';
    } else if (lower.contains('sad') || lower.contains('depressed') || lower.contains('anxious')) {
      return 'Psychiatrist';
    } else {
      return 'Family Doctor';
    }
  }

  void findMockDoctor() {
    matchedDoctor = null;
    for (var doc in mockDoctors) {
      if (doc['specialty'] == matchedSpecialist) {
        matchedDoctor = doc['name'];
        break;
      }
    }
    setState(() {});
  }

  void _navigateToPayment() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PaymentScreen()),
    );
  }

  void startConsultation() {
    setState(() => consultationStarted = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Healer AI Consultation')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: consultationStarted
            ? const Center(
          child: Text('🔴 Live Video Consultation Room (Mock)',
              style: TextStyle(fontSize: 18)),
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Describe your symptoms:',
                style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            TextField(
              controller: _symptomController,
              maxLines: 4,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'e.g. I have chest pain and shortness of breath',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final text = _symptomController.text.trim();
                if (text.isEmpty) return;
                matchedSpecialist = suggestSpecialist(text);
                matchedDoctor = null;
                paymentDone = false;
                consultationStarted = false;
                findMockDoctor();
              },
              child: const Text('Analyze Symptoms'),
            ),
            if (matchedSpecialist != null) ...[
              const SizedBox(height: 20),
              Text('🔍 Suggested Specialist: $matchedSpecialist'),
            ],
            if (matchedDoctor != null && !paymentDone) ...[
              const SizedBox(height: 10),
              Text('👨‍⚕️ Available Doctor: $matchedDoctor'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _navigateToPayment,
                child: const Text('Pay Consultation Fee'),
              )
            ],
            if (paymentDone && !consultationStarted) ...[
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: startConsultation,
                child: const Text('Start Live Consultation'),
              )
            ]
          ],
        ),
      ),
    );
  }
}
