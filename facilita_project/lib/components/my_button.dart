import 'package:facilita_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  final Function()? onTap;
  final isLoading;

  const LoginButton({
    super.key,
    required this.onTap,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 25, 43, 27),
          borderRadius: BorderRadius.circular(8),
        ),
        child: (isLoading)
            ? const Padding(
                padding: EdgeInsets.all(25),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : const Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  final Function()? onTap;

  const RegisterButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 25, 43, 27),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Cadastrar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<AuthService>().logout(),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 41, 41, 41),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Sair',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
