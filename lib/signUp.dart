import 'package:flutter/material.dart';
import 'package:venue_vibes/authService.dart';
import 'package:venue_vibes/decor.dart';
import 'package:venue_vibes/login.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  AuthService authService = AuthService();

  // Validator functions
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phone number must be digits only';
    }
    if (value.length != 11) {
      return 'Phone number must be 11 digits';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Venue_Vibes!"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: Color(0xFF81717A),
                          ),
                          child: const Text(
                            'SignUp',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: Color(0xFF81717A)),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildGreyText('First name'),
                            buildInputField(),
                          ],
                        ),
                      ),
                      SizedBox(width: 50),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildGreyText('Last name'),
                            buildInputField(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  buildGreyText('Email address'),
                  buildInputField(
                    controller: emailController,
                    validator: _validateEmail,
                  ),
                  SizedBox(height: 16),
                  buildGreyText('Phone number'),
                  buildInputField(
                    controller: phoneController,
                    validator: _validatePhone,
                  ),
                  SizedBox(height: 16),
                  buildGreyText('Password'),
                  buildInputField(
                    controller: passwordController,
                    obscureText: true,
                    validator: _validatePassword,
                  ),
                  SizedBox(height: 16),
                  buildGreyText('Confirm password'),
                  buildInputField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    validator: _validateConfirmPassword,
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authService
                              .singUp(
                                  emailController.text, passwordController.text)
                              .then((user) {
                            if (user != null) {
                              Navigator.push(
                                  (context),
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Decor(key: Decor.decorKey)));
                            }
                          });
                        }
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF81717A),
                        padding:
                            EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: Divider()), // Left side divider
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("OR"), // OR text
                      ),
                      Expanded(child: Divider()), // Right side divider
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(child: Text('Sign up with')),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.facebook),
                        color: Colors.blue,
                        onPressed: () {
                          // Handle Facebook sign up
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.access_alarm_outlined),
                        color: Colors.red,
                        onPressed: () {
                          // Handle Google sign up
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.alternate_email),
                        color: Colors.lightBlue,
                        onPressed: () {
                          // Handle Twitter sign up
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGreyText(String label) {
    return Text(
      label,
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget buildInputField({
    TextEditingController? controller,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
      ),
    );
  }
}
