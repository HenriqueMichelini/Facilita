import 'dart:convert';

class FinancialModel {
  final double totalIncome;
  final double totalExpense;
  final double balance;

  FinancialModel({
    required this.totalIncome,
    required this.totalExpense,
    required this.balance});

  Map<String, dynamic> toMap() {
    return {
      'totalIncome': totalIncome,
      'totalExpense': totalExpense,
      'balance': balance,
    };
  }

  factory FinancialModel.fromMap(Map<String, Object?> map) {
    return FinancialModel(
      totalIncome: (map['totalIncome'] as num?)?.toDouble() ?? 0.0,
      totalExpense: (map['totalExpense'] as num?)?.toDouble() ?? 0.0,
      balance: (map['balance'] as num?)?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory FinancialModel.fromJson(String source) => FinancialModel.fromMap(json.decode(source));
}
