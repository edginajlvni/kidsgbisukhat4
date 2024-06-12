import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/Berita/my_firebase.dart';

class BeritaPelayan extends StatefulWidget {
  const BeritaPelayan({super.key});

  @override
  State<BeritaPelayan> createState() => _BeritaPelayanState();
}

class _BeritaPelayanState extends State<BeritaPelayan> {
  final bahanSnapshot = MyFirebase.newsCollection.snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Berita",
            style: TextStyle(
              fontSize: 20,
            )),
        centerTitle: false,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: bahanSnapshot,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
              if (documents.isEmpty) {
                return Center(
                  child: Text(
                    "Belum ada berita tersedia.",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              }
              return ListView.builder(
                itemCount: documents.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final bahan = documents[index].data() as Map<String, dynamic>;
                  final String berita = bahan['berita'];
                  final String waktu = bahan['waktu'];
                  final String keterangan = bahan['keterangan'];

                  return ListTile(
                    onTap: () {},

                    title: Text(berita,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),

                    subtitle: Text("$waktu \n$keterangan"),
                    isThreeLine: true,
                    //  trailing should be delete and edit button
                    trailing: const Row(
                      mainAxisSize: MainAxisSize.min,
                    ),
                  );
                },
              );
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
    );
  }
}
