
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pratice_app/screen/home_screen.dart';
import 'package:pratice_app/screen/signup_screen.dart';
import 'package:pratice_app/utils/validator_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  double _passwordStrength = 0.0;

  // Function to calculate password strength
  double _calculatePasswordStrength(String password) {
    int length = password.length;
    int uppercaseCount = password.replaceAll(RegExp(r'[^A-Z]'), '').length;
    int digitCount = password.replaceAll(RegExp(r'[^0-9]'), '').length;
    int specialCharCount =
        password.replaceAll(RegExp(r'[A-Za-z0-9]'), '').length;

    // Calculate a score based on length, uppercase, digits, and special characters
    double score = length / 16 +
        uppercaseCount / 4 +
        digitCount / 4 +
        specialCharCount / 4;

    // Cap the score at 1.0
    return score > 1.0 ? 1.0 : score;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        // title: const Text(
        //   "Login Page",
        //   style:
        //       TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
        // ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 35, right: 35),
          child: Form(
            key: _formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Lottie.asset(
                  "assets/login.json",
                ),
                // Image.asset("assets/login-.png"),
                Text(
                  "WELCOME",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
                // const Text(
                //   "OUR PLACE!",
                //   style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.deepPurple,
                //   ),
                // ),
                SizedBox(
                  height: height * 0.07,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email";
                    } else if (!validateEmail(value)) {
                      return "Invalid email format";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefix: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  onChanged: (value) {
                    // Calculate password strength
                    setState(() {
                      _passwordStrength = _calculatePasswordStrength(value);
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    // Add password format validation
                    if (_passwordStrength < 0.3) {
                      return "Password is weak";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8.0),
                LinearProgressIndicator(
                  value: _passwordStrength,
                  backgroundColor: Colors.grey[300],
                  minHeight: 10.0,
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade900,
                    ),
                    onPressed: _isLoading
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });
                              // timer for circularprogressindicator
                              await Future.delayed(
                                const Duration(seconds: 2));
                              // if validation is successfully, navigate to other screen
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );

                              setState(() {
                                _isLoading = false;
                              });
                            }
                          },
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.purpleAccent,
                          )
                        : const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: const Text(
                        "Don't have an account?",
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigate to the signup screen
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
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
}