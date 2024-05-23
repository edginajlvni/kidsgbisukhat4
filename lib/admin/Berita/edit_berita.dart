import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/Berita/my_firebase.dart';

class EditBerita extends StatefulWidget {
  const EditBerita({
    Key? key,
    required this.id,
    required this.berita,
    required this.waktu,
    required this.keterangan,
  }) : super(key: key);
  final String id;

  final String berita;
  final String waktu;
  final String keterangan;

  @override
  State<EditBerita> createState() => _EditBeritaState();
}

class _EditBeritaState extends State<EditBerita> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController beritaController;
  late final TextEditingController waktuController;
  late final TextEditingController keteranganController;

  @override
  void initState() {
    beritaController = TextEditingController(text: widget.berita);
    waktuController = TextEditingController(text: widget.waktu);
    keteranganController = TextEditingController(text: widget.keterangan);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    beritaController.dispose();
    waktuController.dispose();
    keteranganController.dispose();
  }

  void EditBahan() async {
    if (_formKey.currentState!.validate()) {
      try {
        await MyFirebase.newsCollection.doc(widget.id).update({
          'berita': beritaController.text.trim(),
          'waktu': waktuController.text.trim(),
          'keterangan': keteranganController.text.trim(),
        });
        Navigator.pop(context);
      } on FirebaseException {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Gagal menyunting'),
            backgroundColor: Colors.red[300],
          ),
        );
      }
    } else {
      // show snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Harap diisi'),
          backgroundColor: Colors.red[300],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Bahan"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: beritaController,
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
                  controller: waktuController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harap diisi";
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Isi - jika tidak ada";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: "Keterangan",
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
                    onPressed: EditBahan,
                    child: const Text(
                      "Edit Bahan",
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
