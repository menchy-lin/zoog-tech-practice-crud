import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 136, 79, 243),
              ),
            ),
            fillColor: const Color.fromARGB(255, 174, 138, 240),
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color.fromARGB(199, 209, 202, 202),
              fontSize: 18,
            )),
      ),
    );
  }
}
