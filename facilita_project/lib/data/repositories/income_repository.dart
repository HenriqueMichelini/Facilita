import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:facilita_project/data/models/create_income_model.dart';
import 'package:facilita_project/data/models/income_model.dart';
import 'package:facilita_project/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IIncomeRepository {
  Future<List<IncomeModel>> getIncome();
}

class IncomeRepository implements IIncomeRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final String baseUrl = 'https://facillita.azurewebsites.net/income';
  final Dio dio;

  IncomeRepository({required this.dio});

  @override
  Future<List<IncomeModel>> getIncome() async {
    try {
      var uid = _auth.currentUser?.uid;
      final response = await dio.get<List>('$baseUrl?userUId=$uid');
      return response.data!.map((item) => IncomeModel.fromMap(item)).toList();
    } on DioException catch (e) {
      if(e.response?.statusCode == 404){
        throw Exception('A url informada não é válida');
      }
      else{
        throw Exception('Não foi possivel carregar as receitas');
      }
    }
  }
}
