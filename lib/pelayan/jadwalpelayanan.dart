import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/pelayan/dashboardpelayan.dart';
import 'package:kidsgbisukhat4/screen/minggu.dart';

class JadwalPelayanan extends StatefulWidget {
  const JadwalPelayanan({super.key});

  @override
  State<JadwalPelayanan> createState() => _JadwalPelayananState();
}

class _JadwalPelayananState extends State<JadwalPelayanan>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  final screentitle = ['1', '2', '3', '4', '5'];

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    controller!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 5, right: 20),
          child: Column(children: [
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
            const SizedBox(height: 10),
            const Center(
              child: Text("JADWAL PELAYANAN",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text("Minggu ke",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 40),
            DefaultTabController(
                length: 5,
                child: Column(children: [
                  Material(
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.white,
                      child: TabBar(
                          physics: const ClampingScrollPhysics(),
                          padding: const EdgeInsets.only(top: 10),
                          unselectedLabelColor:
                              const Color.fromARGB(255, 0, 0, 0),
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: [
                            Tab(
                              child: Container(
                                height: 35,
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                height: 35,
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text("2",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                height: 35,
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text("3",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                height: 35,
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text("4",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                            Tab(
                              child: Container(
                                height: 35,
                                child: const Align(
                                  alignment: Alignment.center,
                                  child: Text("5",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 500,
                    child: const TabBarView(children: [
                      Minggu_1(),
                      Minggu_2(),
                      Minggu_3(),
                      Minggu_4(),
                      Minggu_5(),
                    ]),
                  )
                ]))
          ]),
        ),
      ),
    );
  }
}
