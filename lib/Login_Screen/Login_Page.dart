import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:zomato/Profile_Screen/Profile_Screen.dart';
import '../Controller/Login_controller.dart';
import '../Firebase/FirebaseService.dart';
import '../OTP_Screen/OTP_Screen.dart';
import '../SignInWithGoogle.dart';
import '../home/home_screen/homepage.dart';

class MainLoinPage extends StatefulWidget {
  const MainLoinPage({super.key});

  @override
  State<MainLoinPage> createState() => _HomePageState();
}

class _HomePageState extends State<MainLoinPage> {
  void upadate() {
    setState(() {});
  }

  LoginController loginController = Get.put(LoginController());
  User? user = FirebaseAuth.instance.currentUser;
  final countryPicker = FlCountryCodePicker(countryTextStyle: TextStyle(fontFamily: fontLight,fontWeight: FontWeight.w600),dialCodeTextStyle: TextStyle(fontFamily: fontLight,fontWeight: FontWeight.w600,fontSize: 15),searchBarTextStyle: TextStyle(fontFamily: fontLight,),searchBarDecoration: InputDecoration(hintText: 'Search by country name',prefixIcon: const Icon(Icons.search),focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.red,width: 2),borderRadius: BorderRadius.circular(10),),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: const BorderSide(color: Colors.grey),)),title: const Text(''),);
  CountryCode countryCode = const CountryCode(
    name: 'India',
    code: 'IN',
    dialCode: '+91',
  );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight / 2.2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/main.jpg',
                      ),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                  // margin: EdgeInsets.symmetric(vertical: 15),
                  width: screenWidth / 1.5,
                  height: screenHeight / 8,
                  alignment: Alignment.center,
                  child: Text(
                    'India\'s #1 Food Delivery and Dining App',
                    style: TextStyle(
                        fontFamily: fontBold,
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  )),
              Row(
                children: [
                  const SizedBox(width: 15,),
                  const Expanded(child: Divider()),
                  Text(
                    '  Log in or sign up  ',
                    style:
                        TextStyle(fontFamily: fontLight,color: Colors.grey.shade700,fontWeight: FontWeight.w600,),
                  ),
                  const Expanded(child: Divider()),
                  const SizedBox(width: 15,),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: screenWidth,
                      height: 50,
                      margin: const EdgeInsets.only(left: 15, right: 0, top: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () async {
                          final code = await countryPicker.showPicker(
                            context: context,
                          );
                          setState(() {
                            countryCode = code!;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 8.0),
                            if (countryCode != null) countryCode!.flagImage(),
                            const SizedBox(width: 8.0),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: screenWidth,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      margin: const EdgeInsets.only(right: 15, left: 10, top: 15),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Text(countryCode?.dialCode ?? '+91',
                              style: TextStyle(
                                fontFamily: fontLight,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                          Expanded(
                            child: TextField(
                              cursorColor: Colors.red,
                              keyboardType: TextInputType.number,
                              controller: MobileNumber,
                              style: TextStyle(
                                fontFamily: fontLight,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                              decoration: const InputDecoration(
                                  hintText: 'Enter Mobile Number',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  print('object');
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException ex) {},
                    codeSent: (String verificationid, int? resenttoken) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTP_Screen(
                              verificationid: verificationid,
                            ),
                          ));
                    },
                    codeAutoRetrievalTimeout: (String verificationid) {},
                    phoneNumber:
                        countryCode!.dialCode + MobileNumber.text.toString(),
                  );
                  // loginController.login();
                },
                child: Container(
                  width: screenWidth,
                  height: 50,
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red),
                  alignment: Alignment.center,
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 15,),
                  const Expanded(child: Divider()),
                  Text(
                    '  or  ',
                    style:
                    TextStyle(fontFamily: fontLight,color: Colors.grey.shade700,fontWeight: FontWeight.w600,),
                  ),
                  const Expanded(child: Divider()),
                  const SizedBox(width: 15,),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300)),
                    child: IconButton(
                      onPressed: () async {
                        await FirebaseService.signInwithGoogle(context);
                        loginController.login();
                      },
                      icon: Brand(Brands.google),
                    ),
                  ),
                  // SizedBox(height: 20,),
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300)),
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                          return Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey.shade300)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Brand(Brands.facebook,colorFilter: const ColorFilter.srgbToLinearGamma(),),
                                        Text(' Continue With Facebook',
                                          style:
                                          TextStyle(fontFamily: fontLight,color: Colors.grey.shade700,fontWeight: FontWeight.w600,letterSpacing: 1.5),)
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey.shade300)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(EvaIcons.email_outline),
                                        Text(' Continue With Email',
                                          style:
                                          TextStyle(fontFamily: fontLight,color: Colors.grey.shade700,fontWeight: FontWeight.w600,letterSpacing: 1.5),)
                                      ],
                                    ),
                                  ),
                                  const Spacer(),

                                ],
                              ),
                            ),
                          );
                        });
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => CountryCodePickerExample(verificationid: verificationid,),
                        // ));
                      },
                      icon: const Icon(
                        Icons.more_horiz_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  // margin: EdgeInsets.symmetric(vertical: 10),
                  width: screenWidth / 1.4,
                  alignment: Alignment.center,
                  child: const Text(
                    'By continuing, you agree to our',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: Colors.black54),
                    textAlign: TextAlign.center,
                  )),
              Container(
                  // margin: EdgeInsets.symmetric(vertical: 25),
                  // width: screenWidth / 2,
                  alignment: Alignment.center,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Terms of Service',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                            decoration: TextDecoration.underline,
                            color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        'Privacy Policy',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            decoration: TextDecoration.underline,
                            color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        'Content Policy',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            decoration: TextDecoration.underline,
                            color: Colors.black54),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
            ],
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(25)),
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 480,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10, left: 15),
                                  child: const Text(
                                    'Choose your language',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 12, right: 12, top: 4),
                                  width: double.infinity,
                                  height: 85,
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      Radio<String>(
                                        activeColor: Colors.red,
                                        value: 'English',
                                        groupValue: selectedLanguage,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedLanguage = value!;
                                          });
                                        },
                                      ),
                                      const Text(
                                        'English',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 12, right: 12, top: 4),
                                  width: double.infinity,
                                  height: 85,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      Radio<String>(
                                        activeColor: Colors.red,
                                        value: 'ગુજરાતી',
                                        groupValue: selectedLanguage,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedLanguage = value!;
                                          });
                                          upadate();
                                        },
                                      ),
                                      const Text(
                                        'ગુજરાતી',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 12, right: 12, top: 4),
                                  width: double.infinity,
                                  height: 85,
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      Radio<String>(
                                        activeColor: Colors.red,
                                        value: 'Hindi',
                                        groupValue: selectedLanguage,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedLanguage = value!;
                                          });
                                        },
                                      ),
                                      const Text(
                                        'हिंदी',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 12, right: 12, top: 4),
                                  width: double.infinity,
                                  height: 85,
                                  decoration: BoxDecoration(
                                      color: Colors.black26,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      Radio<String>(
                                        activeColor: Colors.red,
                                        value: 'Marathi',
                                        groupValue: selectedLanguage,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedLanguage = value!;
                                          });
                                        },
                                      ),
                                      const Text(
                                        'मराठी',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Handle the select button tap
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    margin: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.red),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Select',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.g_translate_outlined,
                      color: Colors.white60,
                      size: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                  },
                  child: Container(
                      width: 60,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(25)),
                      child:   Center(
                        child: Text(
                            'Skip',
                            style: TextStyle(color: Colors.white60,fontFamily: fontLight,fontWeight: FontWeight.w600),
                          ),
                      ),
                      )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

TextEditingController MobileNumber = TextEditingController();

String fontLight = 'okra';
String fontBold = 'okraBold';

String? selectedLanguage;
