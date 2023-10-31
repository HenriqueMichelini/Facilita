import 'package:facilita_project/enums/providers.dart';
import 'package:facilita_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final Providers provider;
  final bool isLoading;

  const SquareTile(
      {super.key,
      required this.imagePath,
      required this.provider,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    loginProvider() async {
      try {
        await context.read<AuthService>().loginWithProvider(provider);
      } on AuthException catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    }

    return GestureDetector(
      onTap: () => context.read<AuthService>().loginWithProvider(provider),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white10,
        ),
        child: (isLoading)
            ? Padding(
                padding: EdgeInsets.all(25),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Image.asset(
                imagePath,
                height: 40,
              ),
      ),
    );
  }
}
