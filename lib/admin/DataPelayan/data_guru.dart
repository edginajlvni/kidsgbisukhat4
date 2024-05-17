import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/tambahpelayan.dart';

class DataGuru extends StatefulWidget {
  const DataGuru({super.key});

  @override
  State<DataGuru> createState() => _DataGuruState();
}

class _DataGuruState extends State<DataGuru> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController jabatanController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  String searchText = '';

  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  bool isSearchClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        title: isSearchClicked
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 253, 253, 253),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      hintText: 'Search..'),
                ),
              )
            : const Text('Data Pelayan'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearchClicked = !isSearchClicked;
                });
              },
              icon: Icon(isSearchClicked ? Icons.close : Icons.search))
        ],
      ),
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
      body: StreamBuilder(
          stream: _users.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            final List<DocumentSnapshot> users = streamSnapshot.data!.docs
                .where((doc) => doc['nama'].toLowerCase().contains(
                      searchText.toLowerCase(),
                    ))
                .toList();
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot = users[index];
                return Container(
                  color: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 15, right: 15),
                    child: Column(
                      children: [
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                documentSnapshot['email'],
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                documentSnapshot['jabatan'],
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
