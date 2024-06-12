import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kidsgbisukhat4/contoh2/add_contact_page.dart';
import 'package:kidsgbisukhat4/contoh2/editcontact.dart';
import 'package:kidsgbisukhat4/contoh2/my_firebase.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final contactsSnapshot = MyFirebase.contactsCollection.snapshots();

  void deleteContact(String id) async {
    await MyFirebase.contactsCollection.doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Contact deleted'),
        backgroundColor: const Color.fromARGB(255, 2, 2, 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Contacts"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: contactsSnapshot,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
              if (documents.isEmpty) {
                return Center(
                  child: Text(
                    "No Contact Yet!",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                );
              }
              return ListView.builder(
                itemCount: documents.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final contactId = documents[index].id;
                  final contact =
                      documents[index].data() as Map<String, dynamic>;
                  final String nama = contact['nama'];
                  final String phone = contact['phone'];
                  final String email = contact['email'];

                  return ListTile(
                    onTap: () {},

                    title: Text(nama),
                    subtitle: Text("$phone \n$email"),
                    isThreeLine: true,
                    //  trailing should be delete and edit button
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditContactPage(
                                  id: contactId,
                                  nama: nama,
                                  phone: phone,
                                  email: email,
                                ),
                              ),
                            );
                          },
                          splashRadius: 24,
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteContact(contactId);
                          },
                          splashRadius: 24,
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddContactPage(),
            ),
          );
        },
        label: const Text("Add Contact"),
        icon: const Icon(Icons.dock),
      ),
    );
  }
}
