import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/pelayan/dashboardpelayan.dart';

class ProfilPelayan extends StatefulWidget {
  const ProfilPelayan({super.key});

  @override
  State<ProfilPelayan> createState() => _ProfilPelayanState();
}

class _ProfilPelayanState extends State<ProfilPelayan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 5, right: 30),
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
                                builder: (context) => const DashboardPelayan()));
                      },
                      child: const Icon(Icons.arrow_back_outlined),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "PROFIL ANDA",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("assets/images/profill.webp"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Edgina Juliviani",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Guru Kelas Besar",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "15001",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
