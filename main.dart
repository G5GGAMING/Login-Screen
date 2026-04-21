import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ));

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const Color brandBlue = Color(0xFF2196F3);
  static const Color fieldLabelColor = Color(0xFF424242);
  static const Color borderColor = Color(0xFFE0E0E0);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "تسجيل الدخول",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: brandBlue),
                ),
              ),
              const SizedBox(height: 40),
              
              _buildFieldLabel("البريد الإلكتروني"),
              TextField(
                controller: _emailController,
                decoration: _inputStyle("example@gmail.com"),
              ),
              
              const SizedBox(height: 20),
              
              _buildFieldLabel("كلمة المرور"),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: _inputStyle(""),
              ),
              
              const SizedBox(height: 40),
              
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brandBlue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    print("Login Clicked");
                  },
                  child: const Text("دخول", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              
              const SizedBox(height: 20),
              const Center(
                child: Text("ليس لديك حساب؟", style: TextStyle(color: Colors.grey, fontSize: 15)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: fieldLabelColor)),
    );
  }

  InputDecoration _inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: borderColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: brandBlue, width: 1.5)),
    );
  }
}