import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Minggu3 extends StatefulWidget {
  const Minggu3({Key? key}) : super(key: key);

  @override
  State<Minggu3> createState() => _Minggu3State();
}

class _Minggu3State extends State<Minggu3> {
  final List<String> _names = [];

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('users')
      .where('jabatan', isEqualTo: 'Guru')
      .snapshots();

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference tugasCollection =
      FirebaseFirestore.instance.collection('tugas_pel');

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
          tugas.add(e['tugas']);
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
  final List<String> tugas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Minggu 3",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(tugas[index]),
          subtitle: Text("Nama: " + _nama[index]),
        ),
        itemCount: _nama.length > tugas.length ? tugas.length : _nama.length,
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
