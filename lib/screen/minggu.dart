import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/screen/tugas.dart';

class Minggu_1 extends StatefulWidget {
  const Minggu_1({super.key});

  @override
  State<Minggu_1> createState() => _Minggu_1State();
}

class _Minggu_1State extends State<Minggu_1> {
  @override
  Widget build(BuildContext context) {
    return const tugas();
  }
}

class Minggu_2 extends StatefulWidget {
  const Minggu_2({super.key});

  @override
  State<Minggu_2> createState() => _Minggu_2State();
}

class _Minggu_2State extends State<Minggu_2> {
  @override
  Widget build(BuildContext context) {
    return const tugas();
  }
}

class Minggu_3 extends StatefulWidget {
  const Minggu_3({super.key});

  @override
  State<Minggu_3> createState() => _Minggu_3State();
}

class _Minggu_3State extends State<Minggu_3> {
  @override
  Widget build(BuildContext context) {
    return const tugas();
  }
}

class Minggu_4 extends StatefulWidget {
  const Minggu_4({super.key});

  @override
  State<Minggu_4> createState() => _Minggu_4State();
}

class _Minggu_4State extends State<Minggu_4> {
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
      body: jadwal.isEmpty
          ? const Center(
              child: Text('Belum Ada Data'),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 10),
              child: StreamBuilder(
                  stream: minggu4Stream,
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        title: Text("${posisi[index]}: ${jadwal[index]}"),
                      ),
                      itemCount: jadwal.length > posisi.length
                          ? posisi.length
                          : jadwal.length,
                    );
                  }),
            ),

      // body: StreamBuilder(
      //     stream: minggu4Stream,
      //     builder:
      //         (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (snapshot.hasError) {
      //         return const Text("something is wrong");
      //       }
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       }
      //       return ListView.builder(
      //         itemCount: snapshot.data!.docs.length,
      //         itemBuilder: (_, index) {
      //           return Padding(
      //             padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      //             child: Column(
      //               children: [
      //                 Material(
      //                   elevation: 5,
      //                   borderRadius: BorderRadius.circular(10),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Row(
      //                         children: [
      //                           Padding(
      //                             padding:
      //                                 const EdgeInsets.only(top: 10, left: 15),
      //                             child: Column(
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                               children: [
      //                                 Text(
      //                                   "WL: " +
      //                                       snapshot.data!.docChanges[index]
      //                                           .doc['WL'],
      //                                   style: TextStyle(
      //                                       fontSize: 15,
      //                                       fontWeight: FontWeight.bold,
      //                                       color:
      //                                           Color.fromARGB(255, 0, 0, 0)),
      //                                 ),
      //                                 const SizedBox(height: 10),
      //                               ],
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(height: 20),
      //                 Material(
      //                   elevation: 5,
      //                   borderRadius: BorderRadius.circular(10),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Row(
      //                         children: [
      //                           Padding(
      //                             padding:
      //                                 const EdgeInsets.only(top: 10, left: 15),
      //                             child: Column(
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                               children: [
      //                                 Text(
      //                                   "Firman Kecil: " +
      //                                       snapshot.data!.docChanges[index]
      //                                           .doc['Firman Kecil'],
      //                                   style: TextStyle(
      //                                       fontSize: 15,
      //                                       fontWeight: FontWeight.bold,
      //                                       color:
      //                                           Color.fromARGB(255, 0, 0, 0)),
      //                                 ),
      //                                 const SizedBox(height: 10),
      //                               ],
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(height: 20),
      //                 Material(
      //                   elevation: 5,
      //                   borderRadius: BorderRadius.circular(10),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Row(
      //                         children: [
      //                           Padding(
      //                             padding:
      //                                 const EdgeInsets.only(top: 10, left: 15),
      //                             child: Column(
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                               children: [
      //                                 Text(
      //                                   "Singer: " +
      //                                       snapshot.data!.docChanges[index]
      //                                           .doc['Singer'],
      //                                   style: TextStyle(
      //                                       fontSize: 15,
      //                                       fontWeight: FontWeight.bold,
      //                                       color:
      //                                           Color.fromARGB(255, 0, 0, 0)),
      //                                 ),
      //                                 const SizedBox(height: 10),
      //                               ],
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(height: 20),
      //                 Material(
      //                   elevation: 5,
      //                   borderRadius: BorderRadius.circular(10),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Row(
      //                         children: [
      //                           Padding(
      //                             padding:
      //                                 const EdgeInsets.only(top: 10, left: 15),
      //                             child: Column(
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                               children: [
      //                                 Text(
      //                                   "Singer: " +
      //                                       snapshot.data!.docChanges[index]
      //                                           .doc['Singer'],
      //                                   style: TextStyle(
      //                                       fontSize: 15,
      //                                       fontWeight: FontWeight.bold,
      //                                       color:
      //                                           Color.fromARGB(255, 0, 0, 0)),
      //                                 ),
      //                                 const SizedBox(height: 10),
      //                               ],
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(height: 20),
      //                 Material(
      //                   elevation: 5,
      //                   borderRadius: BorderRadius.circular(10),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Row(
      //                         children: [
      //                           Padding(
      //                             padding:
      //                                 const EdgeInsets.only(top: 10, left: 15),
      //                             child: Column(
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                               children: [
      //                                 Text(
      //                                   "Singer: " +
      //                                       snapshot.data!.docChanges[index]
      //                                           .doc['Singer'],
      //                                   style: TextStyle(
      //                                       fontSize: 15,
      //                                       fontWeight: FontWeight.bold,
      //                                       color:
      //                                           Color.fromARGB(255, 0, 0, 0)),
      //                                 ),
      //                                 const SizedBox(height: 10),
      //                               ],
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(height: 20),
      //                 Material(
      //                   elevation: 5,
      //                   borderRadius: BorderRadius.circular(10),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Row(
      //                         children: [
      //                           Padding(
      //                             padding:
      //                                 const EdgeInsets.only(top: 10, left: 15),
      //                             child: Column(
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                               children: [
      //                                 Text(
      //                                   "Singer: " +
      //                                       snapshot.data!.docChanges[index]
      //                                           .doc['Singer'],
      //                                   style: TextStyle(
      //                                       fontSize: 15,
      //                                       fontWeight: FontWeight.bold,
      //                                       color:
      //                                           Color.fromARGB(255, 0, 0, 0)),
      //                                 ),
      //                                 const SizedBox(height: 10),
      //                               ],
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //                 SizedBox(height: 20),
      //                 Material(
      //                   elevation: 5,
      //                   borderRadius: BorderRadius.circular(10),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Row(
      //                         children: [
      //                           Padding(
      //                             padding:
      //                                 const EdgeInsets.only(top: 10, left: 15),
      //                             child: Column(
      //                               crossAxisAlignment:
      //                                   CrossAxisAlignment.start,
      //                               children: [
      //                                 Text(
      //                                   "Singer: " +
      //                                       snapshot.data!.docChanges[index]
      //                                           .doc['Singer'],
      //                                   style: TextStyle(
      //                                       fontSize: 15,
      //                                       fontWeight: FontWeight.bold,
      //                                       color:
      //                                           Color.fromARGB(255, 0, 0, 0)),
      //                                 ),
      //                                 const SizedBox(height: 10),
      //                               ],
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           );
      //         },
      //       );
      //     }),
    );
  }
}

class Minggu_5 extends StatefulWidget {
  const Minggu_5({super.key});

  @override
  State<Minggu_5> createState() => _Minggu_5State();
}

class _Minggu_5State extends State<Minggu_5> {
  final Stream<QuerySnapshot> minggu5Stream =
      FirebaseFirestore.instance.collection('jadwal5').snapshots();
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
      body: jadwal.isEmpty
          ? const Center(
              child: Text('Belum Ada Data'),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 10),
              child: StreamBuilder(
                  stream: minggu5Stream,
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        title: Text("${posisi[index]}: ${jadwal[index]}"),
                      ),
                      itemCount: jadwal.length > posisi.length
                          ? posisi.length
                          : jadwal.length,
                    );
                  }),
            ),
    );
  }
}
