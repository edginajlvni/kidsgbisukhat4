// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:kidsgbisukhat4/pelayan/profilpelayan.dart';

// class DB2 extends StatefulWidget {
//   @override
//   _DB2State createState() => _DB2State();
// }

// class _DB2State extends State<DB2> {
//    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
//       .collection('users')
//       .where('jabatan', isEqualTo: 'Guru')
//       .snapshots();

//       final auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder(
//             stream: _usersStream,
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                     itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (context, i) {
//                       var data = snapshot.data!.docs[i];

//                       return Padding(
//                         padding: const EdgeInsets.only(left: 15),
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const ProfilPelayan()));
//                           },
//                           child: Container(
//                             width: double.infinity,
//                             height: 130,
//                             padding: const EdgeInsets.symmetric(
//                               vertical: 22,
//                               horizontal: 20,
//                             ),
//                             decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 255, 255, 255),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Row(children: [
//                               ClipRRect(
//                                 borderRadius: BorderRadius.circular(50),
//                                 child: Image.asset(
//                                   "assets/images/profill.webp",
//                                   width: 80,
//                                 ),
//                               ),
//                               const SizedBox(width: 15),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.only(bottom: 5),
//                                     child: Text(
//                                       "Shallom",
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold,
//                                           color: Color.fromARGB(255, 0, 0, 0)),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.only(bottom: 5),
//                                     child: Text(
//                                       data['nama'],
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                           color: Color.fromARGB(255, 0, 0, 0)),
//                                     ),
//                                   ),
//                                   Text(
//                                     "Guru Kelas Besar ",
//                                     style: TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w300,
//                                         color:
//                                             Color.fromARGB(255, 192, 192, 192)),
//                                   ),
//                                 ],
//                               ),
//                             ]),
//                           ),
//                         ),
//                       );
//                     });
//               }
//             }));
//   }
// }
