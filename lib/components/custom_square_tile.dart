import 'package:flutter/material.dart';

class CustomSquareTile extends StatelessWidget {
  final String imagePath;
  const CustomSquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 187, 157, 242),
      ),
      child: Image.asset(
        imagePath,
        height: 45,
      ),
    );
  }
}
