import 'package:flutter/material.dart';

class CadastrarButton extends StatelessWidget {
  final Function()? onTap;

  const CadastrarButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 6, 20, 18),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            "Cadastrar",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
