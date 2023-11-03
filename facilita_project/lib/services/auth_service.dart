import 'package:facilita_project/enums/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier{
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck(){
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
     });
  }

  _getUser(){
    usuario = _auth.currentUser;
  }

  register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if(e.code.toLowerCase() == 'weak-password'){
        throw AuthException('A senha é muito fraca!');
      } else if(e.code.toLowerCase() == 'email-already-in-use'){
        throw AuthException('Este email já está cadastrado!');
      }
    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if(e.code.toLowerCase() == 'invalid-email'){
        throw AuthException('O usuário ou senha está icorreto!');
      } else if(e.code.toLowerCase() == 'wrong-password'){
        throw AuthException('O usuário ou senha está icorreto!');
      }else if(e.code.toLowerCase() == 'invalid_login_credentials'){
        throw AuthException('O usuário ou senha está icorreto!');
      }
    }
  }

  loginWithProvider(Providers provider) async {
    try {
      switch (provider) {
        case Providers.google:
          await _auth.signInWithProvider(GoogleAuthProvider());
          break;
        case Providers.twitter:
            await _auth.signInWithProvider(TwitterAuthProvider());
          break;
        default:
      }

      _getUser();
    } on FirebaseAuthException catch (e) {
      if(e.code.toLowerCase() == 'user-not-found'){
        throw AuthException('O usuário ou senha está icorreto!');
      } else if(e.code.toLowerCase() == 'wrong-password'){
        throw AuthException('O usuário ou senha está icorreto!');
      }else if(e.code.toLowerCase() == 'invalid_login_credentials'){
        throw AuthException('O usuário ou senha está icorreto!');
      }
    }
  }

  resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email); 
      _getUser();
    } on FirebaseAuthException catch (e) {
      if(e.code.toLowerCase() == 'invalid-email'){
        throw AuthException('O Email é inválido!');
      }
      late FirebaseAuthException test = e;
    }
  }


  logout() async {
    await _auth.signOut();
    _getUser();
  }
}