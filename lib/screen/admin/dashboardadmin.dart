import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/screen/loginscreen.dart';
import 'package:latihan_ta/fitur%20admin/bahanmengajar.dart';
import 'package:latihan_ta/fitur%20admin/buatberita.dart';
import 'package:latihan_ta/fitur%20admin/buatjadwal.dart';
import 'package:latihan_ta/fitur%20admin/daftarizin.dart';
import 'package:latihan_ta/fitur%20admin/datapelayan.dart';
import 'package:latihan_ta/fitur%20admin/profil.dart';
import 'package:latihan_ta/view/login.dart';

class DasboardAdmin extends StatefulWidget {
  const DasboardAdmin({super.key});

  @override
  State<DasboardAdmin> createState() => _DasboardAdmin();
}

class _DasboardAdmin extends State<DasboardAdmin> {
  bool darkMode = true;

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
                            builder: (context) => const Profil()));
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
                    // margin: const EdgeInsets.symmetric(horizontal: 25),
                    // padding: const EdgeInsets.all(25),
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
              // const SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15),
              //   child: Column(
              //     children: [
              //       Row(children: [
              //         Container(
              //           width: 100,
              //           height: 100,
              //           padding: const EdgeInsets.all(15),
              //           decoration: BoxDecoration(
              //               color: const Color.fromARGB(255, 255, 255, 255),
              //               borderRadius: BorderRadius.circular(100),
              //               image: const DecorationImage(
              //                 image: AssetImage("assets/images/profil.jpg"),
              //                 fit: BoxFit.cover,
              //               )),
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         const SizedBox(width: 15),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const Padding(
              //               padding: EdgeInsets.only(bottom: 5),
              //               child: Text(
              //                 "Daftar Profil Pelayan",
              //                 style: TextStyle(
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.bold,
              //                     color: Color.fromARGB(255, 0, 0, 0)),
              //               ),
              //             ),
              //             InkWell(
              //               child: const Text("Lihat Detail"),
              //               onTap: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) =>
              //                             const ProfilPelayan()));
              //               },
              //             ),
              //           ],
              //         ),
              //       ]),
              //     ],
              //   ),
              // ),

              // const SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15),
              //   child: Column(
              //     children: [
              //       Row(children: [
              //         Container(
              //           width: 100,
              //           height: 100,
              //           padding: const EdgeInsets.all(15),
              //           decoration: BoxDecoration(
              //               // color: const Color.fromARGB(255, 255, 255, 255),
              //               borderRadius: BorderRadius.circular(20),
              //               image: const DecorationImage(
              //                 image: AssetImage("assets/images/profil.jpg"),
              //                 fit: BoxFit.cover,
              //               )),
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         const SizedBox(width: 15),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const Padding(
              //               padding: EdgeInsets.only(bottom: 5),
              //               child: Text(
              //                 "Membuat Jadwal",
              //                 style: TextStyle(
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.bold,
              //                     color: Color.fromARGB(255, 0, 0, 0)),
              //               ),
              //             ),
              //             InkWell(
              //               child: const Text("Lihat Detail"),
              //               onTap: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) =>
              //                             const ProfilPelayan()));
              //               },
              //             ),
              //           ],
              //         ),
              //       ]),
              //     ],
              //   ),
              // ),

              // const SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15),
              //   child: Column(
              //     children: [
              //       Row(children: [
              //         Container(
              //           width: 100,
              //           height: 100,
              //           padding: const EdgeInsets.all(15),
              //           decoration: BoxDecoration(
              //               // color: const Color.fromARGB(255, 255, 255, 255),
              //               borderRadius: BorderRadius.circular(20),
              //               image: const DecorationImage(
              //                 image: AssetImage("assets/images/profil.jpg"),
              //                 fit: BoxFit.cover,
              //               )),
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         const SizedBox(width: 15),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const Padding(
              //               padding: EdgeInsets.only(bottom: 5),
              //               child: Text(
              //                 "Upload Berita",
              //                 style: TextStyle(
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.bold,
              //                     color: Color.fromARGB(255, 0, 0, 0)),
              //               ),
              //             ),
              //             InkWell(
              //               child: const Text("Lihat Detail"),
              //               onTap: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) =>
              //                             const ProfilPelayan()));
              //               },
              //             ),
              //           ],
              //         ),
              //       ]),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15),
              //   child: Column(
              //     children: [
              //       Row(children: [
              //         Container(
              //           width: 100,
              //           height: 100,
              //           padding: const EdgeInsets.all(15),
              //           decoration: BoxDecoration(
              //               // color: const Color.fromARGB(255, 255, 255, 255),
              //               borderRadius: BorderRadius.circular(20),
              //               image: const DecorationImage(
              //                 image: AssetImage("assets/images/profil.jpg"),
              //                 fit: BoxFit.cover,
              //               )),
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         const SizedBox(width: 15),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const Padding(
              //               padding: EdgeInsets.only(bottom: 5),
              //               child: Text(
              //                 "Menambah Bahan Mengajar",
              //                 style: TextStyle(
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.bold,
              //                     color: Color.fromARGB(255, 0, 0, 0)),
              //               ),
              //             ),
              //             InkWell(
              //               child: const Text("Lihat Detail"),
              //               onTap: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) =>
              //                             const ProfilPelayan()));
              //               },
              //             ),
              //           ],
              //         ),
              //       ]),
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15),
              //   child: Column(
              //     children: [
              //       Row(children: [
              //         Container(
              //           width: 100,
              //           height: 100,
              //           padding: const EdgeInsets.all(15),
              //           decoration: BoxDecoration(
              //               // color: const Color.fromARGB(255, 255, 255, 255),
              //               borderRadius: BorderRadius.circular(20),
              //               image: const DecorationImage(
              //                 image: AssetImage("assets/images/profil.jpg"),
              //                 fit: BoxFit.cover,
              //               )),
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         const SizedBox(width: 15),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const Padding(
              //               padding: EdgeInsets.only(bottom: 5),
              //               child: Text(
              //                 "Data Pelayan Izin",
              //                 style: TextStyle(
              //                     fontSize: 15,
              //                     fontWeight: FontWeight.bold,
              //                     color: Color.fromARGB(255, 0, 0, 0)),
              //               ),
              //             ),
              //             InkWell(
              //               child: const Text("Lihat Detail"),
              //               onTap: () {
              //                 Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                         builder: (context) =>
              //                             const ProfilPelayan()));
              //               },
              //             ),
              //           ],
              //         ),
              //       ]),
              //     ],
              //   ),
              // ),

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
                            builder: (context) => BuatJadwal()));
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
                            builder: (context) => const BuatBerita()));
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
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(90),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: const Color.fromARGB(255, 253, 238, 255),
                        //     spreadRadius: 1,
                        //     blurRadius: 8,
                        //     offset: Offset(4,4),
                        //   ),
                        // ]
                      ),
                      child: const Center(
                        child: Text("Keluar",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ),

              // const SizedBox(height: 20),
              // Padding(
              //   padding: EdgeInsets.only(top: 50),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       InkWell(
              //         onTap: () {
              //        setState(() {
              //          darkMode = false;
              //        });
              //         },
              //         child: Text(
              //           "Dark",
              //           style: TextStyle(
              //             color: Colors.amber,
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
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
                  MaterialPageRoute(builder: (context) => const LogInScreen()));
            },
            child: const Text('Ya'),
          ),
        ],
      );
    },
  );
}
