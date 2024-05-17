import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/pelayan/dashboardpelayan.dart';

class UnduhBahan extends StatefulWidget {
  const UnduhBahan({super.key});

  @override
  State<UnduhBahan> createState() => _UnduhBahanState();
}

class _UnduhBahanState extends State<UnduhBahan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("BAHAN MENGAJAR",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 5, right: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    width: double.infinity,
                    height: 130,
                    padding: const EdgeInsets.symmetric(
                      vertical: 22,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(blurRadius: 5.0, color: Colors.black)
                        ]),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Bulan: ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Link:",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        Text(
                          "Keterangan",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
