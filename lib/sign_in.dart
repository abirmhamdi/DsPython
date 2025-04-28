import 'package:flutter/material.dart';
import 'sign_Up.dart';
import 'forgot_password.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool rememberMe = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? emailError;
  String? passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // VERY important!
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
                onTap: () {}, // Prevent form close when tapping inside
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
                            "Welcome Back!",
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
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            errorText: emailError,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Password
                        const Text("Password", style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter password",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            errorText: passwordError,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Remember me and forgot password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: rememberMe,
                                  onChanged: (val) {
                                    setState(() => rememberMe = val!);
                                  },
                                ),
                                const Text(
                                  "Remember me",
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                Future.delayed(const Duration(milliseconds: 200), () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder: (_, __, ___) => const ForgotPasswordPage(),
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
                                "Forgot password?",
                                style: TextStyle(color: Color(0xFF486abf)),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Big Sign In Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _handleSignIn,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF486abf),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Sign in",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Divider
                        Row(
                          children: const [
                            Expanded(child: Divider(thickness: 1)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Sign in with",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            Expanded(child: Divider(thickness: 1)),
                          ],
                        ),
                        const SizedBox(height: 30),

                        // Social Buttons
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
                        const SizedBox(height: 20),

                        // Sign Up prompt
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?", style: TextStyle(color: Colors.black54)),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                Future.delayed(const Duration(milliseconds: 200), () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder: (_, __, ___) => const SignUpPage(),
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
                                " Sign up",
                                style: TextStyle(color: Color(0xFF486abf)),
                              ),
                            )
                          ],
                        ),
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
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset(assetPath),
    );
  }

  void _handleSignIn() {
    setState(() {
      emailError = null;
      passwordError = null;

      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      bool hasError = false;

      if (email.isEmpty) {
        emailError = "Please enter your email.";
        hasError = true;
      } else if (!email.contains('@') || !email.contains('.')) {
        emailError = "Please enter a valid email.";
        hasError = true;
      }

      if (password.isEmpty) {
        passwordError = "Please enter your password.";
        hasError = true;
      }

      if (!hasError) {
        // Proceed with actual sign in logic
        // Example: authenticateUser(email, password);
      }
    });
  }}
