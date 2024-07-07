import 'dart:async';

import 'package:flutter/material.dart';
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
    Timer.periodic(Duration(seconds: 3), (timer) {
      Navigator.of(context).pushReplacementNamed('/');
    },);
    // Timer(const Duration(seconds: 3), () {
      // pushReplacement(
      //   MaterialPageRoute(
      //     builder: (BuildContext context) => const MainLoinPage(),
      //   ),
      // );
    // });
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Color(0xffe23744),
        alignment: Alignment.center,
        child: const Image(image: AssetImage('assets/Zomato-Logo-SVG.png'),height: 180,),
      ),
    );
  }
}

String fontLight='okra';
String fontBold='okraBold';
