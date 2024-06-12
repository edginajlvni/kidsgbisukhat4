import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/Bahan/my_firebase.dart';

class EditBahan extends StatefulWidget {
  const EditBahan({
    super.key,
    required this.id,
    required this.bulan,
    required this.bahan,
    required this.keterangan,
  });
  final String id;

  final String bulan;
  final String bahan;
  final String keterangan;

  @override
  State<EditBahan> createState() => _EditBahanState();
}

class _EditBahanState extends State<EditBahan> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController bulanController;
  late final TextEditingController bahanController;
  late final TextEditingController keteranganController;

  @override
  void initState() {
    bulanController = TextEditingController(text: widget.bulan);
    bahanController = TextEditingController(text: widget.bahan);
    keteranganController = TextEditingController(text: widget.keterangan);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    bulanController.dispose();
    bahanController.dispose();
    keteranganController.dispose();
  }

  void EditBahan() async {
    if (_formKey.currentState!.validate()) {
      try {
        await MyFirebase.bahansCollection.doc(widget.id).update({
          'bulan': bulanController.text.trim(),
          'bahan': bahanController.text.trim(),
          'keterangan': keteranganController.text.trim(),
        });
        Navigator.pop(context);
      } on FirebaseException {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Ggal menyunting'),
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
                  controller: bulanController,
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
                    child: const Text("Edit Bahan",
                        style: TextStyle(color: Colors.white))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
