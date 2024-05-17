
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => const Register()));
    // });
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
