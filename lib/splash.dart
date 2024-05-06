import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsgbisukhat4/admin/tambah.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Get.to(AddStudentPage());
    });
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 190, 255),
      body: Center(
        child: Text(
          "HELLO",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
