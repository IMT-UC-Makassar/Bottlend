import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AchievementCard(),
    );
  }
}

class AchievementCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievement Card'),
      ),
      body: ListView(
        // Use ListView to hold multiple cards
        children: [
          buildAchievementCard(),
          buildAchievementCard(),
          buildAchievementCard(),
          buildAchievementCard(),
        ],
      ),
    );
  }

  Widget buildAchievementCard() {
    return Card(
      elevation: 4,
      color: Color.fromARGB(255, 255, 255, 255), // Set the color of the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: Colors.green, // Set the color of the border
          width: 2, // Set the width of the border
        ),
      ),
      // Set the size of the card
      child: SizedBox(
        width: 100, // Set your desired max width
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      child: Image.asset(
                        'images/botol.png',
                        width: 150,
                        height: 100,
                      ),
                    ),
                    SizedBox(
                        width: 16), // Add some space between image and text
                    // Text and Button on the right
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0), // Tambahkan padding atas di sini
                            child: Text(
                              'Bottle Killer',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            'Put in 5 bottles',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                ),
                                onPressed: () {
                                  // Add your claim logic here
                                },
                                child: Text(
                                  'Claim',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 51.0, // Ubah padding ke kiri di sini
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '8 of 8 deliveries completed',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: LinearProgressIndicator(
                value: 0.75,
                minHeight: 10,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ],
),

              ],
            )),
      ),
    );
  }
}
