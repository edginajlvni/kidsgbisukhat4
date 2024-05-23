import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/Bahan/bahan.dart';
import 'package:kidsgbisukhat4/admin/Berita/berita_screen.dart';
import 'package:kidsgbisukhat4/admin/DataPelayan/data_guru.dart';
import 'package:kidsgbisukhat4/admin/Jadwal/buatjadwal.dart';
import 'package:kidsgbisukhat4/admin/daftarizin.dart';
import 'package:kidsgbisukhat4/screen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdmin();
}

class _DashboardAdmin extends State<DashboardAdmin> {
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
      backgroundColor: const Color.fromARGB(255, 209, 242, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 5, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  padding: const EdgeInsets.symmetric(
                    vertical: 22,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                "ADMIN",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),

              // profil pelayan
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DataGuru()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: const Color.fromARGB(255, 255, 255, 255),
                  leading: const Icon(
                    Icons.person_2,
                    color: Colors.black,
                  ),
                  title: const Text("Data Pelayan"),
                ),
              ),

              // buat jadwal
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BuatJadwal()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: const Color.fromARGB(255, 255, 255, 255),
                  leading: const Icon(
                    Icons.date_range,
                    color: Colors.black,
                  ),
                  title: const Text("Buat Jadwal"),
                ),
              ),

              // buat berita
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BeritaScreen()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: const Color.fromARGB(255, 255, 255, 255),
                  leading: const Icon(
                    Icons.newspaper,
                    color: Colors.black,
                  ),
                  title: const Text("Buat Berita"),
                ),
              ),

              // upload bahan
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BahanMengajar()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: const Color.fromARGB(255, 255, 255, 255),
                  leading: const Icon(
                    Icons.book,
                    color: Colors.black,
                  ),
                  title: const Text("Bahan Mengajar"),
                ),
              ),

              // pelayan izin
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DaftarIzin()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: const Color.fromARGB(255, 255, 255, 255),
                  leading: const Icon(
                    Icons.fork_left,
                    color: Colors.black,
                  ),
                  title: const Text("Daftar Pelayan Izin"),
                ),
              ),

              //button keluar
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
                      height: 35,
                      width: 110,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: const Center(
                        child: Text("Keluar",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showExitConfirmationDialog(BuildContext context) async {
  logout() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('userPref');
    prefs.setBool('loggedIn', false);
  }

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
            onPressed: () async {
              await logout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogInScreen(),
                  ),
                  (route) => false);
            },
            child: const Text('Ya'),
          ),
        ],
      );
    },
  );
}
