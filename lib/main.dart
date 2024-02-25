import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseconn2g7/firebase_options.dart';
import 'package:firebaseconn2g7/pages/create_account_page.dart';
import 'package:firebaseconn2g7/pages/home_page.dart';
import 'package:firebaseconn2g7/pages/stream_page.dart';
import 'package:firebaseconn2g7/pages/stream_page_marcial.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      home: StreamPageMarcial(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
