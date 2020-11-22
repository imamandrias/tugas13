import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mahasiswaku_apps/screen/page_login.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF009688),
              gradient: LinearGradient(
                colors: [Color(0xFF1DE9B6), Color(0xFF80D8FF)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft
              )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 75.0,
                child: Icon(
                  Icons.school_rounded,
                  color: Colors.deepOrange,
                  size: 50.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              Text(
                'Mahasiswaku Apps',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 28.0
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Future<Timer> startTimer() async{
    return Timer(
        Duration(seconds: 3), onDone);
  }
  void onDone(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context)=>LoginPage()
        )
    );
  }
}
