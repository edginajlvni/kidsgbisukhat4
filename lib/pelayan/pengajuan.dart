import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/pelayan/dashboardpelayan.dart';

class Pengajuan extends StatefulWidget {
  const Pengajuan({super.key});

  @override
  State<Pengajuan> createState() => _PengajuanState();
}

class _PengajuanState extends State<Pengajuan> {
  // final _tglIzinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("PENGAJUAN IZIN",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 5, right: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15),
              child: const Column(
                children: [
                  Text(
                    "Tanggal Izin",
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
                // controller: _tglIzinController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                      //borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: Colors.black)),
                ),
                //           onTap: () async {
                //             final date = await showDatePicker(
                //               context: context,
                //               initialDate: DateTime.now(),
                //               firstDate: DateTime(2024),
                //               lastDate: DateTime(2025),
                //             );

                //             if (date != null) {
                //       _tglIzinController.text = DateFormat('dd MMMM yyyy').format(date);
                //     }
                // }, //event listener jika di tap
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 15),
              child: const Column(
                children: [
                  Text(
                    "Alasan Izin",
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
                // controller: _tglIzinController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                      //borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: Colors.black)),
                ),
                //           onTap: () async {
                //             final date = await showDatePicker(
                //               context: context,
                //               initialDate: DateTime.now(),
                //               firstDate: DateTime(2024),
                //               lastDate: DateTime(2025),
                //             );

                //             if (date != null) {
                //       _tglIzinController.text = DateFormat('dd MMMM yyyy').format(date);
                //     }
                // }, //event listener jika di tap
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
                                         const DashboardPelayan()));
                          },
                          child: const Text(
                            'Ok',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                      title: const Text(
                        'Berhasil diajukan',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  );
                },
                child: Center(
                  child: Container(
                    height: 50,
                    // width: 160,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Center(
                      child: Text("Ajukan",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
