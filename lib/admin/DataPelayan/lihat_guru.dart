import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/DataPelayan/my_firebase.dart';

class lihatguru extends StatefulWidget {
  const lihatguru({
    Key? key,
    required this.id,
    required this.nama,
    required this.email,
    required this.password,
  }) : super(key: key);
  final String id;

  final String nama;
  final String email;
  final String password;

  @override
  State<lihatguru> createState() => _lihatguruState();
}

class _lihatguruState extends State<lihatguru> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController namaController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    namaController = TextEditingController(text: widget.nama);
    emailController = TextEditingController(text: widget.email);
    passwordController = TextEditingController(text: widget.password);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    namaController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void lihatguru() async {
    if (_formKey.currentState!.validate()) {
      try {
        await MyFirebase.usersCollection.doc(widget.id).update({
          'nama': namaController.text.trim(),
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
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
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(14),
        children: [
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: namaController,
                  enabled: false,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: "Nama",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  enabled: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: "Email",
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  enabled: false,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    hintText: "Password",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
