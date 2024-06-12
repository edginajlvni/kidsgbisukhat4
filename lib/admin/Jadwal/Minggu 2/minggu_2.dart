import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Minggu2 extends StatefulWidget {
  const Minggu2({super.key});

  @override
  State<Minggu2> createState() => _Minggu2State();
}

class _Minggu2State extends State<Minggu2> {
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
          posisi.add(e['tugas']);
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
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Minggu 2",
            style: TextStyle(
              fontSize: 20,
            )),
        centerTitle: false,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
              if (documents.isEmpty) {
                return const Center();
              }
              return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.builder(
                    itemCount: _nama.length > posisi.length
                        ? posisi.length
                        : _nama.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(posisi[index]),
                      subtitle: Text(_nama[index]),
                    ),
                  ));
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text("An Error Occured"),
              );
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }),
      bottomSheet: Container(
        height: 60,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('minggu2')
                      .doc('jadwal2')
                      .set({
                    "WL": _nama[0],
                    "Singer": _nama[1],
                    "Firman Kecil": _nama[2],
                    "Firman Besar": _nama[3],
                    "Multimedia": _nama[4],
                    "Usher": _nama[5],
                    "Doa": _nama[6],
                  });
                },
                child: const Text("Upload")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _nama.shuffle();
                  });
                },
                child: const Text("Random")),
          ],
        ),
      ),
    );
  }
}
