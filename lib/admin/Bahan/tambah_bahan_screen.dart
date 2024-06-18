import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/Bahan/my_firebase.dart';

class TambahBahan extends StatefulWidget {
  const TambahBahan({Key? key}) : super(key: key);

  @override
  State<TambahBahan> createState() => _TambahBahanState();
}

class _TambahBahanState extends State<TambahBahan> {
  final _formKey = GlobalKey<FormState>();
  final bulanController = TextEditingController();
  final bahanController = TextEditingController();
  final keteranganController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    bulanController.dispose();
    bahanController.dispose();
    keteranganController.dispose();
  }

  void addBahan() async {
    if (_formKey.currentState!.validate()) {
      try {
        await MyFirebase.bahansCollection.add({
          'bulan': bulanController.text.trim(),
          'bahan': bahanController.text.trim(),
          'keterangan': keteranganController.text.trim(),
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Bahan berhasil ditambahkan'),
            backgroundColor: const Color.fromARGB(255, 99, 99, 99),
          ),
        );
        Navigator.pop(context);
      } on FirebaseException {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Gagal menambahkan'),
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          ),
        );
      }
    } else {
      // show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Harap diisi'),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah Bahan",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: bulanController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harap diisi";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: "Bulan",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: bahanController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harap  diisi";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Bahan",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: keteranganController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Isi '-' jika tidak ada";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: "Keterangan",
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
                    onPressed: addBahan,
                    child: const Text("Tambah Bahan",
                        style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
