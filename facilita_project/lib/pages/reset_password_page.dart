import 'package:facilita_project/components/my_button.dart';
import 'package:facilita_project/components/square_tile.dart';
import 'package:facilita_project/enums/providers.dart';
import 'package:facilita_project/pages/login_page.dart';
import 'package:facilita_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.white,
  );
  bool isLogin = true;
  bool isLoading = false;
  late String titulo;

  @override
  void initState() {
    super.initState();
    setFormAction();
  }

  setFormAction() {
    setState(() {
      titulo = 'Alterar Senha!';
    });
  }

  resetPassword() {
    try {
      context.read<AuthService>().resetPassword(usernameController.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 39, 22),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Form(
              key: formKey,
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
                  Text(
                    titulo,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  //username
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      controller: usernameController,
                      obscureText: false,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                          fillColor: const Color.fromARGB(255, 25, 43, 27),
                          filled: true,
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.white38)),
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira o email corretamente!';
                        }
                        return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  //  login button
                  MyButton(
                    onTap: resetPassword,
                    isLoading: isLoading,
                    label: 'Enviar',
                    imagePath: '',
                  ),

                  const SizedBox(height: 30),

                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text('Voltar ao Login.'),
                    style: textButtonStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
