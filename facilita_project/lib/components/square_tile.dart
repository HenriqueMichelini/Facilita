import 'package:facilita_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;

  const SquareTile(
      {super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<AuthService>().loginWithProvider(),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white10,
        ),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}
