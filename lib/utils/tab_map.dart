import 'package:firebaseconn2g7/pages/home_page.dart';
import 'package:firebaseconn2g7/pages/map_page.dart';
import 'package:firebaseconn2g7/pages/stream_page.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> pageDetails = [
  {
    "pageName": HomePage(
      backgroundColor: Color(0xff344e41).withOpacity(0.8),
    ),
    "title": "Home",
    "botton_color": Color(0xff344e41),
    "navvigationBarColor": Color(0xff344e41).withOpacity(0.8),
  },
  {
    "pageName": MapsPage(
      backgroundColor: Color(0xff3a5a40).withOpacity(0.8),
    ),
    "title": "Maps Page",
    "botton_color": Color(0xff3a5a40),
    "navvigationBarColor": Color(0xff3a5a40).withOpacity(0.8),
  },
  {
    "pageName": StreamPage(
      backgroundColor: Color(0xff588157).withOpacity(0.8),
    ),
    "title": "Stream Page",
    "botton_color": Color(0xff588157),
    "navvigationBarColor": Color(0xff588157).withOpacity(0.8),
  },
];
