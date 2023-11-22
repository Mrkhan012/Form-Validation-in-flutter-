import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pratice_app/screen/login_screen.dart';
import 'package:pratice_app/utils/validator_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
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

  void _signUp() {
    if (_formKey.currentState!.validate() && !_isLoading) {
      if (_passwordController.text != _confirmPasswordController.text) {
        showSnackBar(context: context, content: "Password Mismatch");
        return;
      }
      // Set isLoading to true to show the circular progress indicator
      setState(() {
        _isLoading = true;
      });

      // Simulate a signup process (you can replace this with your actual signup logic)
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
        // After signup is complete, set isLoading back to false
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        // ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Lottie.asset("assets/login.json", height: height * 0.3),
                  // Text(
                  //   'WELCOME ',
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 20,
                  //       color: Colors.grey.shade900),
                  // ),
                  // SizedBox(
                  //   height: height * 0.03,
                  // ),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      hintText: "Nmae",
                      labelText: "Name",
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email";
                      } else if (!validateName(value)) {
                        return "Please enter correct name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.03,
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
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      hintText: "Phone",
                      labelText: "Phone",
                      prefixIcon: Icon(
                        Icons.phone,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email";
                      } else if (!validatePhone(value)) {
                        return "Please enter correct PhoneNumber";
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
                  SizedBox(
                    height: height * 0.03,
                  ),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: " Confirm Passowrd",
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
                  SizedBox(
                    height: height * 0.03,
                  ),
                  InkWell(
                    onTap: _signUp, // Use _signUp function instead of signUp()
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.4,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(35)),
                        color: Colors.grey.shade900,
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.grey),
                            )
                          : const Text(
                              "SignUp",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: const Text("Already have a account?"),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: const Text(
                            "Login",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
