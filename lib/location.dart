import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'home.dart';
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
              center: LatLng(-5.148983, 119.395083), // Koordinat Makassar
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            1, 
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.green, // Warna saat item dipilih
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fmd_good_outlined),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.center_focus_weak_outlined),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_outlined),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => home()),
            ); // Kembali ke halaman sebelumnya (home.dart)
          } else if (index == 2) {
            // Tambahkan else if untuk navigasi ke halaman kamera
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CameraPage()),
            );
          } else if (index == 3) {
            // Tambahkan else if untuk navigasi ke halaman reward
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RewardPage()),
            );
          } else if (index == 4) {
            // Tambahkan else if untuk navigasi ke halaman profil
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}
