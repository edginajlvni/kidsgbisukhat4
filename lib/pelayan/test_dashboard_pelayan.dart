import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/screen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestPelayan extends StatefulWidget {
  const TestPelayan({super.key});

  @override
  State<TestPelayan> createState() => _TestPelayanState();
}

class _TestPelayanState extends State<TestPelayan> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  Map<String, dynamic> dataUser = {};
  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    dataUser = jsonDecode(prefs.getString('userPref')!);

    setState(() {});
  }

  logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('userPref');
    prefs.setBool('loggedIn', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat datang " + dataUser['nama']),
      ),
      body: OutlinedButton(
          onPressed: () async {
            await logout();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LogInScreen(),
                ),
                (route) => false);
          },
          child: const Text('Logout')),
    );
  }
}
