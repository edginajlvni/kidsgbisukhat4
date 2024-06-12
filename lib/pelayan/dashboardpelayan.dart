import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/pelayan/berita_page.dart';
import 'package:kidsgbisukhat4/pelayan/jadwalpelayanan.dart';
import 'package:kidsgbisukhat4/pelayan/pengajuan.dart';
import 'package:kidsgbisukhat4/pelayan/profilpelayan.dart';
import 'package:kidsgbisukhat4/pelayan/unduhbahan.dart';
import 'package:kidsgbisukhat4/screen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPelayan extends StatefulWidget {
  const DashboardPelayan({super.key,});

  @override
  State<DashboardPelayan> createState() => _DashboardPelayanState();
}

class _DashboardPelayanState extends State<DashboardPelayan> {
  // final user = FirebaseAuth.instance.currentUser!;

  List<String> docIDs = [];

  //get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }
  void iniState() {
    // getDocId();
    print('niitstate');
    getUser();
    super.initState();
  }
  

  Map<String, dynamic> dataUser = {};
  getUser() async {
    print('getuser');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('oref');
    print(prefs.getBool('loggedIn'));
    print('oref1');
      
    dataUser = jsonDecode(prefs.getString('userPref')!);
    print('oref2');
    print(prefs.getString('userPref'));
    print('oref3');
    print(jsonDecode(prefs.getString('userPref')!)['nama']);
    print('oref4');

    print(dataUser);
    setState(() {});
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 209, 242, 255),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 5, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilPelayan()));
                },
                child: Container(
                  width: double.infinity,
                  height: 130,
                  padding: const EdgeInsets.symmetric(
                    vertical: 22,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(children: [
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Selamat datang",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            dataUser['nama'],
                            // dataUser!['nama'],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        // Text(
                        //   "Guru Kelas Besar ",
                        //   style: TextStyle(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.w300,
                        //       color: Color.fromARGB(255, 192, 192, 192)),
                        // ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),

            const SizedBox(height: 20),
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

            // jadwal pelayanan
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JadwalPelayanan()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: const Color.fromARGB(255, 255, 255, 255),
                leading: const Icon(
                  Icons.date_range_outlined,
                  color: Colors.black,
                ),
                title: const Text("Jadwal Pelayanan"),
              ),
            ),

            // bahan mengajar
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Bahan_Mengajar()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: const Color.fromARGB(255, 255, 255, 255),
                leading: const Icon(
                  Icons.download,
                  color: Colors.black,
                ),
                title: const Text("Bahan Mengajar"),
              ),
            ),

            // pengajuan izin
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Pengajuan()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: const Color.fromARGB(255, 255, 255, 255),
                leading: const Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
                title: const Text("Pengajuan Izin"),
              ),
            ),

            // berita
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BeritaPelayan()));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                tileColor: const Color.fromARGB(255, 255, 255, 255),
                leading: const Icon(
                  Icons.newspaper,
                  color: Colors.black,
                ),
                title: const Text("Berita"),
              ),
            ),

            //button keluar
            const SizedBox(height: 40),
            InkWell(
              onTap: () {},
              child: MaterialButton(
                onPressed: () {
                  _showExitConfirmationDialog(context);
                },
                child: Center(
                  child: Container(
                    height: 30,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Center(
                      child: Text("Keluar",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
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

Future<void> _showExitConfirmationDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 209, 241, 255),
        // title: const Text('Konfirmasi'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: const Text('Tidak'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LogInScreen()));
            },
            child: const Text('Ya'),
          ),
        ],
      );
    },
  );
}
