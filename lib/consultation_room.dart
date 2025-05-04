// ===============================
// consultation_room.dart ✅
// ===============================
import 'package:flutter/material.dart';

class ConsultationRoom extends StatelessWidget {
  final String doctorName;
  final String specialty;

  const ConsultationRoom({
    super.key,
    required this.doctorName,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultation Room'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.video_call, size: 100, color: Colors.teal),
            const SizedBox(height: 20),
            Text('Now connected with:', style: TextStyle(fontSize: 18)),
            Text(doctorName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('($specialty)', style: TextStyle(fontSize: 18, color: Colors.grey[700])),
            const SizedBox(height: 30),
            const Text('🔴 Live Video Consultation ',
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
