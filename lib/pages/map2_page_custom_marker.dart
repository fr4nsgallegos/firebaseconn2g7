import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps with custom marker"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-6.679630, -78.518984),
          zoom: 17,
        ),
        markers: {
          Marker(
            markerId: MarkerId("1"),
            position: LatLng(-6.679630, -78.518984),
            infoWindow: InfoWindow(
              title: "Inicio del recorrido",
              snippet: "Punto de encuentro a las 10:00 horas. ",
            ),
          )
        },
      ),
    );
  }
}
