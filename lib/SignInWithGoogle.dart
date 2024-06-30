import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:zomato/home/home_screen/homepage.dart';
import 'Login_Screen/Login_Page.dart';


class CountryCodePickerExample extends StatefulWidget {
  String verificationid;
  CountryCodePickerExample({super.key,required this.verificationid});
  @override
  _CountryCodePickerExampleState createState() => _CountryCodePickerExampleState();
}

class _CountryCodePickerExampleState extends State<CountryCodePickerExample> {
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    final code = await countryPicker.showPicker(
                      context: context,
                    );
                    setState(() {
                      countryCode = code;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        if (countryCode != null)
                          countryCode!.flagImage(),
                        SizedBox(width: 8.0),
                        Text(countryCode?.dialCode ?? '+91', style: TextStyle(fontSize: 16)),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Enter Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try{
                  PhoneAuthCredential credential = await PhoneAuthProvider.credential(verificationId: widget.verificationid, smsCode: phoneController.text.toString());
                  FirebaseAuth.instance.signInWithCredential(credential).then((value){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                  });
                }catch(ex){
                  log(ex.toString());
                }
                // if (countryCode != null && phoneController.text.isNotEmpty) {
                //   final fullPhoneNumber = '${countryCode?.dialCode}${phoneController.text}';
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text('Full Phone Number: $fullPhoneNumber')),
                //   );
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(content: Text('Please enter a valid phone number')),
                //   );
                // }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      )
    );
  }
}