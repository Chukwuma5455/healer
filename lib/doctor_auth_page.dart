import 'package:flutter/material.dart';

class DoctorAuthPage extends StatelessWidget {
  const DoctorAuthPage({super.key});

  void _showDoctorLoginForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const DoctorLoginForm(),
    );
  }

  void _navigateToDoctorSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DoctorSignUpForm()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Portal'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome Doctor!', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showDoctorLoginForm(context),
              child: const Text('Doctor Login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(200, 50),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToDoctorSignUp(context),
              child: const Text('Doctor Sign Up'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: const Size(200, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorLoginForm extends StatelessWidget {
  const DoctorLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Doctor Login'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          TextField(decoration: InputDecoration(labelText: 'Email')),
          TextField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('✅ Doctor login successful (simulated)')),
            );
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}

class DoctorSignUpForm extends StatefulWidget {
  const DoctorSignUpForm({super.key});

  @override
  State<DoctorSignUpForm> createState() => _DoctorSignUpFormState();
}

class _DoctorSignUpFormState extends State<DoctorSignUpForm> {
  final _formKey = GlobalKey<FormState>();

  void _submitDoctorForm() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('✅ Registration Complete'),
          content: const Text('Your documents are submitted for verification (simulated).'),
        ),
      );

      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    }
  }

  Widget _simulatedUploadField(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Upload (Simulated)'),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctor Sign Up'), backgroundColor: Colors.purple),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text('Doctor Registration', style: TextStyle(fontSize: 18)),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) => value!.isEmpty ? 'Enter your name' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => value!.isEmpty ? 'Enter email' : null,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) => value!.length < 6 ? 'Minimum 6 characters' : null,
              ),
              const SizedBox(height: 20),
              _simulatedUploadField('Upload School Certificate'),
              _simulatedUploadField('Upload License'),
              _simulatedUploadField('Upload ID Card'),
              _simulatedUploadField('Face Verification (Simulated)'),
              ElevatedButton(
                onPressed: _submitDoctorForm,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: const Text('Submit Registration'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
