import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// import 'rewards.dart';
// import 'profile.dart';

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape:
            const Border(bottom: BorderSide(color: Colors.black, width: 1.5)),
        title: const Text(
          'Location',
          style: TextStyle(color: Color.fromRGBO(24, 146, 24, 1)),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              center: LatLng(-5.148983, 119.395083),
              zoom: 15.5,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              const MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(-5.148983, 119.395083),
                    width: 80,
                    height: 80,
                    child: Icon(Icons.business, size: 40, color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
