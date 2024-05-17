import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tambah_Bahan extends StatefulWidget {
  const Tambah_Bahan({super.key});

  @override
  State<Tambah_Bahan> createState() => _Tambah_BahanState();
}

class _Tambah_BahanState extends State<Tambah_Bahan> {
  final bulanController = TextEditingController();
  final bahanController = TextEditingController();
  final keteranganController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var bulan = "";
  var bahan = "";
  var keterangan = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    bulanController.dispose();
    bahanController.dispose();
    keteranganController.dispose();
    super.dispose();
  }

  clearText() {
    bulanController.clear();
    bahanController.clear();
    keteranganController.clear();
  }

  // Adding Student
  CollectionReference students = FirebaseFirestore.instance.collection('bahan');
  Future<void> addBahan() {
    return students
        .add({'bulan': bulan, 'bahan': bahan, 'keterangan': keterangan})
        .then((value) => print('Bahan Added'))
        .catchError((error) => print('Failed to Add bahan: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Tambah Bahan",
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
                        "Bulan",
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
                    controller: bulanController,
                    decoration: const InputDecoration(
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

                //input link bahan
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15),
                  child: const Column(
                    children: [
                      Text(
                        "Link Bahan",
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
                    controller: bahanController,
                    decoration: const InputDecoration(
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
                              setState(() {
                                bulan = bulanController.text;
                                bahan = bahanController.text;
                                keterangan = keteranganController.text;
                                addBahan();
                                clearText();
                              });
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
