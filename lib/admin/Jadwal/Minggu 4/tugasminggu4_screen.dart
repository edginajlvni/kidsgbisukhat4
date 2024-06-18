import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/Jadwal/Minggu%204/minggu_4.dart';

class TugasMinggu4Screen extends StatefulWidget {
  const TugasMinggu4Screen({Key? key}) : super(key: key);

  @override
  State<TugasMinggu4Screen> createState() => _TugasMinggu4ScreenState();
}

class _TugasMinggu4ScreenState extends State<TugasMinggu4Screen> {
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
        title: Text("Jadwal Minggu 4"),
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
      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Minggu4()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  "Tambah",
                  style: TextStyle(color: Colors.black),
                )),
            ElevatedButton(
                onPressed: () {
                  // jadwal.removeAt(index);
                  // posisi.removeAt(index);
                  FirebaseFirestore.instance
                      .collection('jadwal')
                      .doc('minggu4')
                      .set({
                    // "WL": "-",
                    // "Singer": "-",
                    // "Firman Kecil": "-",
                    // "Firman Besar": "-",
                    // "Multimedia": "-",
                    // "Usher": "-",
                    // "Doa": "-",
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Jadwal berhasil dihapus'),
                      backgroundColor: const Color.fromARGB(255, 99, 99, 99),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  "Hapus",
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}
