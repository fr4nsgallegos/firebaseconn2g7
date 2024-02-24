import 'package:firebaseconn2g7/constants/constants.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF012F3D),
                Color(0xFF0A4F64),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text("App de votaciones", style: titleStyle),
              SizedBox(
                height: 20,
              ),
              Image.network(
                "https://talestin.com/wp-content/uploads/2023/03/Facebook-logo-blue-circle-large-transparent-png.png",
                width: MediaQuery.of(context).size.width / 3,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Crear una cuenta",
                style: subTitleStyle,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Correo electrónico",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 60,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.08),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          focusedBorder: borderFormStyle,
                          enabledBorder: borderFormStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
