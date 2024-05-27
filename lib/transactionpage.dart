import 'package:flutter/material.dart';

class Transactionpage extends StatefulWidget {
  const Transactionpage({super.key});
  @override
  State<Transactionpage> createState() => _Transactionpagestate();
}

class _Transactionpagestate extends State<Transactionpage> {
  void _refreshpage() {
    setState(() {});
  }

  void _showModal(
    BuildContext context,
    String point,
    String value, {
    Color modalColor = Colors.white,
    BorderRadiusGeometry borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  }) {
    showModalBottomSheet(
      elevation: 1.0,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.4,
              child: GestureDetector(
                onTap: () {}, // Prevent closing the modal when tapping inside it
                child: Container(
                  decoration: BoxDecoration(
                    color: modalColor,
                    borderRadius: borderRadius,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            width: 60,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Your Choice:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      point,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Cost:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      value,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 16,
                        right: 16,
                        child: Row(
                          children: [
                            Text(
                              'Total Points: 2488',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () {
                                _showConfirmationDialog(context, point, value);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                'Exchange',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context, String point, String value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Exchange $value into OVO Cash $point?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      style: TextButton.styleFrom(
                        side: BorderSide(color: Colors.red),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'No',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                        // Add your exchange logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Exchange Successful!')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Yes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Points Exchange',
          style: TextStyle(color: Color(0xff189218), fontWeight: FontWeight.w900),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
        actions: [
          IconButton(
              onPressed: _refreshpage,
              icon: Icon(
                Icons.refresh,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: 150.0,
              height: 100.0,
              child: Image(image: AssetImage('assets/logo_ovo.png')),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 12 / 16,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Phone Number',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          _showModal(context, "Rp.50.000", "248 Point"),
                      child: CustomCard(point: "Rp 50.000", value: "248 Point"),
                    ),
                    GestureDetector(
                      onTap: () =>
                          _showModal(context, "Rp.100.000", "490 Point"),
                      child:
                          CustomCard(point: "Rp 100.000", value: "490 Point"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          _showModal(context, "Rp.50.000", "248 Point"),
                      child: CustomCard(point: "Rp 50.000", value: "248 Point"),
                    ),
                    GestureDetector(
                      onTap: () =>
                          _showModal(context, "Rp.100.000", "490 Point"),
                      child:
                          CustomCard(point: "Rp 100.000", value: "490 Point"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          _showModal(context, "Rp.50.000", "248 Point"),
                      child: CustomCard(point: "Rp 50.000", value: "248 Point"),
                    ),
                    GestureDetector(
                      onTap: () =>
                          _showModal(context, "Rp.100.000", "490 Point"),
                      child:
                          CustomCard(point: "Rp 100.000", value: "490 Point"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String point;
  final String value;

  const CustomCard({
    Key? key,
    required this.point,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0), // Add margin between cards
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4.0,
        child: Container(
          width: 130.0,
          height: 90.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 55.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  border: Border.all(color: Colors.black, width: 0.5),
                ),
                child: Center(
                  child: Text(
                    point,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 35.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Colors.green),
                child: Center(
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
