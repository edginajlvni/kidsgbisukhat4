import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditData extends StatefulWidget {
  DocumentSnapshot docid;
  EditData({super.key, required this.docid});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController jabatan = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final bool _isObscure = true;

  @override
  void initState() {
    password = TextEditingController(text: widget.docid.get('jabatan'));
    email = TextEditingController(text: widget.docid.get('email'));

    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nama.dispose();
    email.dispose();
    password.dispose();
    jabatan.dispose();
    super.dispose();
  }

  clearText() {
    nama.clear();
    email.clear();
    password.clear();
    jabatan.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          // MaterialButton(
          //   onPressed: () {
          //     widget.docid.reference.delete().whenComplete(() {
          //       Navigator.pushReplacement(context,
          //           MaterialPageRoute(builder: (_) => const Kelola_Data()));
          //     });
          //   },
          //   child: const Text("Hapus"),
          // ),
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
                    controller: email,
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
                    controller: password,
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
