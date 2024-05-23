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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allData();
    alltugas();
  }

  final CollectionReference jadwalCollection =
      FirebaseFirestore.instance.collection('jadwal');

  final CollectionReference tugasCollection =
      FirebaseFirestore.instance.collection('tugas_pel');

  allData() async {
    await jadwalCollection.get().then((value) => value.docs.map((e) {
          jadwal.add(e['WL']);
          jadwal.add(e['Singer']);
          jadwal.add(e['Firman Kecil']);

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
              child: Text('Belum Ada Data'),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  title: Text("${posisi[index]}: ${jadwal[index]}"),
                ),
                itemCount: jadwal.length > posisi.length
                    ? posisi.length
                    : jadwal.length,
              ),
            ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Minggu4()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
