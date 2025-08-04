import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 23),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.blue),
            onPressed: () {
              Navigator.of(context).pushNamed('/Signin');
            },
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 43),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF3F51F3)),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Text(
                "ECOM",
                style: GoogleFonts.caveatBrush(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF3F51F3),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create your account",
                style: GoogleFonts.poppins(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF3E3E3E),
                ),
              ),
              const SizedBox(height: 32),
              // Name
              Text(
                "Name",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF6F6F6F),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 42,
                width: 288,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'ex: jon smith',
                    hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF888888)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFFAFAFA),
                  ),
                  onChanged: (value) => _name = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your name' : null,
                ),
              ),
              const SizedBox(height: 20),
              // Email
              Text(
                "Email",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF6F6F6F),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 288,
                height: 42,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'ex: jon.smith@gmail.com',
                    hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF888888)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFFAFAFA),
                  ),
                  onChanged: (value) => _email = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your email' : null,
                ),
              ),
              const SizedBox(height: 20),
              // Password
              Text(
                'Password',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF6F6F6F),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 288,
                height: 42,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '........',
                    hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF888888)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFFAFAFA),
                  ),
                  onChanged: (value) => _password = value,
                  validator: (value) =>
                      value!.isEmpty ? 'Enter your password' : null,
                ),
              ),
              const SizedBox(height: 20),
              // Confirm Password
              Text(
                'Confirm Password',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF6F6F6F),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 288,
                height: 42,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '........',
                    hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: const Color(0XFF888888)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFFAFAFA),
                  ),
                  onChanged: (value) => _confirmPassword = value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm your password';
                    }
                    if (value != _password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Terms Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _termsAccepted,
                    onChanged: (bool? value) {
                      setState(() {
                        _termsAccepted = value ?? false;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text.rich(
                      TextSpan(
                        text: 'I understood the ',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF000000),
                        ),
                        children: [
                          TextSpan(
                            text: 'terms and policies',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF3F51F3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _termsAccepted
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            // Handle signup logic here
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Signup logic goes here"),
                              ),
                            );
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: const Color(0xFF3F51F3),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Navigate to Sign In
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Have an account? ",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF888888),
                        ),
                      ),
                      TextSpan(
                        text: "SIGN IN",
                        style: const TextStyle(color: Color(0XFF3F51F3)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushNamed("/signin");
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
