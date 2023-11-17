import 'package:flutter/material.dart';

class MyTextFields extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextFields({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Colors.black12),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Colors.black12),
            ),
            fillColor: const Color.fromARGB(255, 6, 20, 18),
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white38)),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
