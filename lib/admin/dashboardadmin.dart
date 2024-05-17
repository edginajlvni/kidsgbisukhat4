import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/buatberita.dart';
import 'package:kidsgbisukhat4/admin/buatjadwal.dart';
import 'package:kidsgbisukhat4/admin/daftarizin.dart';
import 'package:kidsgbisukhat4/admin/datapelayan.dart';
import 'package:kidsgbisukhat4/admin/kelola_berita.dart';
import 'package:kidsgbisukhat4/admin/kelolabahan.dart';
import 'package:kidsgbisukhat4/admin/profiladmin.dart';
import 'package:kidsgbisukhat4/screen/loginscreen.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({super.key});

  @override
  State<DashboardAdmin> createState() => _DashboardAdmin();
}

class _DashboardAdmin extends State<DashboardAdmin> {
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
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilAdmin()));
                  },
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
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              // "assets/images/profil.jpg",
                              "assets/images/profill.webp",
                              //  width: 80,
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Column(
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
                              Text(
                                "ID ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromARGB(255, 192, 192, 192)),
                              ),
                            ],
                          ),
                        ]),
                  ),
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
                            builder: (context) => const DataPelayan()));
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
                            builder: (context) => const Kelola_Berita()));
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
                            builder: (context) => const KelolaBahan()));
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
        ),
      ),
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
                  MaterialPageRoute(builder: (context) => LogInScreen()));
            },
            child: const Text('Ya'),
          ),
        ],
      );
    },
  );
}
