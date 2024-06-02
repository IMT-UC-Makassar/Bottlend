import 'package:flutter/material.dart';
import 'package:bottlend/app_state.dart';
import 'package:intl/intl.dart';

class Transactionpage extends StatefulWidget {
  final void Function(int) decrementPoints;
  final String walletName; // Add this parameter
  final String logoPath; // Add this parameter

  const Transactionpage({
    Key? key,
    required this.decrementPoints,
    required this.walletName, // Add this parameter
    required this.logoPath, // Add this parameter
  }) : super(key: key);

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
      barrierColor: Colors.black.withOpacity(0.5), // Added this line
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
                onTap:
                    () {}, // Prevent closing the modal when tapping inside it
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
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                                    const Text(
                                      'Your Choice:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      point,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text(
                                      'Cost:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      value,
                                      style: const TextStyle(
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
                              'Total Points: ${AppState.of(context).bottlePoint}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 8),
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
                              child: const Text(
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

  void _showConfirmationDialog(
      BuildContext context, String point, String value) {
    int pointCost = int.parse(
        value.split(' ')[0]); // Extract the numeric value from the string

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
                  'Exchange $value into ${widget.walletName} Cash $point?',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      style: TextButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'No',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Decrement points using the passed decrementPoints function
                        widget.decrementPoints(pointCost);
                        final appState = AppState.of(context);

                        String formattedDate =
                            DateFormat('dd/MM/yyyy').format(DateTime.now());
                        appState.addHistory(
                            'Exchange ${widget.walletName} $point',
                            formattedDate,
                            value);
                        // Close both the confirmation dialog and the modal
                        Navigator.of(context)
                            .pop(); // Close the confirmation dialog
                        Navigator.of(context).pop(); // Close the bottom modal
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Exchange Successful!')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
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
        shape:
            const Border(bottom: BorderSide(color: Colors.black, width: 1.5)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Points Exchange - ${widget.walletName}', // Display wallet name
          style: const TextStyle(
              color: Color(0xff189218), fontWeight: FontWeight.w900),
        ),
        actions: [
          IconButton(
            onPressed: _refreshpage,
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 150.0,
                height: 100.0,
                child:
                    Image(image: AssetImage(widget.logoPath)), // Display logo
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 12 / 16,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Phone Number',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0, // Space between items in the same row
                runSpacing: 8.0, // Space between rows
                children: [
                  GestureDetector(
                    onTap: () => _showModal(context, "Rp.25.000", "248 Point"),
                    child: CustomCardTransaction(
                        point: "Rp.25.000", value: "248 Point"),
                  ),
                  GestureDetector(
                    onTap: () => _showModal(context, "Rp.50.000", "490 Point"),
                    child: CustomCardTransaction(
                        point: "Rp.50.000", value: "490 Point"),
                  ),
                  GestureDetector(
                    onTap: () => _showModal(context, "Rp.75.000", "700 Point"),
                    child: CustomCardTransaction(
                        point: "Rp.75.000", value: "700 Point"),
                  ),
                  GestureDetector(
                    onTap: () => _showModal(context, "Rp.100.000", "800 Point"),
                    child: CustomCardTransaction(
                        point: "Rp.100.000", value: "800 Point"),
                  ),
                  GestureDetector(
                    onTap: () =>
                        _showModal(context, "Rp.500.000", "3996 Point"),
                    child: CustomCardTransaction(
                        point: "Rp.500.000", value: "3996 Point"),
                  ),
                  GestureDetector(
                    onTap: () =>
                        _showModal(context, "Rp.1.000.000", "7500 Point"),
                    child: CustomCardTransaction(
                        point: "Rp.1.000.000", value: "7500 Point"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCardTransaction extends StatelessWidget {
  final String point;
  final String value;

  const CustomCardTransaction({
    Key? key,
    required this.point,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 108,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 50.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: Text(
                point,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 50.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.green,
              ),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
