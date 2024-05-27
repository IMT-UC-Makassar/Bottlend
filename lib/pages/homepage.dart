import 'dart:math' as math;

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottlePoint = 0;
  int bottleCollected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shape: Border(bottom: BorderSide(color: Colors.black, width: 1.5)),
          title: Row(
            children: <Widget>[
              Image.asset('lib/assets/logo.png'),
              Row(
                children: [
                  Container(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications_outlined)),
                  ),
                  Container(
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.headphones)),
                  ),
                ],
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 30, right: 30),
              child: Card(
                  color: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: Color.fromRGBO(24, 146, 24, 1),
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Bottle Point',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    bottlePoint.toString(),
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 214, 0, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          child: Container(
                            color: Colors.white,
                            height: MediaQuery.sizeOf(context).height * 0.1,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Bottle Collected',
                                    style: TextStyle(
                                      color: Color.fromRGBO(24, 146, 24, 1),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '$bottleCollected Pcs',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(children: [
                                        Text('History',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(width: 5),
                                        Transform.rotate(
                                          angle: 45 * math.pi / 6,
                                          child: Icon(Icons
                                              .arrow_drop_down_circle_outlined),
                                        ),
                                      ])
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))
                    ],
                  )),
            ),
            SizedBox(height: 30),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                            width: 50,
                            height: 50,
                            child: Image.asset('lib/assets/ovo.png')),
                      ),
                      Card(
                        color: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                            width: 50,
                            height: 50,
                            child: Image.asset('lib/assets/dana.png')),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Image.asset('lib/assets/ovo.png')),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
