import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? jabatan;

  Timestamp? tanggalLahir;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.jabatan,
    this.tanggalLahir,
    this.createdAt,
    this.updatedAt,
  });
  UserModel.fromSnapshot(DocumentSnapshot data) {
    id = data['id'] ?? '';
    name = data['name'] ?? '';
    email = data['email'] ?? '';
    password = data['password'] ?? '';
    jabatan = data['jabatan'] ?? '';
  }
  UserModel.fromQuerySnapshot(QueryDocumentSnapshot data) {
    id = data['id'] ?? '';
    name = data['name'] ?? '';
    email = data['email'] ?? '';
    password = data['password'] ?? '';
    jabatan = data['jabatan'] ?? '';
  }
  UserModel.fromJson(Map<String, dynamic> data) {
    id = data['id'] ?? '';
    name = data['name'] ?? '';
    email = data['email'] ?? '';
    jabatan = data['jabatan'] ?? '';
    password = data['password'] ?? '';

  }

  get wrool => null;
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'jabatan': jabatan,
      'password': password,

    };
  }

  UserModel.fromSharedPref(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    email = data['email'];
    password = data['password'];
    jabatan = data['jabatan'];
  }
  Map<String, dynamic> toSharedPref() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'jabatan': jabatan,
      'password': password,
    };
  }
}
