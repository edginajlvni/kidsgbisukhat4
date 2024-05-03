import 'package:cloud_firestore/cloud_firestore.dart';

class  UserModel{

  final String? id;
  final String? name;
  final String? jabatan;
  final String ? email;
  final String? password;

  UserModel({
    this.id,
    this.name,
    this.email,
    this. jabatan,
    this.password,
  });
}