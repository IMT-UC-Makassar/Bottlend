import 'package:flutter/material.dart';
import 'home.dart';
import 'location.dart';
import 'camera.dart';
import 'rewards.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('This is the Profile Page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4, // Sesuaikan dengan indeks yang ingin Anda aktifkan (Profile)
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
              );  // Kembali ke halaman sebelumnya (home.dart)
          }else if (index == 1) { // Tambahkan else if untuk navigasi ke CameraPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationPage()),
              );
            } else if (index == 2) { // Tambahkan else if untuk navigasi ke CameraPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CameraPage()),
              );
            }else if (index == 4) { // Tambahkan else if untuk navigasi ke CameraPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RewardPage()),
              );
            } else {
            // Tambahkan navigasi ke halaman lain jika diperlukan
          }
        },
      ),
    );
  }
}
