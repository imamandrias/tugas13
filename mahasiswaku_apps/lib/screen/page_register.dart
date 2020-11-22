import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = new GlobalKey<FormState>();
  int value, umur;
  String nama, email, username, password, nomorhp, alamat;
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

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
                    return 'Silahkan Masukan Email';
                  }
                  return null;
                },
                onSaved: (value) => email = value,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.email_rounded),
                  hintText: 'Email',
                  labelText: 'Masukan Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Silahkan Nomor Handphone';
                  }
                  return null;
                },
                onSaved: (value) => nomorhp = value,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.phone_android_rounded),
                  hintText: 'Nomor Handphone',
                  labelText: 'Masukan Nomor Handphone',
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
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextFormField(
                validator: validatePassword,
                onSaved: (value) => password = value,
                obscureText: _secureText,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password',
                    labelText: 'Masukan Password',
                    suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: Icon(_secureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String validatePassword(String value) {
  Pattern pattern = r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[.,?<>!@#\$&*~]).{8,}$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Min 8 karakter, setidaknya terdiri dari: \n - 1 huruf besar, \n - 1 huruf kecil \n - 1 nomor \n - 1 karakter seperti ( . , ?< > ! @ # & * ~ )';
  else
    return null;
}
