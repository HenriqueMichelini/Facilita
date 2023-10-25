import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const SelectButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 41, 41, 41),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
