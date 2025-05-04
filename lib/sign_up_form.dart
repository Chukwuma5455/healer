// ====================
// sign_up_form.dart (with validation, success dialog, and navigation to consultation) ✅
// ====================

import 'package:flutter/material.dart';
import 'patient_consultation_home.dart';

class SignUpForm extends StatefulWidget {
  final String title;
  const SignUpForm({super.key, required this.title});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  String? selectedCountry;
  String? selectedResidenceCountry;
  String? selectedSex;

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final List<String> countries = [
    'Afghanistan', 'Albania', 'Algeria', 'Andorra', 'Angola', 'Argentina', 'Armenia', 'Australia',
    'Austria', 'Azerbaijan', 'Bahamas', 'Bahrain', 'Bangladesh', 'Barbados', 'Belarus', 'Belgium',
    'Belize', 'Benin', 'Bhutan', 'Bolivia', 'Bosnia and Herzegovina', 'Botswana', 'Brazil', 'Brunei',
    'Bulgaria', 'Burkina Faso', 'Burundi', 'Cambodia', 'Cameroon', 'Canada', 'Cape Verde', 'Chad',
    'Chile', 'China', 'Colombia', 'Comoros', 'Congo', 'Costa Rica', 'Croatia', 'Cuba', 'Cyprus',
    'Czech Republic', 'Denmark', 'Djibouti', 'Dominica', 'Dominican Republic', 'Ecuador', 'Egypt',
    'El Salvador', 'Estonia', 'Ethiopia', 'Fiji', 'Finland', 'France', 'Gabon', 'Gambia', 'Georgia',
    'Germany', 'Ghana', 'Greece', 'Grenada', 'Guatemala', 'Guinea', 'Guyana', 'Haiti', 'Honduras',
    'Hungary', 'Iceland', 'India', 'Indonesia', 'Iran', 'Iraq', 'Ireland', 'Israel', 'Italy', 'Jamaica',
    'Japan', 'Jordan', 'Kazakhstan', 'Kenya', 'Kiribati', 'Kuwait', 'Kyrgyzstan', 'Laos', 'Latvia',
    'Lebanon', 'Lesotho', 'Liberia', 'Libya', 'Lithuania', 'Luxembourg', 'Madagascar', 'Malawi',
    'Malaysia', 'Maldives', 'Mali', 'Malta', 'Marshall Islands', 'Mauritania', 'Mauritius', 'Mexico',
    'Micronesia', 'Moldova', 'Monaco', 'Mongolia', 'Montenegro', 'Morocco', 'Mozambique', 'Myanmar',
    'Namibia', 'Nauru', 'Nepal', 'Netherlands', 'New Zealand', 'Nicaragua', 'Niger', 'Nigeria',
    'North Macedonia', 'Norway', 'Oman', 'Pakistan', 'Palau', 'Panama', 'Papua New Guinea',
    'Paraguay', 'Peru', 'Philippines', 'Poland', 'Portugal', 'Qatar', 'Romania', 'Russia', 'Rwanda',
    'Saint Kitts and Nevis', 'Saint Lucia', 'Samoa', 'San Marino', 'Saudi Arabia', 'Senegal',
    'Serbia', 'Seychelles', 'Sierra Leone', 'Singapore', 'Slovakia', 'Slovenia', 'Solomon Islands',
    'Somalia', 'South Africa', 'South Sudan', 'Spain', 'Sri Lanka', 'Sudan', 'Suriname', 'Sweden',
    'Switzerland', 'Syria', 'Taiwan', 'Tajikistan', 'Tanzania', 'Thailand', 'Togo', 'Tonga',
    'Trinidad and Tobago', 'Tunisia', 'Turkey', 'Turkmenistan', 'Tuvalu', 'Uganda', 'Ukraine',
    'United Arab Emirates', 'United Kingdom', 'United States', 'Uruguay', 'Uzbekistan', 'Vanuatu',
    'Vatican City', 'Venezuela', 'Vietnam', 'Yemen', 'Zambia', 'Zimbabwe'
  ];

  final List<String> sexes = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'First Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter your first name' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Middle Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter your middle name' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Last Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter your last name' : null,
                ),
                DropdownButtonFormField<String>(
                  value: selectedSex,
                  items: sexes.map((sex) => DropdownMenuItem(value: sex, child: Text(sex))).toList(),
                  onChanged: (value) => setState(() => selectedSex = value),
                  decoration: const InputDecoration(labelText: 'Sex'),
                  validator: (value) => value == null ? 'Please select your sex' : null,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (value) => value!.length < 6 ? 'Password must be at least 6 characters' : null,
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Confirm Password'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  value: selectedCountry,
                  items: countries.map((country) => DropdownMenuItem(value: country, child: Text(country))).toList(),
                  onChanged: (value) => setState(() => selectedCountry = value),
                  decoration: const InputDecoration(labelText: 'Country'),
                  validator: (value) => value == null ? 'Please select your country' : null,
                ),
                DropdownButtonFormField<String>(
                  value: selectedResidenceCountry,
                  items: countries.map((country) => DropdownMenuItem(value: country, child: Text(country))).toList(),
                  onChanged: (value) => setState(() => selectedResidenceCountry = value),
                  decoration: const InputDecoration(labelText: 'Country of Residence'),
                  validator: (value) => value == null ? 'Please select your residence country' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Address Line 1'),
                  validator: (value) => value!.isEmpty ? 'Please enter address line 1' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Address Line 2'),
                  validator: (value) => value!.isEmpty ? 'Please enter address line 2' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'ZIP Code'),
                  validator: (value) => value!.isEmpty ? 'Please enter ZIP code' : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Success'),
                          content: const Text('✅ You have successfully signed up!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close dialog
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PatientConsultationHome(),
                                  ),
                                );
                              },
                              child: const Text('Continue'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  child: const Text('Submit Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
