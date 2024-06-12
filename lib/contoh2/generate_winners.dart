// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:kidsgbisukhat4/admin/Jadwal/my_firebase.dart';

// class GenerateWinner extends StatefulWidget {
//   const GenerateWinner({Key? key}) : super(key: key);

//   @override
//   State<GenerateWinner> createState() => _GenerateWinnerState();
// }

// class _GenerateWinnerState extends State<GenerateWinner> {
//    final List<String> _names = [];
//   TextEditingController? _textEditingController;

//   final guruSnapshot = MyFirebase.guruCollection.snapshots();
//   final _formKey = GlobalKey<FormState>();

//   void addGuru() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await MyFirebase.guruCollection.add({
//           'nama': _textEditingController!.text,
//         });
//         Navigator.pop(context);
//       } on FirebaseException {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: const Text('Gagal menambahkan'),
//             backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//           ),
//         );
//       }
//     } else {
//       // show snackbar
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: const Text('Harap diisi'),
//           backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//         ),
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _textEditingController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _textEditingController!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Test"),
//       ),
//       bottomSheet: Container(
//           height: 60,
//           color: Colors.deepPurpleAccent,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: () {
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: const Text("Masukan nama"),
//                       content: TextField(
//                         controller: _textEditingController,
//                         decoration:
//                             const InputDecoration(hintText: "Masukkan nama"),
//                       ),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(14)),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text("Cancel"),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             _names.add(_textEditingController!.text);
//                             _textEditingController!.clear();
//                             Navigator.pop(context);
//                           },
//                           child: const Text("Add"),
//                         )
//                       ],
//                     ),
//                   ).then((value) {
//                     setState(() {});
//                   });
//                 },
//                 child: const Text("Tambah"),
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     List<String> _winners = List.filled(7, "");
//                     List<String> _paticipantsCopy = List.from(_names);

//                     Random _random = Random();
//                     for (int i = 0; i < 7; i++) {
//                       int _winnerIndex =
//                           _random.nextInt(_paticipantsCopy.length);
//                       _winners[i] = _paticipantsCopy[_winnerIndex];
//                       _paticipantsCopy.removeAt(_winnerIndex);
//                     }
//                     showDialog(
//                         context: context,
//                         builder: (context) => SimpleDialog(
//                               title: const Text("Jadwal"),
//                               children: _winners
//                                   .map(
//                                     (name) => Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Text(name),
//                                     ),
//                                   )
//                                   .toList(),
//                             ));
//                   },
//                   child: const Text("Random")),
//             ],
//           )),
//       body: ListView.builder(
//           itemCount: _names.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               leading: Text(
//                 "#${index + 1}",
//                 style: const TextStyle(fontSize: 20),
//               ),
//               title: Text(_names[index]),
//             );
//           }),
//     );
//   }
// }
