import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/Berita/my_firebase.dart';
import 'package:kidsgbisukhat4/admin/dashboardadmin.dart';

class BuatBerita extends StatefulWidget {
  const BuatBerita({super.key});

  @override
  State<BuatBerita> createState() => _BuatBeritaState();
}

class _BuatBeritaState extends State<BuatBerita> {
  final namakegiatanController = TextEditingController();
  final waktuController = TextEditingController();
  final keteranganController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var namakegiatan = "";
  var waktu = "";
  var keterangan = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    namakegiatanController.dispose();
    waktuController.dispose();
    keteranganController.dispose();
    super.dispose();
  }

  clearText() {
    namakegiatanController.clear();
    waktuController.clear();
    keteranganController.clear();
  }

//tambah berita
  CollectionReference berita = FirebaseFirestore.instance.collection('berita');

  void addBerita() async {
    if (_formKey.currentState!.validate()) {
      try {
        await MyFirebase.contactsCollection.add({
          'nama': namakegiatanController.text.trim(),
          'waktu': waktuController.text.trim(),
          'keterangan': keteranganController.text.trim(),
        });
        Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const DashboardAdmin()));
      } on FirebaseException {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Failed to add contact'),
            backgroundColor: Colors.red[300],
          ),
        );
      }
    } else {
      // show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please fill all the fields'),
          backgroundColor: Colors.red[300],
        ),
      );
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Tambah Berita",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 5, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //input nama bulan

                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15),
                  child: const Column(
                    children: [
                      Text(
                        "Nama Kegiatan",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 12, 12, 12),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: namakegiatanController,
                    decoration: const InputDecoration(
                      hintText: 'eg. Ultah cabang Sukhat 4',
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Harap diisi";
                      }
                      return null;
                    },
                    onChanged: (value) {},
                  ),
                ),

                //waktu
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15),
                  child: const Column(
                    children: [
                      Text(
                        "Waktu Kegiatan",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 12, 12, 12),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: waktuController,
                    decoration: const InputDecoration(
                        hintText: 'diisi hari, tgl kegiatan',
                        border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            //borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(color: Colors.black))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Harap diisi";
                      }
                      return null;
                    },
                    onChanged: (value) {},
                  ),
                ),

                //input keterangan
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15),
                  child: const Column(
                    children: [
                      Text(
                        "Keterangan",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 12, 12, 12),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: keteranganController,
                    decoration: const InputDecoration(
                        hintText: 'detail keg. spt jam ibadah / lainnya',
                        border: OutlineInputBorder(
                          // borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            //borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(color: Colors.black))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Harap diisi";
                      }
                      return null;
                    },
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              addBerita();
                              clearText();
                            }
                          },
                          child: Center(
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                borderRadius: BorderRadius.circular(90),
                              ),
                              child: const Center(
                                child: Text("Tambah",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: MaterialButton(
                          onPressed: () => {clearText()},
                          child: Center(
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                borderRadius: BorderRadius.circular(90),
                              ),
                              child: const Center(
                                child: Text("Hapus",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
