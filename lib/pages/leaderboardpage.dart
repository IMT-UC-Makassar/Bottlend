import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  String _selectedText = 'Region';
  List<int> numbers = List<int>.generate(47, (int index) => index + 4);

  void _handleTap(String text) {
    setState(() {
      _selectedText = text;
    });
  }

  Widget _buildSegment(String text) {
    final bool isSelected = _selectedText == text;
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 17.0,
          color: isSelected ? Colors.white : const Color(0xff189218),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape:
            const Border(bottom: BorderSide(color: Colors.black, width: 1.5)),
        backgroundColor: Colors.white,
        title: const Text(
          'Leaderboard',
          style: TextStyle(
            color: Color(0xff189218),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.stars,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  CupertinoSegmentedControl<String>(
                    borderColor: const Color(0xff189218),
                    children: {
                      'Region': _buildSegment('Region'),
                      'National': _buildSegment('National'),
                      'Global': _buildSegment('Global'),
                    },
                    onValueChanged: (value) {
                      _handleTap(value);
                    },
                    groupValue: _selectedText,
                    unselectedColor: Colors.transparent,
                    selectedColor: const Color(0xff189218),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 300,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        // Third place
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: PodiumPlace(
                            rank: 3,
                            name: "Orang Pintar",
                            bottles: 1755,
                            imagePath: 'lib/assets/gambarorang.webp',
                            trophyPath: 'assets/Piala_3rd.png',
                            podiumHeight: 100,
                            textColor: Colors.brown,
                          ),
                        ),
                        // First place
                        Positioned(
                          bottom: 0,
                          child: PodiumPlace(
                            rank: 1,
                            name: "Jiovani",
                            bottles: 1990,
                            imagePath: 'lib/assets/Johan.png',
                            trophyPath: 'assets/Piala_1st.png',
                            podiumHeight: 150,
                            textColor: Colors.yellow,
                          ),
                        ),
                        // Second place
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: PodiumPlace(
                            rank: 2,
                            name: "Orang Utan",
                            bottles: 1873,
                            imagePath: 'lib/assets/gambarutan.jpeg',
                            trophyPath: 'assets/Piala_2nd.webp',
                            podiumHeight: 125,
                            textColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
              itemCount: numbers.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (numbers[index] > 4)
                      ListLeaderboard(
                        numbers: numbers[index],
                        mark: 0.0,
                        name: "Orang$index",
                        bottles: 1300 - index,
                        imagePath: 'assets/EmotBatu.png',
                      ),
                    if (numbers[index] == 4)
                      ListLeaderboard(
                        numbers: numbers[index],
                        mark: 30.0,
                        name: "Orang$index",
                        bottles: 1300 - index,
                        imagePath: 'assets/EmotBatu.png',
                      ),
                    if (index < numbers.length - 1)
                      const Divider(
                        height: 1,
                        thickness: 2,
                        color: Colors.black,
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PodiumPlace extends StatelessWidget {
  final int rank;
  final String name;
  final int bottles;
  final String imagePath;
  final String trophyPath;
  final double podiumHeight;
  final Color textColor;

  PodiumPlace({
    required this.rank,
    required this.name,
    required this.bottles,
    required this.imagePath,
    required this.trophyPath,
    required this.podiumHeight,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  trophyPath,
                  width: rank == 1 ? 50 : 40,
                  height: rank == 1 ? 50 : 40,
                ),
                SizedBox(height: 5),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(imagePath),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 5),
        Container(
          width: 100,
          height: podiumHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: [Colors.grey.shade300, Colors.grey.shade500],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "$bottles Bottles",
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ListLeaderboard extends StatelessWidget {
  final int numbers;
  final double mark;
  final String name;
  final int bottles;
  final String imagePath;

  const ListLeaderboard({
    Key? key,
    required this.numbers,
    required this.mark,
    required this.name,
    required this.bottles,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(mark)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "#$numbers",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(imagePath),
                ),
                SizedBox(width: 10),
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Text(
              "$bottles Bottle${bottles > 1 ? 's' : ''}",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
