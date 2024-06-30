import 'package:flutter/material.dart';

import '../Login_Screen/Login_Page.dart';

class Gold extends StatefulWidget {
  const Gold({super.key});

  @override
  State<Gold> createState() => _GoldState();
}

class _GoldState extends State<Gold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Image(image: AssetImage('assets/gold1.jpg'),fit: BoxFit.cover,),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 35),
            height: 60,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Text(
                  'Zomato Gold',
                  style: TextStyle(
                    fontFamily: fontBold,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  fontSize: 20),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
