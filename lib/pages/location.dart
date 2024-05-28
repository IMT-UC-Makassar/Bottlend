import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'navbar.dart';
import 'camera.dart';
import 'rewards.dart';
import 'profile.dart';

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(-5.148983, 119.395083),
              zoom: 15.5,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
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
