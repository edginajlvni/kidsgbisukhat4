import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/Bahan/my_firebase.dart';
import 'package:url_launcher/url_launcher.dart';

class Bahan_Mengajar extends StatefulWidget {
  const Bahan_Mengajar({super.key});

  @override
  State<Bahan_Mengajar> createState() => _Bahan_MengajarState();
}

class _Bahan_MengajarState extends State<Bahan_Mengajar> {
  final bahanSnapshot = MyFirebase.bahansCollection.snapshots();
  // final Uri _url = Uri.parse('https://flutter.dev');

  void deleteContact(String id) async {
    await MyFirebase.bahansCollection.doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Bahan berhasil dihapus'),
        backgroundColor: Color.fromARGB(255, 99, 99, 99),
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
                  final bahan = documents[index].data() as Map<String, dynamic>;
                  final String bulan = bahan['bulan'];
                  final String bahan2 = bahan['bahan'];
                  final String keterangan = bahan['keterangan'];

                  return ListTile(
                    onTap: () {},

                    title: Text("Bulan: $bulan",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),

                    subtitle: GestureDetector(
                      onTap: () async {
                        if (!await launchUrl(
                            Uri.parse(bahan2))) {
                          throw Exception('Could not launch $bahan2');
                        }
                      },
                      child: Text(
                          "$bahan2 \n$keterangan"
                          ),
                    ),
                    isThreeLine: true,
                    //  trailing should be delete and edit button
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
