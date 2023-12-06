import 'dart:convert';

import 'package:facilita_project/enums/extract_Type.dart';

class UserModel {
  final String userName;
  final String email;
  final String uid;

  UserModel({required this.userName, required this.email, required this.uid});

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    var result = UserModel(
      userName: map['userName'],
      email: map['email']?.toDouble() ?? 0.0,
      uid: map['uid'],
    );

    return result;
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
