import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:kidsgbisukhat4/pelayan/menu.dart';

import 'package:kidsgbisukhat4/screen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePagePelayan extends StatefulWidget {
  const HomePagePelayan({super.key});

  @override
  State<HomePagePelayan> createState() => _HomePagePelayanState();
}

class _HomePagePelayanState extends State<HomePagePelayan> {
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 5, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 15),
              child: Row(children: [
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Shallom, ",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Sansita",
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Kak " + dataUser['nama'] + "!",
                        // dataUser!['nama'],
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Ruluko",
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                    Text(
                      // ignore: prefer_interpolation_to_compose_strings
                      "Email: " + dataUser['email'],
                      style: const TextStyle(
                          fontSize: 15,
                          fontFamily: "One",
                          color: Color.fromARGB(255, 172, 172, 172)),
                    ),
                  ],
                ),
              ]),
            ),

            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Menu",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

         Menu(),

            const SizedBox(height: 40),
            InkWell(
              onTap: () {},
              child: MaterialButton(
                onPressed: () async {
                  await logout();
                  Navigator.pushAndRemoveUntil(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LogInScreen(),
                      ),
                      (route) => false);
                },
                child: Center(
                  child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Center(
                      child: Text(
                        "Keluar",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
