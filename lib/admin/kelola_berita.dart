import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/buatberita.dart';
import 'package:kidsgbisukhat4/admin/edit_berita.dart';

class Kelola_Berita extends StatefulWidget {
  const Kelola_Berita({super.key});

  @override
  State<Kelola_Berita> createState() => _Kelola_BeritaState();
}

class _Kelola_BeritaState extends State<Kelola_Berita> {
  final Stream<QuerySnapshot> _beritaStream =
      FirebaseFirestore.instance.collection('berita').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Daftar Berita",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BuatBerita()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: StreamBuilder(
          stream: _beritaStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("something is wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                EditBerita(docid: snapshot.data!.docs[index]),
                          ),
                        );
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 15, right: 15),
                        child: Column(
                          children: [
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                    Text(
                                      "Judul: " +
                                          snapshot.data!.docChanges[index]
                                              .doc['nama'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "Waktu Kegiatan: " +
                                          snapshot.data!.docChanges[index]
                                              .doc['waktu'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "Keterangan: " +
                                          snapshot.data!.docChanges[index]
                                              .doc['keterangan'],
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ));
          }),
    );
  }
}
