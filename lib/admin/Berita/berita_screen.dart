import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/Berita/edit_berita.dart';
import 'package:kidsgbisukhat4/admin/Berita/my_firebase.dart';
import 'package:kidsgbisukhat4/admin/Berita/tambah_berita_screen.dart';

class BeritaScreen extends StatefulWidget {
  const BeritaScreen({Key? key}) : super(key: key);

  @override
  State<BeritaScreen> createState() => _BeritaScreenState();
}

class _BeritaScreenState extends State<BeritaScreen> {
  final bahanSnapshot = MyFirebase.newsCollection.snapshots();

  void deleteContact(String id) async {
    await MyFirebase.newsCollection.doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Berita berhasil dihapus'),
        backgroundColor: const Color.fromARGB(255, 99, 99, 99),
      ),
    );
  }

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
                  final contactId = documents[index].id;
                  final bahan = documents[index].data() as Map<String, dynamic>;
                  final String berita = bahan['berita'];
                  final String waktu = bahan['waktu'];
                  final String keterangan = bahan['keterangan'];

                  return ListTile(
                    onTap: () {},

                    title: Text("$berita",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),

                    subtitle: Text("$waktu \n$keterangan"),
                    isThreeLine: true,
                    //  trailing should be delete and edit button
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditBerita(
                                  id: contactId,
                                  berita: berita,
                                  waktu: waktu,
                                  keterangan: keterangan,
                                ),
                              ),
                            );
                          },
                          splashRadius: 24,
                          icon: const Icon(Icons.edit_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteContact(contactId);
                          },
                          splashRadius: 24,
                          icon: const Icon(Icons.delete_outline),
                        ),
                      ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TambahBerita()),
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
