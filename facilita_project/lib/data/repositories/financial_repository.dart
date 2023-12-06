import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:facilita_project/data/models/financial_model.dart';
import 'package:facilita_project/data/models/income_model.dart';
import 'package:facilita_project/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IFinancialRepository {
  Future<FinancialModel> getTotalizer();
}

class FinancialRepository implements IFinancialRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final String baseUrl = 'https://facillita.azurewebsites.net/financial/search';
  final Dio dio;

  FinancialRepository({required this.dio});

  @override
  Future<FinancialModel> getTotalizer() async {
    try {
      var uid = _auth.currentUser?.uid;
      final response = await dio.get('$baseUrl', queryParameters: {'userUId': uid, 'year': DateTime.now().year, 'month': DateTime.now().month});
      final result = FinancialModel.fromMap(response.data);
      return result;
    } on DioException catch (e) {
      switch (e.response?.statusCode) {
        case 404:
          throw Exception('A url informada não é válida');
        case 500:
          throw Exception('Ocorreu um erro interno no servidor');
        default:
          throw Exception('Não foi possivel carregar as informações');
      }
    }
  }
}
