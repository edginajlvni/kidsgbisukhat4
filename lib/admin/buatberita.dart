import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/dashboardadmin.dart';

class BuatBerita extends StatefulWidget {
  const BuatBerita({super.key});

  @override
  State<BuatBerita> createState() => _BuatBeritaState();
}

class _BuatBeritaState extends State<BuatBerita> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 5, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashboardAdmin()));
                      },
                      child: const Icon(Icons.arrow_back_outlined),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text("BUAT BERITA",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),

              //input nama kegiatan
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15),
                child: const Column(
                  children: [
                    Text(
                      "Nama Kegiatan",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 12, 12, 12),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15),
                child: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                          //borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),

              //input waktu kegiatan
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15),
                child: const Column(
                  children: [
                    Text(
                      "Waktu Kegiatan",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 12, 12, 12),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15),
                child: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                          //borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),

              //input keterangan kegiatan
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15),
                child: const Column(
                  children: [
                    Text(
                      "Keterangan Kegiatan",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 12, 12, 12),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 15),
                child: const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                          //borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(color: Colors.black))),
                ),
              ),

              //button upload
              const SizedBox(height: 40),
              InkWell(
                onTap: () {},
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.black,
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DashboardAdmin()));
                            },
                            child: const Text(
                              'Kembali',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                        title: const Text(
                          'Berhasil diupload',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 120,

                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(90),
                        
                      ),
                      child: const Align(
                        child: Text("Upload",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
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
