import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/DataPelayan/my_firebase.dart';
import 'package:kidsgbisukhat4/admin/DataPelayan/tambahpelayan.dart';

class DataGuru extends StatefulWidget {
  const DataGuru({super.key});

  @override
  State<DataGuru> createState() => _DataGuruState();
}

class _DataGuruState extends State<DataGuru> {
  final usersSnapshot = MyFirebase.usersCollection.snapshots();

  void deleteContact(String id) async {
    await MyFirebase.usersCollection.doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data guru berhasil dihapus'),
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
        title: const Text("Data Pelayan",
            style: TextStyle(
              fontSize: 20,
            )),
        centerTitle: false,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: usersSnapshot,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
              if (documents.isEmpty) {
                return Center(
                  child: Text(
                    "Tidak ada data.",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              }
              return ListView.builder(
                itemCount: documents.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final contactId = documents[index].id;
                  final users = documents[index].data() as Map<String, dynamic>;
                  final String email = users['email'];
                  final String nama = users['nama'];

                  return ListTile(
                    onTap: () {},

                    title: Text(email,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),

                    subtitle: Text(nama),
                    isThreeLine: true,
                    //  trailing should be delete and edit button
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
            MaterialPageRoute(builder: (context) => const TambahDataPelayan()),
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
