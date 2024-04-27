import 'package:flutter/material.dart';

class daftartugas extends StatefulWidget {
  const daftartugas({super.key});

  @override
  State<daftartugas> createState() => _daftartugasState();
}

class _daftartugasState extends State<daftartugas> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 13),
      child: Container(
        width: double.infinity,
        height: 90,
        // padding: const EdgeInsets.symmetric(
        //   vertical: 20,
        //   horizontal: 10,
        // ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(11),
            boxShadow: const [BoxShadow(blurRadius: 1.0, color: Colors.black)]),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              width: 10,
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "WL: ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Edgina Juliviani ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}