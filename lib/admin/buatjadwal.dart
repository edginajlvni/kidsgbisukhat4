import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/admin/dashboardadmin.dart';

class BuatJadwal extends StatefulWidget {
  const BuatJadwal({super.key});

  @override
  State<BuatJadwal> createState() => _BuatJadwalState();
}

class _BuatJadwalState extends State<BuatJadwal> {
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
                                builder: (context) => const DasboardAdmin()));
                      },
                      child: const Icon(Icons.arrow_back_outlined),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text("BUAT JADWAL",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
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
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(children: [
                      Icon(Icons.calendar_month),
                      SizedBox(width: 15),
                      Text("Minggu 1"),
                    ]),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(children: [
                      Icon(Icons.calendar_month),
                      SizedBox(width: 15),
                      Text("Minggu 1"),
                    ]),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(children: [
                      Icon(Icons.calendar_month),
                      SizedBox(width: 15),
                      Text("Minggu 1"),
                    ]),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(children: [
                      Icon(Icons.calendar_month),
                      SizedBox(width: 15),
                      Text("Minggu 1"),
                    ]),
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(children: [
                      Icon(Icons.calendar_month),
                      SizedBox(width: 15),
                      Text("Minggu 1"),
                    ]),
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
