import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Minggu4 extends StatefulWidget {
  const Minggu4({Key? key}) : super(key: key);

  @override
  State<Minggu4> createState() => _Minggu4State();
}

class _Minggu4State extends State<Minggu4> {
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

  // final CollectionReference minggu4 =
  //     FirebaseFirestore.instance.collection('minggu4');

  // final wlController = TextEditingController();
  // final singerController = TextEditingController();
  // final firmankecilController = TextEditingController();
  // final firmanbesarController = TextEditingController();
  // final mulmedController = TextEditingController();
  // final usherController = TextEditingController();
  // final doaController = TextEditingController();
  // final seragamController = TextEditingController();

  final List<String> _nama = [];
  final List<String> posisi = [];

  // Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
  //   await showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (BuildContext ctx) {
  //         return Padding(
  //           padding: EdgeInsets.only(
  //               top: 20,
  //               right: 20,
  //               left: 20,
  //               bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               const Center(
  //                 child: Text(
  //                   "Masukkan Jadwal",
  //                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  //                 ),
  //               ),
  //               TextField(
  //                 controller: wlController,
  //                 decoration: const InputDecoration(
  //                   labelText: 'WL',
  //                 ),
  //               ),
  //               TextField(
  //                 controller: singerController,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Singer',
  //                 ),
  //               ),
  //               TextField(
  //                 controller: firmankecilController,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Firman Kelas Kecil',
  //                 ),
  //               ),
  //               TextField(
  //                 controller: firmanbesarController,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Firman Kelas Besar',
  //                 ),
  //               ),
  //               TextField(
  //                 controller: mulmedController,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Multimedia',
  //                 ),
  //               ),
  //               TextField(
  //                 controller: usherController,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Usher',
  //                 ),
  //               ),
  //               TextField(
  //                 controller: seragamController,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Seragam',
  //                 ),
  //               ),
  //               TextField(
  //                 controller: doaController,
  //                 decoration: const InputDecoration(
  //                   labelText: 'Doa',
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 10,
  //               ),
  //               Center(
  //                 child: ElevatedButton(
  //                     onPressed: () async {
  //                       final String wl = wlController.text;
  //                       final String singer = singerController.text;
  //                       final String firmankecil = firmankecilController.text;
  //                       final String firmanbesar = firmanbesarController.text;
  //                       final String multimedia = mulmedController.text;
  //                       final String usher = usherController.text;
  //                       final String doa = doaController.text;
  //                       final String seragam = seragamController.text;

  //                       await minggu4.add({
  //                         "WL": wl,
  //                         "Singer": singer,
  //                         "Firman Kecil": firmankecil,
  //                         "FIrman Besar": firmanbesar,
  //                         "Multimedia": multimedia,
  //                         "Usher": usher,
  //                         "Doa": doa,
  //                         "Seragam": seragam,
  //                       });
  //                       wlController.text = '';
  //                       singerController.text = '';
  //                       firmankecilController.text = '';
  //                       firmanbesarController.text = '';
  //                       mulmedController.text = '';
  //                       usherController.text = '';
  //                       doaController.text = '';
  //                       seragamController.text = '';

  //                       Navigator.of(context).pop();
  //                     },
  //                     child: const Text("Create")),
  //               )
  //             ],
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Minggu 4",
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
                      // trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      //   IconButton(
                      //     onPressed: () {},
                      //     splashRadius: 24,
                      //     icon: const Icon(Icons.add_outlined),
                      //   ),
                      // ]),
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
                      .collection('jadwal')
                      .doc('minggu4')
                      .set({
                    "WL": _nama[0],
                    "Singer": _nama[1],
                    "Firman Kecil":_nama[2],
                    "Firman Besar": '',
                    "Multimedia": '',
                    "Usher": '',
                    "Doa": ''
                  });
                },
                child: const Text("Tambah")),
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
