import 'package:flutter/material.dart';
import 'sign_in.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool TermsAndConditions = false;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _checkboxError;  // Added checkbox error variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Stack(
          children: [
            Container(
              color: Colors.black.withOpacity(0),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {},
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
                            "Get Started",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF486abf),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Full Name", style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "Enter Full Name",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            errorText: _nameError,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            errorText: _emailError,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        const Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter password",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            errorText: _passwordError,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: TermsAndConditions,
                                  onChanged: (val) {
                                    setState(() => TermsAndConditions = val!);
                                  },
                                ),
                                const Text(
                                  "I agree to the ",
                                  style: TextStyle(color: Colors.black54),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Show the Terms and Conditions dialog when clicked
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          title: const Text(
                                            "Terms and Conditions",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color(0xFF486abf), // Custom Blue for Title
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                    "1. Acceptance of Terms",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black87,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "By downloading, installing, or using [App Name], you agree to comply with and be bound by these Terms and Conditions. If you do not agree to these terms, please refrain from using our app.",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                    "2. Account Registration",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black87,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "To use certain features of the app, you may be required to create an account. You agree to provide accurate and complete information during registration, and you are responsible for maintaining the confidentiality of your login credentials.",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                    "3. Privacy and Data Protection",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black87,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "We are committed to protecting your privacy. The app stores your notes securely and uses encryption to ensure the privacy of your data. We do not share, sell, or rent your personal information to third parties unless required by law.",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                    "4. User Responsibility",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black87,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "You are solely responsible for the content of the notes you create within the app. You must not upload, store, or share any illegal, harmful, or offensive content.",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                    "5. Security",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black87,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "We prioritize the security of your data. The app uses industry-standard encryption to protect your notes. However, you acknowledge that no method of transmission over the Internet or electronic storage is completely secure. We cannot guarantee the absolute security of your data.",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                    "6. Prohibited Activities",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black87,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "You agree not to use the app for any unlawful or harmful activities, including but not limited to:\n"
                                                      "- Uploading or sharing content that infringes on intellectual property rights.\n"
                                                      "- Attempting to hack, disrupt, or interfere with the functionality of the app.\n"
                                                      "- Using the app for spamming or phishing activities.",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                    "7. Changes to Terms",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black87,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "We reserve the right to modify or update these Terms and Conditions at any time. Any changes will be posted on this page with an updated date. Your continued use of the app after such changes signifies your acceptance of the new terms.",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                    "8. Limitation of Liability",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black87,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "[App Name] will not be liable for any damages or losses resulting from the use or inability to use the app.",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                    "9. Termination",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black87,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "We may suspend or terminate your access to the app if you violate any of these terms. You may also delete your account at any time.",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                    "10. Governing Law",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black87,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "These Terms and Conditions shall be governed by and construed in accordance with the laws of [Your Country/Region]. Any disputes arising from these terms shall be subject to the exclusive jurisdiction of the courts in [Your Location].",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                Padding(
                                                  padding: const EdgeInsets.only(bottom: 8.0),
                                                  child: Text(
                                                    "11. Contact Us",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black87,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  "If you have any questions or concerns regarding these Terms and Conditions, please contact us at [Insert Contact Information].",
                                                  style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 14,
                                                    height: 1.5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(); // Close the dialog
                                              },
                                              child: const Text(
                                                'Close',
                                                style: TextStyle(
                                                  color: Color(0xFF486abf), // Custom Blue
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );


                                  },
                                  child: const Text(
                                    "Terms and Conditions",
                                    style: TextStyle(
                                      color: Color(0xFF486abf), // Blue color
                                      fontWeight: FontWeight.bold, // Bold text
                                    ),
                                  ),
                                ),
                                const Text(
                                  ".",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),


                        // Error message for checkbox appears below checkbox if not checked
                        if (_checkboxError != null)
                          Center(
                            child: Text(
                              _checkboxError!,
                              style: const TextStyle(
                                color: Color(0xFFA40000),
                                fontSize: 12,
                              ),
                            ),
                          ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                // Reset errors
                                _nameError = null;
                                _emailError = null;
                                _passwordError = null;
                                _checkboxError = null; // Reset checkbox error

                                bool isValid = true;

                                // Validate name
                                if (_nameController.text.isEmpty) {
                                  _nameError = "Name can't be empty";
                                  isValid = false;
                                }

                                // Validate email
                                String email = _emailController.text;
                                if (email.isEmpty) {
                                  _emailError = "Email can't be empty";
                                  isValid = false;
                                } else if (!email.contains('@') || !email.contains('.')) {
                                  _emailError = "Please enter a valid email address";
                                  isValid = false;
                                }

                                // Validate password
                                String password = _passwordController.text;
                                if (password.isEmpty) {
                                  _passwordError = "Password can't be empty";
                                  isValid = false;
                                } else if (password.length < 8) {
                                  _passwordError = "Password must be at least 8 characters";
                                  isValid = false;
                                } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
                                  _passwordError = "Password must contain at least one uppercase letter";
                                  isValid = false;
                                }

                                // Only validate checkbox if other fields are filled
                                if (isValid && !TermsAndConditions) {
                                  _checkboxError = "You must agree to the processing of personal data";
                                  isValid = false;
                                }

                                if (isValid) {
                                  // Continue with the sign-up process
                                  Navigator.of(context).pop();
                                  Future.delayed(const Duration(milliseconds: 200), () {
                                    Navigator.of(context).push(
                                      PageRouteBuilder(
                                        opaque: false,
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
                                }
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
                              "Sign up",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: const [
                            Expanded(child: Divider(thickness: 1)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Sign up with",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            Expanded(child: Divider(thickness: 1)),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _circleIconButton('assets/icons/facebook.png'),
                            const SizedBox(width: 16),
                            _circleIconButton('assets/icons/twitter.png'),
                            const SizedBox(width: 16),
                            _circleIconButton('assets/icons/google.png'),
                            const SizedBox(width: 16),
                            _circleIconButton('assets/icons/apple.png'),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?", style: TextStyle(color: Colors.black54)),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                Future.delayed(const Duration(milliseconds: 200), () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      opaque: false,
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
                              child: const Text(
                                "Sign in",
                                style: TextStyle(color: Color(0xFF486abf)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
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

  Widget _circleIconButton(String assetPath) {
    return Container(
      width: 55,
      height: 45,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(assetPath, fit: BoxFit.contain),
      ),
    );
  }
}
