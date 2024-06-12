import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class Minggu5 extends StatefulWidget {
  const Minggu5({super.key});

  @override
  State<Minggu5> createState() => _Minggu5State();
}
class _Minggu5State extends State<Minggu5> {
  final List<String> _names = [];
    TextEditingController? _textEditingController;


  String randomName = '';
  final TextEditingController _nameController = TextEditingController();

  final CollectionReference _guru =
      FirebaseFirestore.instance.collection('guru');

  void generateRandomName() {
    var faker = Faker();
    setState(() {
      randomName = faker.person.name();
    });
  }

  @override
  void initState() {
    super.initState();
    generateRandomName(); // Generate an initial random name when the app starts
  }

  String searchText = '';
  @override
  void dispose() {
    _textEditingController!.dispose();
    super.dispose();
  }
  // for create operation
  Future<void> _create() async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Create your item",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: 'Name', hintText: 'eg.Elon'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        final String name = _nameController.text;

                        await _guru.add({"name": name});
                        _nameController.text = '';

                        Navigator.of(context).pop();
                      },
                      child: const Text("Create")),
                )
              ],
            ),
          );
        });
  }

  // for Update operation

  // for delete operation
  Future<void> _delete(String productID) async {
    await _guru.doc(productID).delete();

    // for snackBar
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You have successfully deleted a itmes")));
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
    });
  }bool isSearchClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        title: isSearchClicked
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 253, 253, 253),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              )
            : const Text('Data Pelayan'),
        centerTitle: true,
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 60,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Masukan nama"),
                      content: TextField(
                        controller: _nameController,
                        decoration:
                            const InputDecoration(hintText: "Masukkan nama"),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            _names.add(_nameController.text);
                            _nameController.clear();
                            Navigator.pop(context);
                          },
                          child: const Text("Add"),
                        )
                      ],
                    ),
                  ).then((value) {
                    setState(() {});
                  });
                },
                child: const Text("Tambah")),
            ElevatedButton(
    onPressed: () {
                    List<String> winners = List.filled(3, "");
                    List<String> paticipantsCopy = List.from(_names);

                    Random random = Random();
                    for (int i = 0; i < 3; i++) {
                      int winnerIndex =
                          random.nextInt(paticipantsCopy.length);
                      winners[i] = paticipantsCopy[winnerIndex];
                      paticipantsCopy.removeAt(winnerIndex);

                      showDialog(
                          context: context,
                          builder: (context) => const SimpleDialog(
                                title: Text("WInner"),
                              ));
                    }
                  },                child: const Text("Random"))
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: _names.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text("#${index + 1}"),
              title: Text(_names[index]),
            );
          }),
      // Create new project button
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        backgroundColor: const Color.fromARGB(255, 88, 136, 190),
        child: const Icon(Icons.add),
      ),
    );
  }
}