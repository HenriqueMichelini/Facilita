import 'package:facilita_project/pages/dashboard.dart';
import 'package:facilita_project/pages/login_page.dart';
import 'package:facilita_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if(auth.isLoading) {
      return loading();
    } else if(auth.usuario == null){
      return LoginPage();
    }
    else{
      return const Dashboard();
    }
  }

  loading(){
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}