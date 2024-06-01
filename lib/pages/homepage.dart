import 'dart:math' as math;
import 'package:bottlend_apps/pages/historypage.dart';
import 'package:bottlend_apps/pages/transactionpage.dart';
import 'package:bottlend_apps/widgets/button.dart';
import 'package:bottlend_apps/widgets/customcard.dart';
import 'package:flutter/material.dart';
import '../app_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> buttonList = [
    'Dana',
    'Gopay',
    'OVO',
    'ShopeePay',
    'IM3',
    'Telkomsel',
    'Tri',
    'Allobank'
  ];

  void claimAchievement(int bonusPoints) {
    setState(() {
      final appState = AppState.of(context);
      appState.bottlePoint += bonusPoints; // Add bonus points to bottlePoint
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);

    int timeRemaining = 6;
    int bottleDone = appState.bottleCollected;
    int bottleRemaining = 8;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape:
            const Border(bottom: BorderSide(color: Colors.black, width: 1.5)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset('lib/assets/logo.png'),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.support_agent),
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
              child: Card(
                color: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: const Color.fromRGBO(24, 146, 24, 1),
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Bottle Point',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                appState.bottlePoint.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(255, 214, 0, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Bottle Collected',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(24, 146, 24, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${appState.bottleCollected} Pcs',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HistoryPage()));
                                    },
                                    child: Row(
                                      children: [
                                        const Text('History',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                        const SizedBox(width: 5),
                                        Transform.rotate(
                                          angle: 45 * math.pi / 6,
                                          child: const Icon(Icons
                                              .arrow_drop_down_circle_outlined),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // List E-Wallet
            const SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 10.0,
                runSpacing: 10.0,
                children: List.generate(
                  buttonList.length,
                  (index) => Column(
                    children: [
                      ButtonList(
                        imagePath:
                            'lib/assets/${buttonList[index].toLowerCase()}.png',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Transactionpage(
                                      decrementPoints: appState
                                          .decrementPoints))); // Pass decrementPoints
                        },
                      ),
                      const SizedBox(height: 5),
                      Text(buttonList[index]),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Daily quest
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(24, 146, 24, 1)),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('lib/assets/dailyq.png'),
                          Column(
                            children: [
                              const Text(
                                'Daily Quest',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 18),
                                  const Icon(
                                    Icons.access_time_sharp,
                                    color: Colors.red,
                                    size: 12,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    '$timeRemaining Hours Left',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        child: Text(
                            '$bottleDone of $bottleRemaining deliveries completed'),
                      ),
                      const SizedBox(height: 5),
                      LinearProgressIndicator(
                        value: bottleDone / bottleRemaining,
                        backgroundColor: Colors.white,
                        color: const Color.fromRGBO(24, 146, 24, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Bottlend Product
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bottlend Product',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: const Color.fromRGBO(24, 146, 24, 1)),
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (4 /
                                2 *
                                MediaQuery.of(context).size.height *
                                0.38)),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      String description = '';
                      int points = 0;
                      switch (index) {
                        case 0:
                          description = 'Sepatu Elite';
                          points = 150;
                          break;
                        case 1:
                          description = 'Baju Ganteng';
                          points = 120;
                          break;
                        case 2:
                          description = 'Tas Daun Ulang';
                          points = 200;
                          break;
                        case 3:
                          description = 'Topi UI/UX';
                          points = 80;
                          break;
                      }
                      return CustomCard(
                        description: description,
                        points: points,
                        imagePath: 'lib/assets/merchandise_${[
                          'sepatu',
                          'baju',
                          'tas',
                          'topi'
                        ][index]}.jpg',
                        onPressed: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
