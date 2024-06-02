import 'package:bottlend/app_state.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'Andy Hendra';
  String _number = '+62 812 3456 7896';
  String _email = 'johndoe@example.com';
  File? _image;

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    return Scaffold(
        appBar: AppBar(
          shape:
              const Border(bottom: BorderSide(color: Colors.black, width: 1.5)),
          title: Text(
            'Profile',
            style: TextStyle(
                color: Colors.green,
                fontWeight:
                    FontWeight.bold), // Set the title text color to green
          ),
          backgroundColor:
              Colors.white, // Set the AppBar background color to white
          iconTheme: IconThemeData(
              color: Colors.black), // Set the icons color to black
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : NetworkImage(
                                'https://www.gravatar.com/avatar/1234567890?s=200')
                            as ImageProvider,
                    backgroundColor: Colors.grey[200],
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                    _name,
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Container(
                    width: 350, // Set a fixed width for the card
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
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
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black54),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                appState.bottleCollected.toString(),
                                style: TextStyle(
                                  fontSize: 28.0,
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
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.black54),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                appState.bottlePoint.toString(),
                                style: TextStyle(
                                  fontSize: 28.0,
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
                SizedBox(height: 50.0),
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
                        _email,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black87, // Warna teks hitam
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
                        _number,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black87, // Warna teks hitam
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(
                              name: _name,
                              number: _number,
                              email: _email,
                              image: _image),
                        ),
                      );

                      if (result != null) {
                        setState(() {
                          _name = result['name'];
                          _number = result['number'];
                          _email = result['email'];
                          _image = result['image'];
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Warna tombol hijau
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12.0), // Border radius
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 12.0),
                      child: Text('Edit Profile',
                          style: TextStyle(fontSize: 16.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class EditProfilePage extends StatefulWidget {
  final String name;
  final String number;
  final String email;
  final File? image;

  EditProfilePage(
      {required this.name,
      required this.number,
      required this.email,
      this.image});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? _image;
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _emailController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.name;
    _numberController.text = widget.number;
    _emailController.text = widget.email;
    _image = widget.image;
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _saveChanges() {
    Navigator.pop(context, {
      'name': _nameController.text,
      'number': _numberController.text,
      'email': _emailController.text,
      'image': _image,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile updated successfully!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(color: Colors.green)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 50,
                        )
                      : null,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _numberController,
                decoration: InputDecoration(
                  labelText: 'Nomor',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveChanges,
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 12.0),
                  child: Text('Simpan Perubahan',
                      style: TextStyle(fontSize: 16.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
