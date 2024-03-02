import 'package:flutter/material.dart';

class CandidateCard extends StatelessWidget {
  String image;
  String partido;
  String candidato;
  String votos;
  CandidateCard(
      {required this.candidato,
      required this.image,
      required this.partido,
      required this.votos});
  @override
  Widget build(BuildContext context) {
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
                image,
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
                    partido,
                    style: TextStyle(fontSize: 18),
                    maxLines: 2,
                  ),
                  Text(
                    candidato,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              votos,
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
