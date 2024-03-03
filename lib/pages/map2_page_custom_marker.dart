import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map2Page extends StatefulWidget {
  @override
  State<Map2Page> createState() => _Map2PageState();
}

class _Map2PageState extends State<Map2Page> {
  Set<Marker> _markers = {};

  addMarkers() async {
    Set<Marker> auxMarkers = Set();
    LatLng pos1 = LatLng(-6.679056391069261, -78.51938559298708);
    LatLng pos2 = LatLng(-6.6801527243696315, -78.51902903066602);
    LatLng pos3 = LatLng(-6.679768442873898, -78.51985974500974);
    BitmapDescriptor designBit1 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(94, 94)), "assets/icons/orange.png");
    BitmapDescriptor designBit2 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(94, 94)), "assets/icons/blue.png");
    BitmapDescriptor designBit3 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(94, 94)), "assets/icons/green.png");
    auxMarkers.add(
      Marker(
        markerId: MarkerId("1"),
        position: pos1,
        icon: designBit1,
      ),
    );
    setState(() {
      _markers = auxMarkers;
    });
  }

  @override
  void initState() {
    addMarkers();
    // TODO: implement initState
    super.initState();
  }

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
        markers: _markers,
      ),
    );
  }
}
