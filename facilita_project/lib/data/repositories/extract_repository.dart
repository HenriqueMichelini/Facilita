import 'package:dio/dio.dart';
import 'package:facilita_project/data/models/extract_model.dart';
import 'package:facilita_project/enums/extract_Type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

abstract class IExtractRepository {
  Future<List<ExtractModel>> getExtract(DateTime startDate, DateTime endDate, int typeId);
}

class ExtractRepository implements IExtractRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final String baseUrl = 'https://facillita.azurewebsites.net/financial';
  final Dio dio;

  ExtractRepository({required this.dio});

  @override
  Future<List<ExtractModel>> getExtract(DateTime startDate, DateTime endDate, int typeId) async {
    try {
      var uid = _auth.currentUser?.uid;
      final response = await dio.get<List>('$baseUrl/extract', queryParameters: <String, dynamic>{'userUId':uid, 'startDate':startDate.toIso8601String(), 'endDate':endDate.toIso8601String(), 'typeId':typeId});
      var result = response.data!.map((item) => ExtractModel.fromMap(item)).toList();
      return result;
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