import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  Set<Marker> _markers = {};
  Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Maps Page",
          // style: titleStyle,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: GoogleMap(
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
    );
  }
}
