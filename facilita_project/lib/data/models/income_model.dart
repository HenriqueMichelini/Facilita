// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

class IncomeModel {
  final int incomeId;
  final String incomeName;
  final double incomeAmount;
  final DateTime incomeDate;

  IncomeModel(
      {
      required this.incomeId,
      required this.incomeName,
      required this.incomeAmount,
      required this.incomeDate
      });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'incomeId': incomeId,
      'incomeName': incomeName,
      'incomeAmount': incomeAmount,
      'incomeDate': incomeDate.millisecondsSinceEpoch,
    };
  }

  factory IncomeModel.fromMap(Map<String, dynamic> map) {
    return IncomeModel(
      incomeId: map['incomeId'] as int,
      incomeName: map['incomeName'] as String,
      incomeAmount: double.parse(map['incomeAmount'].toString()),
      incomeDate: DateTime.parse(map['incomeDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory IncomeModel.fromJson(String source) => IncomeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
