import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final controller;
  final String hint;
  final bool obscure;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.obscure
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
      ),
    );
  }
}