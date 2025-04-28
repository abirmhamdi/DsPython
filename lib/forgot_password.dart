import 'package:flutter/material.dart';
import 'sign_in.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,// VERY important!
      body: GestureDetector(
        onTap: () {
          // Close the sign-in page and return to the welcome page
          Navigator.pop(context);
        },
        child: Stack(
          children: [
            // Background container
            Container(
              color: Colors.black.withOpacity(0), // Make background semi-transparent
            ),

            // Form container wrapped with a GestureDetector to block background taps
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  // This prevents tapping inside the form from closing the page
                },
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            "Change Password",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF486abf),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Email
                        const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Password
                        const Text("New Password", style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter new password",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),


                        const SizedBox(height: 20),

                        // Big Sign In Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close ForgotPasswordPage first
                              Future.delayed(const Duration(milliseconds: 200), () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    opaque: false, // Keep background visible if needed
                                    pageBuilder: (_, __, ___) => const SignInPage(),
                                    transitionsBuilder: (_, animation, __, child) {
                                      final tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
                                      return SlideTransition(
                                        position: animation.drive(tween),
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF486abf),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Update password",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ),






                        const SizedBox(height: 150),
                      ],

                    ),

                  ),

                ),

              ),

            ),
          ],
        ),
      ),
    );
  }
}