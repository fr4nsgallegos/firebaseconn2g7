import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CandidatePage extends StatelessWidget {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection("partidosPolíticos");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Candidatos"),
      ),
      body: FutureBuilder(
        future: candidateReference.get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            QuerySnapshot candidateCollection = snapshot.data;
            List<QueryDocumentSnapshot> docs = candidateCollection.docs;
            print(docs.length);
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.all(15),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            docs[index]["image"],
                          ),
                          radius: 30,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                docs[index]["partidoPolitico"],
                                style: TextStyle(fontSize: 18),
                                maxLines: 2,
                              ),
                              Text(
                                docs[index]["nombreCandidato"],
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          docs[index]["nvotos"].toString(),
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
