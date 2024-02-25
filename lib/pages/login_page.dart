import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseconn2g7/constants/constants.dart';
import 'package:firebaseconn2g7/pages/home_page.dart';
import 'package:firebaseconn2g7/widgets/field_form_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  TextEditingController correoController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();
  GoogleSignIn googleSignIn = GoogleSignIn();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> loginAccount(BuildContext context) async {
    try {
      _firebaseAuth
          .signInWithEmailAndPassword(
        email: correoController.text,
        password: contrasenaController.text,
      )
          .then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      });

      // return userCredential;
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );

      User? user =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;
      print(user?.displayName);
      print(user?.email);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          behavior: SnackBarBehavior.floating,
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
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
          child: SingleChildScrollView(
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
                  "Inicia sesión",
                  style: subTitleStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      FieldFormWidget(
                          text: "Ingresa el correo",
                          controller: correoController),
                      FieldFormWidget(
                          text: "Ingresa la contraseña",
                          controller: contrasenaController),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Ó inicia sesión con    "),
                      IconButton(
                        color: Colors.white,
                        onPressed: () {
                          signInWithGoogle(context).then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          });
                        },
                        icon: Icon(Icons.g_mobiledata),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    loginAccount(context);
                  },
                  child: Text("Iniciar sesión"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
