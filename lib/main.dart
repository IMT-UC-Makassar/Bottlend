import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black, // Warna ikon back hitam
          onPressed: () {
            Navigator.pop(context); // Aksi ketika tombol back ditekan
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.green), // Set the title text color to black
        ),
        backgroundColor:
            Colors.white, // Set the AppBar background color to white
        iconTheme:
            IconThemeData(color: Colors.black), // Set the icons color to black
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    'https://www.gravatar.com/avatar/1234567890?s=200'),
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: Text(
                'Andy Hendra',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: 350, // Set a fixed width for the card
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 3.0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(vertical: 3.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Bottles',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              '110',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Points',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              '9000',
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green, // Warna teks hijau
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 70.0),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.green,
                  ),
                  SizedBox(
                      width:
                          8.0), // Menambahkan sedikit jarak antara ikon dan teks
                  Text(
                    'johndoe@example.com',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 0, 0, 0), // Warna teks hitam
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.phone_iphone,
                    color: Colors.green,
                  ),
                  SizedBox(
                      width:
                          8.0), // Menambahkan sedikit jarak antara ikon dan teks
                  Text(
                    '+62 812 3456 7896',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 0, 0, 0), // Warna teks hitam
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 56.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to EditProfilePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text('Edit Profile'),
                        ),
                        body: Center(
                          child: Text('Edit Profile Page'),
                        ),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
      primary: Colors.green, // Warna tombol hijau
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Border radius
      ),
    ),
                child: Text('Edit Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    ));
