import 'dart:convert';

import 'package:facilita_project/enums/extract_Type.dart';

class ExtractModel {
  final String name;
  final double amount;
  final int typeId;

  ExtractModel({required this.name, required this.amount, required this.typeId});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'amount': amount,
      'typeId': typeId,
    };
  }

  factory ExtractModel.fromMap(Map<String, dynamic> map) {
    var result = ExtractModel(
      name: map['name'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      typeId: map['typeId'] as int,
    );

    return result;
  }

  String toJson() => json.encode(toMap());

  factory ExtractModel.fromJson(String source) => ExtractModel.fromMap(json.decode(source));
}
