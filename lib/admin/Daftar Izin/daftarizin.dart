import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/pelayan/my_firebase.dart';

class DaftarIzin extends StatefulWidget {
  const DaftarIzin({super.key});

  @override
  State<DaftarIzin> createState() => _DaftarIzinState();
}

class _DaftarIzinState extends State<DaftarIzin> {

  bool isChecked = false;

  bool selected = false;


  final izinSnapshot = MyFirebase.izinCollection.snapshots();

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Daftar Izin",
            style: TextStyle(
              fontSize: 20,
            )),
        centerTitle: false,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: izinSnapshot,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
              if (documents.isEmpty) {
                return Center(
                  child: Text(
                    "Tidak ada data.",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              }
              return ListView.builder(
                itemCount: documents.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final izin = documents[index].data() as Map<String, dynamic>;
                  final String nama = izin['nama'];
                  final String tanggal = izin['tanggal'];
                  final String alasan = izin['alasan'];
                  // documents[index].id;

                  return ListTile(
<<<<<<< Updated upstream:lib/admin/Daftar Izin/daftarizin.dart
                    onTap: () {},
                    title: Text("$nama",
=======
                    title: Text(nama,
>>>>>>> Stashed changes:lib/admin/daftarizin.dart
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    subtitle: Text("$tanggal \n$alasan"),
                    isThreeLine: true,
<<<<<<< Updated upstream:lib/admin/Daftar Izin/daftarizin.dart
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
=======

                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Switch(
                        //   thumbIcon: thumbIcon,
                        //   value: selected,
                        //   onChanged: (bool value) {
                        //     setState(() {
                        //      if(selected == false){
                        //       selected = true;

                        //      }else{
                        //       selected = false;
                        //      }

                        //     });
                        //   },
                        // ),
                        // Checkbox(
                        //   tristate: false,
                        //   isError: true,
                        //   value: isChecked,

                        //   onChanged: (bool? value) {
                        //     setState(() {
                        //       isChecked = value;
                        // FirebaseFirestore.instance
                        //     .collection('izin')
                        //     .doc(documents[index].id)
                        //     .set({
                        //   'tanggal': tanggal,
                        //   'nama': nama,
                        //   'alasan': alasan,
                        //   'status': "1",
                        // });
                        //     });
                        //   },
                        // ),
>>>>>>> Stashed changes:lib/admin/daftarizin.dart
                        IconButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection('izin')
                                .doc(documents[index].id)
                                .set({
                              'tanggal': tanggal,
                              'nama': nama,
                              'alasan': alasan,
                              'status': "1",
                            });
                          },
                          splashRadius: 24,
                          icon: const Icon(Icons.check),
                        ),
                      ],
                    ),
<<<<<<< Updated upstream:lib/admin/Daftar Izin/daftarizin.dart
=======
                    //  trailing should be delete and edit button
>>>>>>> Stashed changes:lib/admin/daftarizin.dart
                  );
                },
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("An Error Occured"),
              );
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }),
    );
  }
}
