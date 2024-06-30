import 'dart:async';

import 'package:flutter/material.dart';

import '../Login_Screen/Login_Page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => MainLoinPage(),
        ),
      );
    });
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Color(0xffe23744),
        alignment: Alignment.center,
        child: Image(image: AssetImage('assets/Zomato-Logo-SVG.png'),height: 180,),
      ),
    );
  }
}

String fontLight='okra';
String fontBold='okraBold';
