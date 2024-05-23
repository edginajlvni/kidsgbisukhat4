import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Minggu1 extends StatefulWidget {
  const Minggu1({Key? key}) : super(key: key);

  @override
  State<Minggu1> createState() => _Minggu1State();
}

class _Minggu1State extends State<Minggu1> {
  final List<String> _names = [];

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .where('jabatan', isEqualTo: 'Guru')
      .snapshots();

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference tugasCollection =
      FirebaseFirestore.instance.collection('tugas');

  // Future<List<String>> alluser () async {
  //   List <String> data = await usersCollection.get().then((value) => value.docs.map((e) => print(e)).toList());

  // }
  alluser() async {
    await usersCollection.get().then((value) => value.docs.map((e) {
          if (e['jabatan'] != 'Admin') {
            _nama.add(e['nama']);
            setState(() {});
          }
        }).toList());
  }

  alltugas() async {
    await tugasCollection.get().then((value) => value.docs.map((e) {
          posisi.add(e['name']);
          setState(() {});
        }).toList());
  }

  @override
  void initState() {
    super.initState();
    alluser();
    alltugas();
  }

  final List<String> _nama = [];
  final List<String> posisi = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Minggu 1",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(_nama[index]),
          subtitle: Text(posisi[index]),
        ),
        itemCount: _nama.length > posisi.length ? posisi.length : _nama.length,
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            setState(() {
              _nama.shuffle();
            });
          },
          child: const Text("Random")),
    );
  }
}
