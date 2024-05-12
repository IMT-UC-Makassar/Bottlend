import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> historyList = [
    {"action": "+20 Bottle", "date": "23/04/2019", "pointChange": "+5 Point"},
    {
      "action": "Exchange Gopay Rp. 50.000",
      "date": "29/04/2021",
      "pointChange": "-50 Point"
    },
    {"action": "+97 Bottle", "date": "06/08/2021", "pointChange": "+24 Point"},
    {"action": "+12 Bottle", "date": "23/12/2023", "pointChange": "+3 Point"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shape:
              const Border(bottom: BorderSide(color: Colors.black, width: 1.5)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'History',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(24, 146, 24, 1)),
              ),
              Icon(Icons.refresh)
            ],
          )),
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (BuildContext context, int index) {
          final action = historyList[index]["action"];
          final date = historyList[index]["date"];
          final pointChange = historyList[index]["pointChange"];
          // Periksa tipe tindakan dan tentukan ikon dan warna teks yang sesuai
          IconData iconData;
          Color textColor;
          if (pointChange.startsWith('+')) {
            iconData = Icons.add;
            textColor = Colors.green; // Warna teks untuk penambahan (hijau)
          } else {
            iconData = Icons.remove;
            textColor = Colors.red; // Warna teks untuk pengurangan (merah)
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
                    offset: Offset(0, 2), // Ubah posisi bayangan
                  ),
                ],
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(iconData,
                            color:
                                textColor), // Tambahkan ikon berdasarkan tipe tindakan
                        SizedBox(width: 8),
                        Text(
                          action,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: textColor, // Gunakan warna teks yang sesuai
                            fontWeight:
                                FontWeight.bold, // Tambahkan ketebalan huruf
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Date: $date",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Point Change: $pointChange",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
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
