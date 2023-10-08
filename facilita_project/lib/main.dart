import 'package:flutter/material.dart';

void login() {
  // Add your login logic here
  print('Username: ${usernameController.text}');
  print('Password: ${passwordController.text}');
}

final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 50, 121, 79),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  width: 200, // Set the width of the input fields
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                SizedBox(
                  width: 200, // Set the width of the input fields
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true, // Hide the password text
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: login,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(fontSize: 28),
                  ),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
