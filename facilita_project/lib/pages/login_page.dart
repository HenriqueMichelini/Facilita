import 'package:dio/dio.dart';
import 'package:facilita_project/components/my_button.dart';
import 'package:facilita_project/components/square_tile.dart';
import 'package:facilita_project/data/repositories/user_repository.dart';
import 'package:facilita_project/enums/providers.dart';
import 'package:facilita_project/pages/reset_password_page.dart';
import 'package:facilita_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  ButtonStyle textButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.white,
  );
  bool isLogin = true;
  bool isLoading = false;
  late String titulo;
  late String actionButton;
  late String togglerButton;
  final UserRepository repository = UserRepository(dio: Dio()); 

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool action) {
    setState(() {
      isLogin = action;
      if (isLogin) {
        titulo = 'Bem-vindo à Facillita!';
        actionButton = 'Login';
        togglerButton = 'Ainda não tem conta? Cadastre-se agora.';
      } else {
        titulo = 'Bem-vindo à Facillita!';
        actionButton = 'Cadastrar';
        togglerButton = 'Voltar ao Login.';
      }
    });
  }

  login() async {
    setState(() => isLoading = true);
    try {
      await context
          .read<AuthService>()
          .login(usernameController.text, passwordController.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
    setState(() => isLoading = false);
  }

  register() async {
    setState(() => isLoading = true);
    try {
      await context
          .read<AuthService>()
          .register(usernameController.text, passwordController.text);
      repository.addUser();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
    setState(() => isLoading = false);
  }

  resetPassword() {
    return ResetPasswordPage();
  }

  loginProvider() async {
    setState(() => isLoading = true);
    try {
      await context.read<AuthService>().loginWithProvider(Providers.google);
      repository.addUser();
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
    setState(() => isLoading = false);
  }

  void loginUserIn() {
    if (formKey.currentState!.validate() && isLogin) {
      login();
    } else {
      register();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 29, 31),
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
                    style: const TextStyle(
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
                          fillColor: const Color.fromARGB(255, 6, 20, 18),
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

                  //password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                          fillColor: const Color.fromARGB(255, 6, 20, 18),
                          filled: true,
                          hintText: 'Senha',
                          hintStyle: const TextStyle(color: Colors.white38)),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira sua senha!';
                        } else if (value.length < 8) {
                          return 'Sua senha deve ter no minimo 8 caracteres!';
                        }
                        return null;
                      },
                    ),
                  ),

                  //forgot password
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPasswordPage()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Esqueceu sua senha?',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  //  login button
                  MyButton(
                    onTap: loginUserIn,
                    isLoading: isLoading,
                    label: actionButton,
                    imagePath: '',
                  ),

                  const SizedBox(height: 30),

                  TextButton(
                    onPressed: () => setFormAction(!isLogin),
                    child: Text(togglerButton),
                    style: textButtonStyle,
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

                  //  google + twitter login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //  google button
                      MyButton(
                        onTap: loginProvider,
                        isLoading: isLoading,
                        label: 'oogle',
                        imagePath: 'lib/images/google-icon.png',
                      ),
                    ],
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
