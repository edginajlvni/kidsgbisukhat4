import 'package:cloud_firestore/cloud_firestore.dart';

abstract class MyFirebaseMinggu4 {
  static final _db = FirebaseFirestore.instance;
  static final jadwaCollection = _db.collection('jadwal');
}
