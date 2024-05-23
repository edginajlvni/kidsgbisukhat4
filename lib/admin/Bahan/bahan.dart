import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/Bahan/edit_bahan.dart';
import 'package:kidsgbisukhat4/admin/Bahan/my_firebase.dart';
import 'package:kidsgbisukhat4/admin/Bahan/tambah_bahan_screen.dart';

class BahanMengajar extends StatefulWidget {
  const BahanMengajar({Key? key}) : super(key: key);

  @override
  State<BahanMengajar> createState() => _BahanMengajarState();
}

class _BahanMengajarState extends State<BahanMengajar> {
  final bahanSnapshot = MyFirebase.bahansCollection.snapshots();

  void deleteContact(String id) async {
    await MyFirebase.bahansCollection.doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Bahan berhasil dihapus'),
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
        title: const Text("Bahan Mengajar",
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
                    "Belum ada bahan tersedia",
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
                  final String bulan = bahan['bulan'];
                  final String bahan2 = bahan['bahan'];
                  final String keterangan = bahan['keterangan'];

                  return ListTile(
                    onTap: () {},

                    title: Text("Bulan: $bulan",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        )),

                    subtitle: Text("$bahan2 \n$keterangan"),
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
                                builder: (context) => EditBahan(
                                  id: contactId,
                                  bulan: bulan,
                                  bahan: bahan2,
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
            MaterialPageRoute(builder: (context) => const TambahBahan()),
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
