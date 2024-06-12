import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    final List<String> _names = [];
  TextEditingController? _textEditingController;
  String randomName = '';

  @override
  void initState() {
    super.initState();
    fetchRandomName();
  }

  Future<void> fetchRandomName() async {



    CollectionReference names = FirebaseFirestore.instance.collection('names');
    QuerySnapshot querySnapshot = await names.get();
    final allData = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    if (allData.isNotEmpty) {
      final randomIndex = Random().nextInt(allData.length);
      setState(() {
        randomName = allData[randomIndex]['name'];
      });
    } else {
      setState(() {
        randomName = 'No names found';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Random Data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Random Name:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              randomName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                List<String> _winners = List.filled(3, "");
                    List<String> _paticipantsCopy = List.from(_names);

                    Random _random = Random();
                    for (int i = 0; i < 3; i++) {
                      int _winnerIndex =
                          _random.nextInt(_paticipantsCopy.length);
                      _winners[i] = _paticipantsCopy[_winnerIndex];
                      _paticipantsCopy.removeAt(_winnerIndex);

                      showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                                title: const Text("Winners of this game"),
                                children:
                                    _winners.map((name) => Text(name)).toList(),
                              ));
                    }
              },
              child: Text('Generate New Random Name'),
            ),
          ],
        ),
      ),
    );
  }
}
