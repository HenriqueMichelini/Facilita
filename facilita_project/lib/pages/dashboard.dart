import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 39, 22),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(),
          ),
        ),
      ),
    );
  }
}
