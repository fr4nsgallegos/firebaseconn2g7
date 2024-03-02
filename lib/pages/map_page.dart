import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map Page"),
      ),
      body: GoogleMap(
        onTap: (LatLng position) {
          print(position);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(-6.679630, -78.518984),
          zoom: 18,
        ),
        markers: {
          // Marker(
          //   markerId: MarkerId("primerMarcador"),
          //   position: LatLng(-6.679630, -78.518984),
          // )
        },
      ),
    );
  }
}
