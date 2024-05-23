import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  // String? id;
  String? nama;
  String? email;
  String? password;
  String? jabatan;

  Timestamp? tanggalLahir;
  Timestamp? createdAt;
  Timestamp? updatedAt;

  UserModel({
    // this.id,
    this.nama,
    this.email,
    this.password,
    this.jabatan,
    this.tanggalLahir,
    this.createdAt,
    this.updatedAt,
  });
  UserModel.fromSnapshot(DocumentSnapshot data) {
    // id = data['id'] ?? '';
    nama = data['nama'] ?? '';
    email = data['email'] ?? '';
    password = data['password'] ?? '';
    jabatan = data['jabatan'] ?? '';
  }
  UserModel.fromQuerySnapshot(QueryDocumentSnapshot data) {
    // id = data['id'] ?? '';
    nama = data['nama'] ?? '';
    email = data['email'] ?? '';
    password = data['password'] ?? '';
    jabatan = data['jabatan'] ?? '';
  }
  UserModel.fromJson(Map<String, dynamic> data) {
    // id = data['id'] ?? '';
    nama = data['nama'] ?? '';
    email = data['email'] ?? '';
    jabatan = data['jabatan'] ?? '';
    password = data['password'] ?? '';

  }

  get wrool => null;
  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'nama': nama,
      'email': email,
      'jabatan': jabatan,
      'password': password,

    };
  }

  UserModel.fromSharedPref(Map<String, dynamic> data) {
    // id = data['id'];
    nama = data['nama'];
    email = data['email'];
    password = data['password'];
    jabatan = data['jabatan'];
  }
  Map<String, dynamic> toSharedPref() {
    return {
      // 'id': id,
      'nama': nama,
      'email': email,
      'jabatan': jabatan,
      'password': password,
    };
  }
}
