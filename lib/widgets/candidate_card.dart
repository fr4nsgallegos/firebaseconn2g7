import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CandidateCard extends StatefulWidget {
  String docKey;
  String image;
  String partido;
  String candidato;
  int votos;
  CandidateCard({
    required this.docKey,
    required this.candidato,
    required this.image,
    required this.partido,
    required this.votos,
  });

  @override
  State<CandidateCard> createState() => _CandidateCardState();
}

class _CandidateCardState extends State<CandidateCard> {
  CollectionReference candidateReference =
      FirebaseFirestore.instance.collection("partidosPolíticos");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        candidateReference
            .doc(widget.docKey)
            .update({"nvotos": widget.votos + 1});
        setState(() {});
      },
      child: Card(
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
                  widget.image,
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
                      widget.partido,
                      style: TextStyle(fontSize: 18),
                      maxLines: 2,
                    ),
                    Text(
                      widget.candidato,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                widget.votos.toString(),
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
