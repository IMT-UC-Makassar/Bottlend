// historypage.dart
import 'package:flutter/material.dart';
import '../app_state.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final historyList = AppState.of(context).historyList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        shape:
            const Border(bottom: BorderSide(color: Colors.black, width: 1.5)),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'History',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(24, 146, 24, 1)),
            ),
            Icon(Icons.refresh, color: Colors.black)
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (BuildContext context, int index) {
          final action = historyList[index]["action"];
          final date = historyList[index]["date"];
          final pointChange = historyList[index]["pointChange"];
          IconData iconData;
          Color textColor;
          if (pointChange.startsWith('+')) {
            iconData = Icons.add;
            textColor = Colors.green;
          } else {
            iconData = Icons.remove;
            textColor = Colors.red;
          }
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(iconData, color: textColor),
                        const SizedBox(width: 8),
                        Text(
                          action,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Date: $date",
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: textColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        "Point Change: $pointChange",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
