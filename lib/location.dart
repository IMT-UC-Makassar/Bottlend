import 'package:bottlend_apps/rewards.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'camera.dart';
import 'profile.dart';


class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
        child: Text('This is the Location Page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // sesuaikan dengan index yang ingin Anda aktifkan (Location)
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
            icon: Icon(Icons.fmd_good_outlined,),
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
          // Tangani navigasi jika diperlukan
          if (index == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => home()),
              );
          } else if (index == 2) { // Tambahkan else if untuk navigasi ke CameraPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CameraPage()),
              );
            }
            else if (index == 3) { // Tambahkan else if untuk navigasi ke CameraPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RewardPage()),
              );
            }
            else if (index == 4) { // Tambahkan else if untuk navigasi ke CameraPage
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
