import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
            
class Map extends StatefulWidget {
  const Map({super.key});
      
  @override
  State<Map> createState() => _MyAppState();
}
      
class _MyAppState extends State<Map> {
  late GoogleMapController mapController;
      
  final LatLng _center = const LatLng(-33.86, 151.20);
      
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
      
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
          ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        ),
      ),
    );
  }
}
