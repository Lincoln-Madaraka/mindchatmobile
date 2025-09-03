import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String dob = '';
  String gender = '';
  String password = '';
  String confirmPassword = '';
  bool showPassword = false;
  bool showConfirmPassword = false;

  String getPasswordStrength() {
    if (password.length > 8 &&
        RegExp(r'[A-Z]').hasMatch(password) &&
        RegExp(r'\d').hasMatch(password)) {
      return "Strong";
    } else if (password.length >= 6) {
      return "Medium";
    }
    return "Weak";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up', style: GoogleFonts.nunito()),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'First Name'),
                onChanged: (val) => setState(() => firstName = val),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Last Name'),
                onChanged: (val) => setState(() => lastName = val),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: (val) => setState(() => email = val),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone'),
                onChanged: (val) => setState(() => phone = val),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Date of Birth'),
                onChanged: (val) => setState(() => dob = val),
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Gender'),
                items: const [
                  DropdownMenuItem(value: 'Male', child: Text('Male')),
                  DropdownMenuItem(value: 'Female', child: Text('Female')),
                  DropdownMenuItem(value: 'Other', child: Text('Other')),
                ],
                onChanged: (val) => setState(() => gender = val ?? ''),
              ),
              TextFormField(
                obscureText: !showPassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                        showPassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () =>
                        setState(() => showPassword = !showPassword),
                  ),
                ),
                onChanged: (val) => setState(() => password = val),
              ),
              TextFormField(
                obscureText: !showConfirmPassword,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(showConfirmPassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () =>
                        setState(() => showConfirmPassword = !showConfirmPassword),
                  ),
                ),
                onChanged: (val) => setState(() => confirmPassword = val),
              ),
              const SizedBox(height: 12),
              Text('Password Strength: ${getPasswordStrength()}',
                  style: TextStyle(
                    color: getPasswordStrength() == 'Strong'
                        ? Colors.green
                        : getPasswordStrength() == 'Medium'
                            ? Colors.yellow
                            : Colors.red,
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: Connect to Supabase or backend
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyanAccent),
                child: Text('Create Account',
                    style: GoogleFonts.nunito(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
