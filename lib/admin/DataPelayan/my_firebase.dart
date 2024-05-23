import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MyFirebase {
  static final _db = FirebaseFirestore.instance;
  static final usersCollection = _db.collection('users');
}
