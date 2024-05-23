
import 'package:flutter/material.dart';

class Nama extends StatefulWidget {
  const Nama({super.key});

  @override
  State<Nama> createState() => _NamaState();
}

class _NamaState extends State<Nama> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    namaController.dispose();
  }

  // void addBahan() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       await MyFirebase.guruCollection.add({
  //         'nama': namaController.text.trim(),
  //       });
  //       Navigator.pop(context);
  //     } on FirebaseException {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: const Text('Gagal menambahkan'),
  //           backgroundColor: const Color.fromARGB(255, 0, 0, 0),
  //         ),
  //       );
  //     }
  //   } else {
  //     // show snackbar
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: const Text('Harap diisi'),
  //         backgroundColor: const Color.fromARGB(255, 0, 0, 0),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah Nama",
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
                const SizedBox(height: 20),
                TextFormField(
                  controller: namaController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Wajib diisi";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: "Nama",
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0)),
                    onPressed: (){},
                    child: const Text(
                      "Tambah Nama",
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
