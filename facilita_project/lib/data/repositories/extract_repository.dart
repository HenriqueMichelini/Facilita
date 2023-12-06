import 'package:dio/dio.dart';
import 'package:facilita_project/data/models/extract_model.dart';
import 'package:facilita_project/data/models/create_income_model.dart';
import 'package:facilita_project/enums/extract_Type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

abstract class IExtractRepository {
  Future<List<ExtractModel>> getExtract(
      DateTime startDate, DateTime endDate, int typeId);
  void addIncomeExpense(
      int? type, DateTime date, String description, double amount);
}

class ExtractRepository implements IExtractRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final String baseUrl = 'https://facillita.azurewebsites.net/financial';
  final String incomeUrl = 'https://facillita.azurewebsites.net/income';
  final String expenseUrl = 'https://facillita.azurewebsites.net/expense';
  final Dio dio;

  ExtractRepository({required this.dio});

  @override
  Future<List<ExtractModel>> getExtract(
      DateTime startDate, DateTime endDate, int typeId) async {
    try {
      var uid = _auth.currentUser?.uid;
      final response = await dio
          .get<List>('$baseUrl/extract', queryParameters: <String, dynamic>{
        'userUId': uid,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'typeId': typeId
      });
      var result =
          response.data!.map((item) => ExtractModel.fromMap(item)).toList();
      return result;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('A url informada não é válida');
      } else {
        throw Exception('Não foi possivel carregar as receitas');
      }
    }
  }

  Future<void> addIncomeExpense(
      int? type, DateTime date, String description, double amount) async {
    var uid = _auth.currentUser?.uid;
    CreateIncomeModel income = CreateIncomeModel(
        incomeName: description,
        incomeAmount: amount,
        incomeDate: date,
        userUID: uid!);

    switch (type) {
      case 1:
        try {
          var response = await dio.post('$incomeUrl/add-mobile', queryParameters: <String, dynamic> {
            'incomeName': description,
            'incomeAmount': amount,
            'incomeDate': date,
            'userUID': uid!
          });
        } on DioException catch (e) {
          if (e.response?.statusCode == 404 || e.response?.statusCode == 400) {
            throw Exception('A url informada não é válida');
          } else {
            throw Exception('Não foi possivel carregar as receitas');
          }
        }
        break;
      case 2:
        try {
          var response = await dio.post('$expenseUrl/add-mobile', queryParameters: <String, dynamic> {
            'expenseName': description,
            'expenseAmount': amount,
            'expenseDate': date,
            'category': 0,
            'userUID': uid!
          });
          var test = response;
        } on DioException catch (e) {
          if (e.response?.statusCode == 404 || e.response?.statusCode == 400) {
            throw Exception('A url informada não é válida');
          } else {
            throw Exception('Não foi possivel carregar as receitas');
          }
        }
      default:
    }
  }
}
