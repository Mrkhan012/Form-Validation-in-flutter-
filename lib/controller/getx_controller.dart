// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pratice_app/screen/login_screen.dart';
// import 'package:pratice_app/utils/validator_form.dart';

// class LoginController extends GetxController {
//   // Declare your variables and functions here
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   RxBool isLoading = false.obs;
//   RxBool isPasswordVisible = false.obs;
//   RxDouble passwordStrength = 0.0.obs;
// }

// // class SignUpController extends GetxController {
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController phoneController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final TextEditingController confirmPasswordController =
// //       TextEditingController();
// //   final RxBool isLoading = false.obs;
// //   final RxBool isPasswordVisible = false.obs;
// //   final RxDouble passwordStrength = 0.0.obs;

// //   // Function to calculate password strength
// //   double calculatePasswordStrength(String password) {
// //     int length = password.length;
// //     int uppercaseCount = password.replaceAll(RegExp(r'[^A-Z]'), '').length;
// //     int digitCount = password.replaceAll(RegExp(r'[^0-9]'), '').length;
// //     int specialCharCount =
// //         password.replaceAll(RegExp(r'[A-Za-z0-9]'), '').length;

// //     // Calculate a score based on length, uppercase, digits, and special characters
// //     double score = length / 16 +
// //         uppercaseCount / 4 +
// //         digitCount / 4 +
// //         specialCharCount / 4;

// //     // Cap the score at 1.0
// //     return score > 1.0 ? 1.0 : score;
// //   }

//   // Function to handle the signup process
//   // void signUp() {
//   //   //   if (!isLoading.value) {
//   //   //     if (passwordController.text != confirmPasswordController.text) {
//   //   //       showSnackBar(context: Get.context, content: "Password Mismatch");
//   //   //       return;
//   //   //     }

//   //   //     isLoading.value = true; // Set isLoading to true

//   //   //     // Simulate a signup process (you can replace this with your actual signup logic)
//   //   //     Future.delayed(const Duration(seconds: 2), () {
//   //   //       Get.off(() => const LoginScreen());
//   //   //       isLoading.value = false; // After signup is complete, set isLoading back to false
//   //   //     });
//   //   //   }
//   //   // }
//   // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:pratice_app/controller/getx_controller.dart';
// import 'package:pratice_app/screen/home_screen.dart';
// import 'package:pratice_app/screen/signup_screen.dart';
// import 'package:pratice_app/utils/validator_form.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final LoginController loginController = Get.put(LoginController());
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   // Function to calculate password strength
//   double _calculatePasswordStrength(String password) {
//     int length = password.length;
//     int uppercaseCount = password.replaceAll(RegExp(r'[^A-Z]'), '').length;
//     int digitCount = password.replaceAll(RegExp(r'[^0-9]'), '').length;
//     int specialCharCount =
//         password.replaceAll(RegExp(r'[A-Za-z0-9]'), '').length;

//     // Calculate a score based on length, uppercase, digits, and special characters
//     double score = length / 16 +
//         uppercaseCount / 4 +
//         digitCount / 4 +
//         specialCharCount / 4;

//     // Cap the score at 1.0
//     return score > 1.0 ? 1.0 : score;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: Colors.grey[100],
//           // appBar: AppBar(
//           //   // title: const Text(
//           //   //   "Login Page",
//           //   //   style:
//           //   //       TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
//           //   // ),
//           //   // backgroundColor: Colors.transparent,
//           // ),
//           body: SingleChildScrollView(
//             child: Container(
//               padding: const EdgeInsets.only(left: 35, right: 35),
//               child: GetBuilder<LoginController>(
//                 builder: (_) => Form(
//                   key: _formKey,
//                   child: Column(
//                     // crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Lottie.asset(
//                         "assets/login.json",
//                       ),
//                       // Image.asset("assets/login-.png"),
//                       Text(
//                         "WELCOME",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey.shade700,
//                         ),
//                       ),
//                       // const Text(
//                       //   "OUR PLACE!",
//                       //   style: TextStyle(
//                       //     fontSize: 24,
//                       //     fontWeight: FontWeight.bold,
//                       //     color: Colors.deepPurple,
//                       //   ),
//                       // ),
//                       SizedBox(
//                         height: height * 0.07,
//                       ),
//                       TextFormField(
//                         controller: loginController.emailController,
//                         decoration: const InputDecoration(
//                           hintText: "Email",
//                           labelText: "Email",
//                           prefixIcon: Icon(
//                             Icons.email,
//                           ),
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "Please enter email";
//                           } else if (!validateEmail(value)) {
//                             return "Invalid email format";
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: height * 0.03,
//                       ),
//                       TextFormField(
//                         controller: loginController.passwordController,
//                         obscureText: !loginController.isPasswordVisible.value,
//                         decoration: InputDecoration(
//                           labelText: "Password",
//                           prefix: const Icon(Icons.lock),
//                           border: const OutlineInputBorder(),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               loginController.isPasswordVisible.value
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                             ),
//                             onPressed: () {
//                               loginController.isPasswordVisible.value =
//                                   !loginController.isPasswordVisible.value;
//                             },
//                           ),
//                         ),
//                         onChanged: (value) {
//                           // Calculate password strength

//                           loginController.passwordStrength.value =
//                               _calculatePasswordStrength(value);
//                         },
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "Please enter your password";
//                           } else if (value.length < 6) {
//                             return "Password must be at least 6 characters";
//                           }
//                           // Add password format validation
//                           if (loginController.passwordStrength.value < 0.3) {
//                             return "Password is weak";
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 8.0),
//                       LinearProgressIndicator(
//                         value: loginController.passwordStrength.value,
//                         backgroundColor: Colors.grey[300],
//                         minHeight: 10.0,
//                       ),
//                       SizedBox(
//                         height: height * 0.03,
//                       ),
//                       SizedBox(
//                         height: height * 0.06,
//                         width: width * 0.5,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.grey.shade900,
//                           ),
//                           onPressed: loginController.isLoading.value
//                               ? null
//                               : () async {
//                                   if (_formKey.currentState!.validate()) {
//                                     loginController.isLoading.value = true;

//                                     // Display CircularProgressIndicator for at least 2 seconds
//                                     await Future.delayed(
//                                         const Duration(seconds: 2));

//                                     // Navigate to the HomeScreen
//                                     Get.off(() => const HomeScreen());

//                                     loginController.isLoading.value = false;
//                                   }
//                                 },
//                           child: loginController.isLoading.value
//                               ? const CircularProgressIndicator(
//                                   color: Colors.grey,
//                                 )
//                               : const Center(
//                                   child: Text(
//                                     "Login",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                             child: const Text(
//                               "Don't have an account?",
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () {
//                               // Navigate to the signup screen
//                               Get.off(() => const SignUpScreen());
//                             },
//                             child: Container(
//                               padding: const EdgeInsets.symmetric(vertical: 14),
//                               child: const Text(
//                                 "Sign Up",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )),
//     );
//   }
// }

