import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:zomato/home/home_screen/homepage.dart';
import '../Login_Screen/Login_Page.dart';


class OTP_Screen extends StatefulWidget {
  String verificationid;
  OTP_Screen({super.key,required this.verificationid});

  @override
  State<OTP_Screen> createState() => _OTP_ScreenState();
}

class _OTP_ScreenState extends State<OTP_Screen> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('OTP Verification',style: TextStyle(
            fontFamily: fontLight,
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600
        ),),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        width: double.infinity,
        height: 600,
        child: Column(
          children: [
            Text(
              "We have sent a verification code to",
              style: TextStyle(
                  fontFamily: fontLight,
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40,top: 10),
              child: Text(
                "+91 ${MobileNumber.text.toString()}",
                style: TextStyle(
                    fontFamily: fontLight,
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: Colors.black),
                ),
              ),
              onCompleted: (pin) async {
                debugPrint(pin);
                try{
                  PhoneAuthCredential credential = await PhoneAuthProvider.credential(verificationId: widget.verificationid, smsCode: pin);
                  FirebaseAuth.instance.signInWithCredential(credential).then((value){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                  });
                }catch(ex){
                  log(ex.toString());
                }
              },
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Check text messages for your OTP",
                style: TextStyle(
                    fontFamily: fontLight,
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1
                ),
              ),
            ),

            Container(
              child: Text(
                "Go back to login methods",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontFamily: fontLight,
                  letterSpacing: 1,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}