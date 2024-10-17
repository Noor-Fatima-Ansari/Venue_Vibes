import 'package:flutter/material.dart';
import 'package:venue_vibes/authService.dart';
import 'package:venue_vibes/decor.dart';
import 'package:venue_vibes/signUp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()),
                          );
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Color(0xFF81717A)),
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            foregroundColor: Color(0xFF81717A)),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30), // Spacing before the form
                buildGreyText('Email address'),
                buildInputField(
                  controller: emailController,
                  validator: _validateEmail,
                ),
                SizedBox(height: 20),
                buildGreyText('Password'),
                buildInputField(
                  controller: passwordController,
                  obscureText: true,
                  validator: _validatePassword,
                ),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   // Process data
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text('Login successful')),
                      //   );
                      // }

                      if (_formKey.currentState!.validate()) {
                        authService
                            .singIn(
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
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF81717A),
                      padding: EdgeInsets.symmetric(
                        horizontal: 120,
                        vertical: 15,
                      ),
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
                Center(child: Text('Log in with')),
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
