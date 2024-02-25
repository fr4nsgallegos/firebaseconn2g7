import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseconn2g7/pages/stream_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  CollectionReference productReference =
      FirebaseFirestore.instance.collection("products");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                productReference.get().then((value) {
                  value.docs.forEach(
                    (element) {
                      print(element.data());
                    },
                  );
                });
              },
              child: Text("Get data"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StreamPage(),
                  ),
                );
              },
              child: Text("go to Stream Page"),
            )
          ],
        ),
      ),
    );
  }
}
