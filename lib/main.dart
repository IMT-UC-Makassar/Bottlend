import 'package:flutter/material.dart';
import 'app_state.dart';
import 'pages/homepage.dart';
import 'pages/leaderboardpage.dart';
import 'pages/location.dart';
import 'pages/profilepage.dart';
import 'pages/scannerpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int bottlePoint = 5000; // Example initial points
  int bottleCollected = 0;
  List<Map<String, dynamic>> historyList = [];
  List<Map<String, dynamic>> achievements = [
    {
      'title': 'Master Baiter',
      'bottleRemaining': 4,
      'bonusPoints': 10,
      'isClaimed': false
    },
    {
      'title': 'Johan Master',
      'bottleRemaining': 9,
      'bonusPoints': 20,
      'isClaimed': false
    },
    {
      'title': 'Picker Ball',
      'bottleRemaining': 11,
      'bonusPoints': 30,
      'isClaimed': false
    },
    {
      'title': 'Man in The Middle',
      'bottleRemaining': 18,
      'bonusPoints': 50,
      'isClaimed': false
    },
  ];

  void _incrementPoints() {
    setState(() {
      bottlePoint += 10;
      bottleCollected += 1;
    });
  }

  void _decrementPoints(int points) {
    setState(() {
      bottlePoint -= points;
    });
  }

  void _addHistory(String action, String date, String pointChange) {
    setState(() {
      historyList.add({
        "action": action,
        "date": date,
        "pointChange": pointChange,
      });
    });
  }

  void _claimAchievement(int bonusPoints) {
    setState(() {
      bottlePoint += bonusPoints;
    });
  }

  void _markAchievementAsClaimed(int index) {
    setState(() {
      achievements[index]['isClaimed'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppState(
      bottlePoint: bottlePoint,
      bottleCollected: bottleCollected,
      historyList: historyList,
      achievements: achievements,
      incrementPoints: _incrementPoints,
      decrementPoints: _decrementPoints,
      addHistory: _addHistory,
      claimAchievement: _claimAchievement,
      markAchievementAsClaimed: _markAchievementAsClaimed,
      child: const MaterialApp(
        home: MainScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    LocationPage(),
    QRScannerPage(),
    const LeaderboardPage(),
    ProfilePage()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: 'Location',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'QR scanner',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events),
              label: 'Leaderboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
