import 'package:equal_space/equal_space.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:icons_plus/icons_plus.dart';
import '../Controller/Login_controller.dart';
import 'Gold.dart';
import '../Login_Screen/Login_Page.dart';

class Extra extends StatefulWidget {
  const Extra({super.key});

  @override
  State<Extra> createState() => _ExtraState();
}

class _ExtraState extends State<Extra> {
  LoginController loginController = Get.put(LoginController());
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          'Zomato',
          style: TextStyle(
              fontFamily: fontBold,
              color: Colors.black,
              fontWeight: FontWeight.w600,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: SpacedColumn(
          space: 10.0,
          children: [
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(user!.photoURL!),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user!.displayName!,
                            style: TextStyle(
                                fontFamily: fontBold,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 25),
                          ),
                          Text(
                            user!.email!,
                            style: TextStyle(
                                fontFamily: fontLight,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'View activity',
                            style: TextStyle(
                                color: Colors.red, fontFamily: fontLight),
                          ),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Gold(),
                            ));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        padding: EdgeInsets.only(left: 15, bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(AntDesign.crown_fill),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 320,
                              height: 50,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Join Zomato Gold',
                                    style: TextStyle(
                                        fontFamily: fontLight,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                        fontSize: 20),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SpacedColumn(
                  space: 10.0,
                  children: [
                    // TODO ROW
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.favorite_border_rounded),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Favourites',
                                  style: TextStyle(
                                      fontFamily: fontLight,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 100,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Bootstrap.currency_rupee),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Money',
                                  style: TextStyle(
                                      fontFamily: fontLight,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // TODO FOOD ORDER
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 5,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Color(0xffe23744),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xffe23744),
                                      width: 6,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Food Orders',
                                style: TextStyle(
                                    fontFamily: fontBold,
                                    fontSize: 20,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ...List.generate(
                            Food_Order_List.length,
                            (index) => Container(
                              margin: EdgeInsets.only(left: 15, bottom: 5),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Food_Order_List[index]['icon']),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 338.5,
                                    height: 50,
                                    padding: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      border: 5 == 1
                                          ? Border(bottom: BorderSide.none)
                                          : Border(
                                              bottom: BorderSide(
                                                  color: Colors.black26,
                                                  width: 0.4)),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          Food_Order_List[index]['text'],
                                          style: TextStyle(
                                              fontFamily: fontLight,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                              fontSize: 20),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TODO DINING
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 5,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Color(0xffe23744),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xffe23744),
                                      width: 6,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Dining',
                                style: TextStyle(
                                    fontFamily: fontBold,
                                    fontSize: 20,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ...List.generate(
                            DiningList.length,
                            (index) => Container(
                              margin: EdgeInsets.only(left: 15, bottom: 5),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(DiningList[index]['icon']),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 338.5,
                                    height: 50,
                                    padding: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      border: 5 == 1
                                          ? Border(bottom: BorderSide.none)
                                          : Border(
                                              bottom: BorderSide(
                                                  color: Colors.black26,
                                                  width: 0.4)),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          DiningList[index]['text'],
                                          style: TextStyle(
                                              fontFamily: fontLight,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                              fontSize: 20),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TODO MONEY
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 5,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Color(0xffe23744),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xffe23744),
                                      width: 6,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Money',
                                style: TextStyle(
                                    fontFamily: fontBold,
                                    fontSize: 20,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ...List.generate(
                            MoneyList.length,
                            (index) => Container(
                              margin: EdgeInsets.only(left: 15, bottom: 5),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(MoneyList[index]['icon']),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 338.5,
                                    height: 50,
                                    padding: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      border: 5 == 1
                                          ? Border(bottom: BorderSide.none)
                                          : Border(
                                              bottom: BorderSide(
                                                  color: Colors.black26,
                                                  width: 0.4)),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          MoneyList[index]['text'],
                                          style: TextStyle(
                                              fontFamily: fontLight,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                              fontSize: 20),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TODO ZOMATO FOR ENTERPRISE
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 5,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Color(0xffe23744),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xffe23744),
                                      width: 6,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Zomato For Enterprise',
                                style: TextStyle(
                                    fontFamily: fontBold,
                                    fontSize: 20,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ...List.generate(
                            Zomato_for_enterprise_List.length,
                            (index) => Container(
                              margin: EdgeInsets.only(left: 15, bottom: 5),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Zomato_for_enterprise_List[index]['icon']),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 338.5,
                                    height: 50,
                                    padding: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      border: 5 == 1
                                          ? Border(bottom: BorderSide.none)
                                          : Border(
                                              bottom: BorderSide(
                                                  color: Colors.black26,
                                                  width: 0.4)),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          Zomato_for_enterprise_List[index]['text'],
                                          style: TextStyle(
                                              fontFamily: fontLight,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                              fontSize: 20),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TODO COUPON
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 5,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Color(0xffe23744),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xffe23744),
                                      width: 6,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Coupon',
                                style: TextStyle(
                                    fontFamily: fontBold,
                                    fontSize: 20,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ...List.generate(
                            Coupan_List.length,
                            (index) => Container(
                              margin: EdgeInsets.only(left: 15, bottom: 5),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Coupan_List[index]['icon']),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 338.5,
                                    height: 50,
                                    padding: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      border: 5 == 1
                                          ? Border(bottom: BorderSide.none)
                                          : Border(
                                              bottom: BorderSide(
                                                  color: Colors.black26,
                                                  width: 0.4)),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          Coupan_List[index]['text'],
                                          style: TextStyle(
                                              fontFamily: fontLight,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                              fontSize: 20),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TODO RESTAURANT AWARDS
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 5,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Color(0xffe23744),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xffe23744),
                                      width: 6,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Restaurant Awards',
                                style: TextStyle(
                                    fontFamily: fontBold,
                                    fontSize: 20,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ...List.generate(
                            Restaurent_Awards_List.length,
                            (index) => Container(
                              margin: EdgeInsets.only(left: 15, bottom: 5),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Restaurent_Awards_List[index]['icon']),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 338.5,
                                    height: 50,
                                    padding: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      border: 5 == 1
                                          ? Border(bottom: BorderSide.none)
                                          : Border(
                                              bottom: BorderSide(
                                                  color: Colors.black26,
                                                  width: 0.4)),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          Restaurent_Awards_List[index]['text'],
                                          style: TextStyle(
                                              fontFamily: fontLight,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                              fontSize: 20),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // TODO MORE
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 5,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: Color(0xffe23744),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  border: Border(
                                    left: BorderSide(
                                      color: Color(0xffe23744),
                                      width: 6,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'More',
                                style: TextStyle(
                                    fontFamily: fontBold,
                                    fontSize: 20,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ...List.generate(
                            More_List.length,
                            (index) => GestureDetector(
                              onTap: () {
                                if(index==4)
                                  {
                                    LoginController.logOut();
                                  }
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 15, bottom: 5),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(More_List[index]['icon']),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 338.5,
                                      height: 50,
                                      padding: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        border: 5 == 1
                                            ? Border(bottom: BorderSide.none)
                                            : Border(
                                                bottom: BorderSide(
                                                    color: Colors.black26,
                                                    width: 0.4)),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            More_List[index]['text'],
                                            style: TextStyle(
                                                fontFamily: fontLight,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1,
                                                fontSize: 20),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List IconList = [
  {
    'icon': Icons.person,
    'text': 'Your Profile',
  },
  {
    // 'icon':Icons.,
    'text': 'Veg Mode',
  },
  {
    'icon': Icons.star_border,
    'text': 'Your ratings',
  },
];
List HandCricketList = [
  {
    'icon': Icons.sports_cricket_outlined,
    'text': 'ZPL Hand Cricket',
  },
];
List Food_Order_List = [
  {
    'icon': Icons.book,
    'text': 'Your orders',
  },
  {
    'icon': Icons.favorite_border_outlined,
    'text': 'Favourite orders',
  },
  {
    'icon': Icons.train_outlined,
    'text': 'Order on train',
  },
  {
    'icon': Icons.book,
    'text': 'Address book',
  },
  {
    'icon': Icons.visibility_off_outlined,
    'text': 'Hidden Restaurants',
  },
  {
    'icon': Icons.insert_comment_outlined,
    'text': 'Online ordering help',
  },
];
List DiningList = [
  {
    'icon': Icons.history_toggle_off_outlined,
    'text': 'Your dining transaction',
  },
  {
    'icon': Icons.redeem_outlined,
    'text': 'Your dining rewards',
  },
  {
    'icon': Icons.deck_outlined,
    'text': 'Table reservations',
  },
  {
    'icon': Icons.insert_comment_outlined,
    'text': 'Dining help',
  },
  {
    'icon': Icons.question_mark_outlined,
    'text': 'Frequently asked questions',
  },
];
List MoneyList = [
  {
    'icon': Icons.currency_rupee_outlined,
    'text': 'Zomato Money',
  },
  {
    'icon': Icons.redeem_outlined,
    'text': 'Buy Gift Card',
  },
  {
    'icon': Icons.style_outlined,
    'text': 'Claim Gift Card',
  },
  {
    'icon': Icons.wallet,
    'text': 'Zomato Wallet',
  },
];
List Zomato_for_enterprise_List = [
  {
    'icon': Icons.apartment,
    'text': 'For employers',
  },
  {
    'icon': Icons.account_box_outlined,
    'text': 'For employees',
  },
];
List Coupan_List = [
  {
    'icon': Icons.percent,
    'text': 'Collected coupons',
  },
  {
    'icon': Icons.percent_rounded,
    'text': 'Apply membership coupons',
  },
];
List Restaurent_Awards_List = [
  {
    'icon': Icons.emoji_events_outlined,
    'text': 'Restaurant Awards 2024',
  },
];
List More_List = [
  {
    'icon': Icons.translate,
    'text': 'Choose language',
  },
  {
    'icon': Icons.info_outline,
    'text': 'About',
  },
  {
    'icon': Icons.edit_square,
    'text': 'Send feedback',
  },
  {
    'icon': Icons.settings,
    'text': 'Settings',
  },
  {
    'icon': Icons.power_settings_new,
    'text': 'Log out',
  },
];
