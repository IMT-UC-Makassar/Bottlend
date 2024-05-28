import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  Color _containerColor = Colors.transparent;
  Color _textColor = Color(0xff189218);
  String _selectedText = 'Region';
  List<int> numbers = List<int>.generate(47, (int index) => index + 4);

  void _handleTap(String text) {
    setState(() {
      if (text != _selectedText) {
        _containerColor = Colors.black;
        _textColor = Colors.white;
        _selectedText = text;
      } else {
        _containerColor = Colors.transparent;
        _textColor = Color(0xff189218);
        _selectedText = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Points Exchange',
          style: TextStyle(
            color: Color(0xff189218),
            fontWeight: FontWeight.w900,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.stars,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 50.0,
                right: 50.0,
              ),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                          child: CupertinoSegmentedControl(
                            children: {
                              'Region': Container(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Region",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                              'National': Container(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "National",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                              'Global': Container(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Global",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17.0,
                                  ),
                                ),
                              ),
                            },
                            onValueChanged: (value) {
                              _handleTap(value);
                            },
                            groupValue: _selectedText,
                            unselectedColor: Colors.transparent,
                            selectedColor: Color(0xff189218),
                          ),
                      ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 300,
                      child: Stack(
                        children: [
                          Positioned(
                              top: 10,
                              left: 100,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/Piala_1st.png'),
                                        fit: BoxFit.cover)),
                              )),
                          Positioned(
                              top: 80,
                              left: 20,
                              child: Container(
                                width: 70,
                                height: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/Piala_2nd.webp'),
                                        fit: BoxFit.cover)),
                              )),
                          Positioned(
                              bottom: 140,
                              right: 10,
                              child: Container(
                                width: 70,
                                height: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('assets/Piala_3rd.png'),
                                        fit: BoxFit.cover)),
                              )),
                          Positioned(
                              bottom: 0,
                              left: 10,
                              child: SizedBox(
                                width: 100.0,
                                height: 140.0,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 220, 220, 220),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(10.0)))),
                              )),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: SizedBox(
                                width: 100.0,
                                height: 100.0,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 220, 220, 220),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10),
                                  ),
                                )),
                              )),
                          Positioned(
                              top: 110,
                              left: 100,
                              child: SizedBox(
                                width: 100.0,
                                height: 190.0,
                                child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 201, 201, 201),
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(10)))),
                              )),
                          Positioned(
                              left: 20,
                              bottom: 100,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.blue, width: 5)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage('assets/EmotBatu.png'),
                                  ),
                                ),
                              )),
                          Positioned(
                              left: 110,
                              top: 70,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.amber, width: 5)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                        AssetImage('assets/EmotBatu.png'),
                                  ),
                                ),
                              )),
                          Positioned(
                              right: 10,
                              bottom: 80,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.green, width: 5)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage('assets/EmotBatu.png'),
                                  ),
                                ),
                              )),
                          Positioned(
                              top: 160,
                              left: 115,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Jiovani",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "2000 bottle",
                                    style: TextStyle(color: Colors.orange),
                                  )
                                ],
                              )),
                          Positioned(
                              bottom: 60,
                              left: 20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Orang",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "1800 bottle",
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ],
                              )),
                          Positioned(
                              bottom: 40,
                              right: 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Emot Batu",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "1524 bottle",
                                    style: TextStyle(color: Colors.green),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
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
                          ),
                        if (numbers[index] == 4)
                          ListLeaderboard(
                            numbers: numbers[index],
                            mark: 30.0,
                          ),
                        if (index < numbers.length - 1)
                          Divider(
                            height: 1,
                            thickness: 2,
                            color: Colors.black,
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListLeaderboard extends StatelessWidget {
  final int numbers;
  final double mark;

  const ListLeaderboard({Key? key, required this.numbers, required this.mark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffD9D9D9),
          borderRadius: BorderRadius.vertical(top: Radius.circular(mark))),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("#$numbers"),
            Container(
                child: Row(children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/EmotBatu.png"),
              ),
              Text("Orang"),
            ])),
            Text("1302 Bottle"),
          ],
        ),
      ),
    );
  }
}