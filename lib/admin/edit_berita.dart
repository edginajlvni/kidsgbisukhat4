import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/kelola_berita.dart';

class EditBerita extends StatefulWidget {
  DocumentSnapshot docid;
  EditBerita({super.key, required this.docid});
  @override
  State<EditBerita> createState() => _EditBeritaState();
}

class _EditBeritaState extends State<EditBerita> {
   TextEditingController namakegiatan = TextEditingController();
  TextEditingController waktu = TextEditingController();
  TextEditingController keterangan = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final bool _isObscure = true;

  @override
  void initState() {
    namakegiatan = TextEditingController(text: widget.docid.get('nama'));
    waktu = TextEditingController(text: widget.docid.get('waktu'));

    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    namakegiatan.dispose();
    waktu.dispose();
    keterangan.dispose();
    super.dispose();
  }

  clearText() {
    namakegiatan.clear();
    waktu.clear();
    keterangan.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const Kelola_Berita()));
              });
            },
            child: const Text("Hapus"),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 5, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //email
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: namakegiatan,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be empty";
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please enter a valid email");
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {},
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: TextFormField(
                    controller: waktu,
                    decoration: InputDecoration(
                      labelText: 'password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be empty";
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please enter a valid email");
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
