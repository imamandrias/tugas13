import 'package:flutter/material.dart';
import 'package:mahasiswaku_apps/screen/page_register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _key = new GlobalKey<FormState>();
  int value;
  String username, password;
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
        title: Text('LOGIN'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(5.0),
          children: [
            SizedBox(
              height: 80.0,
            ),
            Image.asset(
              'gambar/mahasiswaku.png',
              height: 100.0,
              width: 100.0,
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
                validator: (value) {
                  if (value.isEmpty) {
                    return "Silahkan Masukan Password";
                  }
                  return null;
                },
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
            Padding(
              padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0),
              child: MaterialButton(
                color: Colors.teal,
                textColor: Colors.white,
                child: Text('Login'),
                onPressed: () {
                  //check();
                  //setState(() {});
                },
              ),
            ),
            FlatButton(
              child: Text(
                'Belum Terdaftar? Daftar Sekarang',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>RegisterPage()
                ),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
