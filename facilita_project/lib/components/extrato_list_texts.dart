import 'package:flutter/material.dart';

class ExtratoListTexts extends StatelessWidget {
  const ExtratoListTexts({
    super.key,
    required this.description,
    required this.type,
  });

  final String description;
  final String type;

  @override
  Widget build(BuildContext context) {
    Color textColor = (type == "DESPESA")
        ? const Color.fromARGB(255, 220, 76, 100)
        : const Color.fromARGB(255, 20, 164, 77);

    return Text(
      description,
      style: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
