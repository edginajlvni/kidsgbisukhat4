import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/Berita/my_firebase.dart';

class TambahBerita extends StatefulWidget {
  const TambahBerita({Key? key}) : super(key: key);

  @override
  State<TambahBerita> createState() => _TambahBeritaState();
}

class _TambahBeritaState extends State<TambahBerita> {
  final _formKey = GlobalKey<FormState>();
  final beritaController = TextEditingController();
  final waktuController = TextEditingController();
  final keteranganController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    beritaController.dispose();
    waktuController.dispose();
    keteranganController.dispose();
  }

  void addBerita() async {
    if (_formKey.currentState!.validate()) {
      try {
        await MyFirebase.newsCollection.add({
          'berita': beritaController.text.trim(),
          'waktu': waktuController.text.trim(),
          'keterangan': keteranganController.text.trim(),
        });
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
          "Tambah Berita",
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
                  controller: beritaController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harap diisi";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: "Berita",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: waktuController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harap  diisi";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Waktu",
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
                    onPressed: addBerita,
                    child: const Text(
                      "Tambah Berita",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
