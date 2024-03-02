import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseconn2g7/widgets/candidate_card.dart';
import 'package:flutter/material.dart';

class CandidatePage extends StatefulWidget {
  @override
  State<CandidatePage> createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {
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
                return CandidateCard(
                  docKey: docs[index].id,
                  candidato: docs[index]["nombreCandidato"],
                  image: docs[index]["image"],
                  partido: docs[index]["partidoPolitico"],
                  votos: docs[index]["nvotos"],
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
