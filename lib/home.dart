import 'package:flutter/material.dart';
import 'location.dart';
import 'camera.dart';
import 'rewards.dart';
import 'profile.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.green, // Warna saat item dipilih
        unselectedItemColor: Colors.black, // Warna saat item tidak dipilih
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
          setState(() {
            _currentIndex = index;
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LocationPage()),
              );
            }
            else if (index == 2) { // Tambahkan else if untuk navigasi ke CameraPage
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
          });
        },
      ),
    );
  }
}
