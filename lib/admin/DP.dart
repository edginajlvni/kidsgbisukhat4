import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/addnote.dart';
import 'package:kidsgbisukhat4/editnote.dart';

class DP extends StatefulWidget {
  const DP({super.key});

  @override
  State<DP> createState() => _DPState();
}

class _DPState extends State<DP> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('notes').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("DATA PELAYAN",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addnote()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            editnote(docid: snapshot.data!.docs[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: Column(
                      children: [
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 250, 231, 231),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Nama: " +
                                          snapshot.data!.docChanges[index]
                                              .doc['title'],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Email: " +
                                      snapshot.data!.docChanges[index]
                                          .doc['content'],
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Jabatan: " +
                                      snapshot.data!.docChanges[index]
                                          .doc['content'],
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

//       body: Container(
//         margin: const EdgeInsets.only(top: 25, left: 25, right: 20),
//         child: Column(
//           children: [
//             Material(
//               elevation: 5,
//               borderRadius: BorderRadius.circular(10),
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(10)),
                // child: const Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text(
                //           "Nama: ",
                //           style: TextStyle(
                //               fontSize: 15,
                //               fontWeight: FontWeight.bold,
                //               color: Color.fromARGB(255, 0, 0, 0)),
                //         ),
                //       ],
                //     ),
                //     SizedBox(height: 10),
                //     Text("Email"),
                //     SizedBox(height: 10),
                //     Text("Jabatan"),
                //   ],
                // ),