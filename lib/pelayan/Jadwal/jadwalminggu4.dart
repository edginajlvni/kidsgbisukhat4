import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TugasMinggu4 extends StatefulWidget {
  const TugasMinggu4({super.key});

  @override
  State<TugasMinggu4> createState() => _TugasMinggu4State();
}

class _TugasMinggu4State extends State<TugasMinggu4> {
  final Stream<QuerySnapshot> minggu4Stream =
      FirebaseFirestore.instance.collection('minggu4').snapshots();

  final CollectionReference jadwalCollection =
      FirebaseFirestore.instance.collection('jadwal');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allData();
    alltugas();
  }

  final CollectionReference tugasCollection =
      FirebaseFirestore.instance.collection('tugas_pel');

  allData() async {
    await jadwalCollection.get().then((value) => value.docs.map((e) {
          jadwal.add(e['WL']);
          jadwal.add(e['Singer']);
          jadwal.add(e['Firman Kecil']);
          jadwal.add(e['Firman Besar']);
          jadwal.add(e['Multimedia']);
          jadwal.add(e['Usher']);
          jadwal.add(e['Doa']);

          setState(() {});
        }).toList());
  }

  alltugas() async {
    await tugasCollection.get().then((value) => value.docs.map((e) {
          posisi.add(e['tugas']);
          setState(() {});
        }).toList());
  }

  // allData() async {
  //   await jadwalCollection.doc('minggu4').get().then((value) => print(value));

  //   // await jadwalCollection.get().then((value) => value.docs.map((e) {
  //   //       print(e.id);
  //   //     }).toList());
  // }

  List<String> jadwal = [];
  List<String> posisi = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jadwal Minggu 4"),
      ),
      body: jadwal.isEmpty
          ? const Center(
              child: Text('Belum ada jadwal.'),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    "${posisi[index]}: ",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("${jadwal[index]}"),

                  // title: Text("${posisi[index]}: ${jadwal[index]}"),
                ),
                itemCount: jadwal.length > posisi.length
                    ? posisi.length
                    : jadwal.length,
              ),
            ),
    );
  }
}
