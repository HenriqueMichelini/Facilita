import 'package:facilita_project/components/my_button.dart';
import 'package:facilita_project/components/my_textfields.dart';
import 'package:facilita_project/components/square_tile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //  text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 39, 22),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //logo

                Image.asset(
                  'lib/images/corvo.png',
                  height: 100,
                ),

                const SizedBox(height: 50),

                //welcome message
                const Text(
                  'Bem-vindo à Facilita!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                //username
                MyTextFields(
                  controller: usernameController,
                  hintText: 'Usuário',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                //password
                MyTextFields(
                  controller: passwordController,
                  hintText: 'Senha',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                //  forgot password
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Esqueceu sua senha?',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                //  login button
                MyButton(
                  onTap: loginUserIn,
                ),

                const SizedBox(height: 50),

                //  or continue with
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'ou continue com',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                //  google + apple login
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //  google button
                    SquareTile(imagePath: 'lib/images/google-icon.png'),

                    SizedBox(width: 25),

                    //  apple button
                    SquareTile(imagePath: 'lib/images/apple-icon.png'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
