// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:kidsgbisukhat4/pelayan/dashboardpelayan.dart';
// import 'package:kidsgbisukhat4/pelayan/jadwalpelayanan.dart';
// import 'package:kidsgbisukhat4/pelayan/pengajuan.dart';
// import 'package:kidsgbisukhat4/pelayan/profilpelayan.dart';
// import 'package:kidsgbisukhat4/pelayan/unduhbahan.dart';
// import 'package:kidsgbisukhat4/screen/loginscreen.dart';

// class GetName extends StatelessWidget {
//   final String documentId;

//   GetName({super.key, required this.documentId});

//   CollectionReference users = FirebaseFirestore.instance.collection('users');

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: users.doc(documentId).get(),
//       builder: ((context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;  
//           return Padding(
//             padding: const EdgeInsets.only(top: 30, left: 5, right: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15),
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const ProfilPelayan()));
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 130,
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 22,
//                         horizontal: 20,
//                       ),
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 255, 255, 255),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Row(children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(50),
//                           child: Image.asset(
//                             "assets/images/profill.webp",
//                             width: 80,
//                           ),
//                         ),
//                         const SizedBox(width: 15),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(bottom: 5),
//                               child: Text(
//                                 "Shallom",
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color.fromARGB(255, 0, 0, 0)),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(bottom: 5),
//                               child: Text(
//                                 "Nama: ${data['nama']}",
//                                 style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color.fromARGB(255, 0, 0, 0)),
//                               ),
//                             ),
//                             Text(
//                               "Guru Kelas Besar ",
//                               style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w300,
//                                   color: Color.fromARGB(255, 192, 192, 192)),
//                             ),
//                           ],
//                         ),
//                       ]),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 20),
//                   child: Text(
//                     "Menu",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),

//                 // jadwal pelayanan
//                 const SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15),
//                   child: ListTile(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const JadwalPelayanan()));
//                     },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     tileColor: const Color.fromARGB(255, 255, 255, 255),
//                     leading: const Icon(
//                       Icons.date_range_outlined,
//                       color: Colors.black,
//                     ),
//                     title: const Text("Jadwal Pelayanan"),
//                   ),
//                 ),

//                 // bahan mengajar
//                 const SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15),
//                   child: ListTile(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const UnduhBahan()));
//                     },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     tileColor: const Color.fromARGB(255, 255, 255, 255),
//                     leading: const Icon(
//                       Icons.download,
//                       color: Colors.black,
//                     ),
//                     title: const Text("Bahan Mengajar"),
//                   ),
//                 ),

//                 // pengajuan izin
//                 const SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 15),
//                   child: ListTile(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const Pengajuan()));
//                     },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     tileColor: const Color.fromARGB(255, 255, 255, 255),
//                     leading: const Icon(
//                       Icons.edit,
//                       color: Colors.black,
//                     ),
//                     title: const Text("Pengajuan Izin"),
//                   ),
//                 ),

//                 const SizedBox(height: 20),
//                 const Padding(
//                   padding: EdgeInsets.only(left: 20),
//                   child: Text(
//                     "Informasi",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Row(
//                         children: [
//                           //
//                           Column(children: [
//                             Container(
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                   color:
//                                       const Color.fromARGB(255, 165, 161, 161),
//                                   borderRadius: BorderRadius.circular(10),
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Color.fromARGB(115, 245, 241, 241),
//                                     )
//                                   ]),
//                               child: InkWell(
//                                 child: Image.asset(
//                                   'assets/images/profil.jpg',
//                                   height: 100,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               const DashboardPelayan()));
//                                 },
//                               ),
//                             ),
//                           ]),

//                           const SizedBox(width: 10),
//                           Column(children: [
//                             Container(
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                   color:
//                                       const Color.fromARGB(255, 165, 161, 161),
//                                   borderRadius: BorderRadius.circular(10),
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Color.fromARGB(115, 245, 241, 241),
//                                     )
//                                   ]),
//                               child: InkWell(
//                                 child: Image.asset(
//                                   'assets/images/profill.webp',
//                                   height: 100,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               const DashboardPelayan()));
//                                 },
//                               ),
//                             ),
//                           ]),

//                           const SizedBox(width: 10),
//                           Column(children: [
//                             Container(
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                   color:
//                                       const Color.fromARGB(255, 165, 161, 161),
//                                   borderRadius: BorderRadius.circular(10),
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Color.fromARGB(115, 245, 241, 241),
//                                     )
//                                   ]),
//                               child: InkWell(
//                                 child: Image.asset(
//                                   'assets/images/profill.webp',
//                                   height: 100,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               const DashboardPelayan()));
//                                 },
//                               ),
//                             ),
//                           ]),

//                           const SizedBox(width: 10),
//                           Column(children: [
//                             Container(
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                   color:
//                                       const Color.fromARGB(255, 165, 161, 161),
//                                   borderRadius: BorderRadius.circular(10),
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Color.fromARGB(115, 245, 241, 241),
//                                     )
//                                   ]),
//                               child: InkWell(
//                                 child: Image.asset(
//                                   'assets/images/profill.webp',
//                                   height: 100,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               const DashboardPelayan()));
//                                 },
//                               ),
//                             ),
//                           ]),

//                           const SizedBox(width: 10),
//                           Column(children: [
//                             Container(
//                               padding: const EdgeInsets.all(8),
//                               decoration: BoxDecoration(
//                                   color:
//                                       const Color.fromARGB(255, 165, 161, 161),
//                                   borderRadius: BorderRadius.circular(10),
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Color.fromARGB(115, 245, 241, 241),
//                                     )
//                                   ]),
//                               child: InkWell(
//                                 child: Image.asset(
//                                   'assets/images/1.jpg',
//                                   height: 100,
//                                   fit: BoxFit.cover,
//                                 ),
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               const DashboardPelayan()));
//                                 },
//                               ),
//                             ),
//                           ]),
//                         ],
//                       )),
//                 ),

//                 //button keluar
//                 const SizedBox(height: 40),
//                 InkWell(
//                   onTap: () {},
//                   child: MaterialButton(
//                     onPressed: () {
//                       _showExitConfirmationDialog(context);
//                     },
//                     child: Center(
//                       child: Container(
//                         height: 30,
//                         width: 110,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(90),
//                         ),
//                         child: const Center(
//                           child: Text("Keluar",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold)),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       }),
//     );
//   }
// }

// Future<void> _showExitConfirmationDialog(BuildContext context) async {
//   return showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: const Color.fromARGB(255, 209, 241, 255),
//         // title: const Text('Konfirmasi'),
//         content: const Text('Apakah Anda yakin ingin keluar?'),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Tutup dialog
//             },
//             child: const Text('Tidak'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => LogInScreen()));
//             },
//             child: const Text('Ya'),
//           ),
//         ],
//       );
//     },
//   );
// }
