import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = new GlobalKey<FormState>();
  int value, umur;
  String nama, email, username, password, nomorhp, alamat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTER'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(5.0),
          children: [
            SizedBox(height: 16.0,),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Silahkan Masukan Nama Lengkap';
                  }
                  return null;
                },
                onSaved: (value) => nama = value,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Nama Lengkap',
                  labelText: 'Masukan Nama Lengkap',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Silahkan Masukan Username';
                  }
                  return null;
                },
                onSaved: (value) => username = value,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Username',
                  labelText: 'Masukan Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
