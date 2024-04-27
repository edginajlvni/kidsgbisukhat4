import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/screen/daftartugas.dart';

class tugas extends StatefulWidget {
  const tugas({super.key});

  @override
  State<tugas> createState() => _tugasState();
}

class _tugasState extends State<tugas> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(height: 20),
        const Center(
          child: Text("Datang Pk. 14.00",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        const daftartugas(),
        const daftartugas(),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(top: 18, left: 15, right: 13),
          child: Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11),
                boxShadow: const [
                  BoxShadow(blurRadius: 1.0, color: Colors.black)
                ]),
            child: const Padding(
              padding: EdgeInsets.only(left: 15, top: 10, bottom: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Seragam: ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    ),
  );
  }
}

