import 'package:firebaseconn2g7/utils/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class MapsPage extends StatefulWidget {
  Color backgroundColor;
  MapsPage({required this.backgroundColor});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final _mapController = HomeController();
  Set<Marker> _markers = {};
  Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      // appBar: AppBar(
      //   // title: Text(
      //   //   "Maps Page",
      //   //   // style: titleStyle,
      //   // ),
      //   backgroundColor: Colors.blueAccent,
      // ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: GoogleMap(
            onMapCreated: _mapController.onMapCreated,
            onTap: (LatLng position) {
              print("lat: ${position.latitude}, long: ${position.longitude}");
              setState(() {
                _markers.add(
                  Marker(
                    markerId: MarkerId(_markers.length.toString()),
                    position: position,
                  ),
                );
              });
              _logger.d(_markers.length);
              // _markers.forEach((element) {
              //   // print(element);
              //   _logger.d(element.position);
              // });
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(-6.679630, -78.518984),
              zoom: 18,
            ),
            markers: _markers,
          ),
        ),
      ),
    );
  }
}
