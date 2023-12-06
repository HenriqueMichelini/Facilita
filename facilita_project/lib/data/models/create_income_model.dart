// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

class CreateIncomeModel {
  final String incomeName;
  final double incomeAmount;
  final DateTime incomeDate;
  final String userUID;

  CreateIncomeModel(
      {
      required this.incomeName,
      required this.incomeAmount,
      required this.incomeDate,
      required this.userUID,
      });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'incomeName': incomeName,
      'incomeAmount': incomeAmount,
      'incomeDate': incomeDate.millisecondsSinceEpoch,
      'userUID': userUID,
    };
  }

  factory CreateIncomeModel.fromMap(Map<String, dynamic> map) {
    return CreateIncomeModel(
      incomeName: map['incomeName'] as String,
      incomeAmount: double.parse(map['incomeAmount'].toString()),
      incomeDate: DateTime.parse(map['incomeDate']),
      userUID: map['userUID'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateIncomeModel.fromJson(String source) => CreateIncomeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
