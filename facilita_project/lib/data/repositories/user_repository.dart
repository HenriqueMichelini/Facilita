import 'package:dio/dio.dart';
import 'package:facilita_project/data/models/extract_model.dart';
import 'package:facilita_project/data/models/create_income_model.dart';
import 'package:facilita_project/enums/extract_Type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class IUserRepository {
  void addUser();
}

class UserRepository implements IUserRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final String baseUrl = 'https://facillita.azurewebsites.net/User';
  final Dio dio;

  UserRepository({required this.dio});

  Future<void> addUser() async {
    var userName = _auth.currentUser?.displayName ?? _auth.currentUser?.email;
    var email = _auth.currentUser?.email;
    var uid = _auth.currentUser?.uid;

    try {
      var response = await dio.post('$baseUrl/add-mobile',
          queryParameters: <String, dynamic>{
            'username': userName,
            'email': email,
            'uid': uid
          });

      var test = response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404 || e.response?.statusCode == 400) {
        throw Exception('A url informada não é válida');
      } else {
        throw Exception('Não foi possivel carregar as receitas');
      }
    }
  }
}
