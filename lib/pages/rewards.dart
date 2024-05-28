import 'package:flutter/material.dart';
import 'navbar.dart';
import 'location.dart';
import 'camera.dart';
import 'profile.dart';

class RewardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards'),
      ),
      body: Center(
        child: Text('This is the Rewards Page'),
      ),
    );
  }
}
