import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mahasiswaku_apps/database/db_helper.dart';
import 'package:mahasiswaku_apps/model/model_mahasiswa.dart';
import 'package:mahasiswaku_apps/screen/page_login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  DbHelper db = DbHelper();
  final _key = new GlobalKey<FormState>();
  int value, umur;
  String nama, email, username, password, nomorhp, alamat;
  bool _secureText = true;
  DateTime _datePicked;
  String pilihanFakultas = 'Ilmu Komputer';
  String pilihanJurusan = 'Sistem Informasi';

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime(2007),
            firstDate: DateTime(1999),
            lastDate: DateTime(2007))
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _datePicked = value;
      });
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
            SizedBox(
              height: 16.0,
            ),
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
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                height: 70,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(4, 6),
                      blurRadius: 6,
                      color: Colors.black45,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _datePicked == null
                            ? 'Pilih Tanggal Lahir'
                            : 'Tanggal ${DateFormat.yMd().format(_datePicked)}',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(4, 6),
                            blurRadius: 6,
                            color: Colors.black45,
                          )
                        ],
                      ),
                      child: FlatButton(
                          onPressed: () => _showDatePicker(),
                          child: Text(
                            'Pilih Tanggal',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
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
            Padding(
              padding: EdgeInsets.all(5.0),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Silahkan Masukan Alamat Lengkap';
                  }
                  return null;
                },
                maxLines: 4,
                onSaved: (value) => alamat = value,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.location_on),
                  hintText: 'Alamat',
                  labelText: 'Masukan Alamat',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    height: 100,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(4, 6),
                          blurRadius: 6,
                          color: Colors.black45,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Pilih Fakultas anda:',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            DropdownButton<String>(
                              value: pilihanFakultas,
                              icon: Icon(Icons.arrow_drop_down_circle_outlined),
                              iconSize: 26,
                              elevation: 16,
                              style: TextStyle(color: Colors.black87),
                              underline: Container(
                                height: 4,
                                color: Colors.redAccent,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  pilihanFakultas = newValue;
                                });
                              },
                              items: <String>[
                                'Ilmu Komputer',
                                'Matematika',
                                'Biologi',
                                'Kedokteran'
                              ].map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: Text(value));
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    height: 100,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(4, 6),
                          blurRadius: 6,
                          color: Colors.black45,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Pilih Jurusan anda:',
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            DropdownButton<String>(
                              value: pilihanJurusan,
                              icon: Icon(Icons.arrow_drop_down_circle_outlined),
                              iconSize: 26,
                              elevation: 16,
                              style: TextStyle(color: Colors.black87),
                              underline: Container(
                                height: 4,
                                color: Colors.redAccent,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  pilihanJurusan = newValue;
                                });
                              },
                              items: <String>[
                                'Sistem Informasi',
                                'Teknik Informatika',
                                'Matematika Terapan',
                                'Biologi',
                                'Kedokteran Umum'
                              ].map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value, child: Text(value));
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0),
              child: MaterialButton(
                color: Colors.teal,
                textColor: Colors.white,
                child: Text('Register'),
                onPressed: () {
                  inputMahasiswa();
                  //check();
                  //setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> inputMahasiswa() async {
    await db.simpanMahasiswa(Mahasiswa(
        nama: nama,
        tgl_lahir: _datePicked.toString(),
        email: email,
        nomor_hp: nomorhp,
        username: username,
        password: password,
        alamat: alamat,
        fakultas: pilihanFakultas,
        jurusan: pilihanJurusan));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}

String validatePassword(String value) {
  Pattern pattern =
      r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[.,?<>!@#\$&*~]).{8,}$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Min 8 karakter, setidaknya terdiri dari: \n - 1 huruf besar, \n - 1 huruf kecil \n - 1 nomor \n - 1 karakter seperti ( . , ?< > ! @ # & * ~ )';
  else
    return null;
}
