
// validation for mail
import 'package:flutter/material.dart';

bool validateEmail(String email) {
  String pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}
// validation for phone

bool validatePhone(String phone) {
  String pattern = r'^[0-9]{10}$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(phone);
}

// validation for Name RegExp regerx
bool validateName(String name) {
  String pattern = r'^[A-Za-z]+$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(name);
}

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
  ));
}



