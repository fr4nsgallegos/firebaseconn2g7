import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebaseconn2g7/pages/home_page.dart';
import 'package:firebaseconn2g7/pages/map_page.dart';
import 'package:firebaseconn2g7/pages/stream_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _activeIndex = 0;

  List<Widget> pages = [
    HomePage(),
    MapsPage(),
    StreamPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index) {
          _activeIndex = index;
          setState(() {});
        },
        items: [
          Icon(Icons.home),
          Icon(Icons.location_on),
          Icon(Icons.stream),
        ],
      ),
      appBar: AppBar(
        title: Text("TAB BAR"),
        centerTitle: true,
      ),
      body: pages[_activeIndex],
    );
  }
}
