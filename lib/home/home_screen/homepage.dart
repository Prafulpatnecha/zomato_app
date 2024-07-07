import 'package:carousel_slider/carousel_slider.dart';
import 'package:equal_space/equal_space.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zomato/utils/sliderfuntion_variable.dart';
import '../../Profile_Screen/Profile_Screen.dart';
import '../../utils/color.dart';
import '../../utils/globle_image.dart';
import '../../utils/globle_model.dart';
import '../../utils/globle_product_list.dart';
import '../../utils/globle_values.dart';
import '../../utils/randome_list.dart';
import '../components/Containers.dart';
import '../components/funtions_use.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    imageMap();
    exploreList = FoodModel.toList(list1: imageListExplore);
    productListModelUseJoin = FoodModel.toList(list1: productDetailsListJoin);
    productListModelUse = FoodModel.toList(list1: productDetailsList);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.white,
          child: AppBar(
            backgroundColor: Colors.white,
            shadowColor: Colors.black,
            elevation: 0.5,
            bottom: TabBar(
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: colorZomatoAll, width: 5.0),
                  insets: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 55.0),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              unselectedLabelColor: colorZomatoAll,
              unselectedLabelStyle: textStyle.copyWith(
                fontSize: 20.0,
                color: colorZomatoAll,
              ),
              onTap: (value) {
                setState(() {
                  boolColorTabBar = !boolColorTabBar;
                });
              },
              indicatorColor: Colors.red,
              automaticIndicatorColorAdjustment: true,
              tabs: [
                Container(
                  height: 58,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (boolColorTabBar == true)
                          ? Icon(
                              Icons.delivery_dining,
                              size: 30,
                              color: colorZomatoAll,
                            )
                          : const Icon(
                              Icons.delivery_dining_outlined,
                              size: 30,
                              color: Colors.black,
                            ),
                      Text(
                        ' Delivery',
                        style: TextStyle(
                            fontFamily: fontLight,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                            fontSize: 18,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 58,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (boolColorTabBar == true)
                          ? const Icon(
                              Icons.room_service_outlined,
                              size: 30,
                              color: Colors.black,
                            )
                          : Icon(
                              Icons.room_service,
                              size: 30,
                              color: colorZomatoAll,
                            ),
                      Text(
                        ' Dining ',
                        style: TextStyle(
                            fontFamily: fontLight,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SizedBox(
              height: height,
              width: width,
              child: SingleChildScrollView(
                child: SpacedColumn(
                  space: 10.0,
                  children: [
                    //  TODO CODE BY OMG CREATION  APP BAR <-------------------------
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.only(left: 15,right: 15, top: 50),
                      // color: Colors.blue,
                      child: Column(
                        children: [
                          Row(
                             children: [
                               Icon(
                                 Icons.location_on,
                                 color: colorZomatoAll,
                                 size: 40,
                               ),
                               const SizedBox(width: 5,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Row(
                                     children: [
                                       Text(
                                         'Parvat Patiya',
                                         style: TextStyle(
                                             fontSize: 19,
                                             color: Colors.black,
                                             fontFamily: fontBold,
                                             fontWeight: FontWeight.bold,
                                             height: 1),
                                       ),
                                       const Icon(
                                         Icons.keyboard_arrow_down,
                                         color: Colors.black,
                                         size: 25,
                                       ),
                                     ],
                                   ),
                                   const Text(
                                     'Surat',
                                     style: TextStyle(
                                       fontSize: 15,
                                       color: Colors.black87,
                                     ),
                                   ),
                                 ],
                               ),
                               const Spacer(),
                               Row(
                                 mainAxisAlignment:
                                 MainAxisAlignment.spaceAround,
                                 children: [
                                   Container(
                                     height: 35,
                                     width: 35,
                                     decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.circular(10),
                                         boxShadow: const [
                                           BoxShadow(
                                               color: Colors.black,
                                               blurRadius: 15,
                                               offset: Offset(0, 0),
                                               spreadRadius: -10,
                                               blurStyle: BlurStyle.solid)
                                         ]),
                                     child: const Icon(
                                       Icons.translate,
                                       size: 18,
                                       color: Colors.black,
                                     ),
                                   ),
                                   const SizedBox(width: 10,),
                                   
                                   GestureDetector(
                                     onTap: () {
                                       Navigator.of(context).push(
                                           MaterialPageRoute(
                                             builder: (BuildContext context) => const Extra(),
                                           ));
                                     },
                                     child: (user!.photoURL!=null)?Container(
                                       decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(50),
                                           boxShadow: const [
                                             BoxShadow(
                                                 color: Colors.black,
                                                 blurRadius: 15,
                                                 offset: Offset(0, 0),
                                                 spreadRadius: -9,
                                                 blurStyle: BlurStyle.solid)
                                           ]),
                                       child: const CircleAvatar(
                                         radius: 20,
                                         backgroundImage: NetworkImage(user!.photoURL!),
                                       ),
                                     ):Container(
                                       decoration: BoxDecoration(
                                         color: Colors.blue.shade50,
                                         shape: BoxShape.circle,
                                       ),
                                       height: 40,
                                       width: 40,
                                       alignment: Alignment.center,
                                       child: const Text(
                                         'P',
                                         style: TextStyle(
                                             color: Colors.blue, fontSize: 20),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),

                             ],
                          ),

                        ],
                      ),
                    ),
                    //  TODO CODE BY OMG CREATION SEARCH BAR  <-------------------------
                    Container(
                      // color: Colors.blue,
                      height: 67,
                      margin: const EdgeInsets.only(left: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 2,),
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 18,
                                      offset: Offset(0, 0),
                                      spreadRadius: -15,
                                      blurStyle: BlurStyle.solid),
                                ],
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(12)),
                            height: 45,
                            width: 340,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.search,
                                  color: colorZomatoAll,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Search',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: fontLight,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: const VerticalDivider(
                                    color: Colors.black45,
                                    width: 1,
                                    thickness: 1,
                                  ),
                                ),
                                Icon(
                                  Icons.mic_none,
                                  color: colorZomatoAll,
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                const Column(
                                  children: [],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            // color: Colors.redAccent,
                            child: Column(
                              children: [
                                Text(
                                  'VEG',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: fontBold,
                                      fontSize: 16),
                                ),
                                Text(
                                  'Mode',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: fontBold,
                                      fontSize: 10,
                                      height: 0.1),
                                ),
                                Transform.scale(
                                  scale: 0.7,
                                  child: Switch.adaptive(
                                    value: valueBool,
                                    onChanged: (value) {
                                      setState(() {
                                        valueBool = !valueBool;
                                      });
                                    },
                                    activeColor: colorZomatoAll,
                                    materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    trackOutlineWidth:
                                    WidgetStateProperty.all(13),
                                    trackOutlineColor:
                                    WidgetStateProperty.all(Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //  TODO CODE BY OMG CREATION ADS BANNER <-------------------------
                    Container(
                      margin: const EdgeInsets.only(left: 15,right: 15,),
                       width: double.infinity,
                       height: 140,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                        image: const DecorationImage(image: NetworkImage('https://play-lh.googleusercontent.com/zXFfe-S5ORjMmioY34PiRUkduJPG3MTPFUbmFq6j2WyG86IADRUxmzHN5Hdh2KxTKSw=h500'),fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)
                          
                      ),
                     ),
                    //  TODO CODE BY OMG CREATION DIVIDER <-------------------------
                    Row(
                      children: [
                        const SizedBox(width: 15,),
                        const Expanded(child: Divider(color: Colors.black26,
                          thickness: 0.4,)),
                        Text(
                          '  EXPLORE  ',
                          style:
                          TextStyle(color: Colors.black45,
                              fontFamily: fontLight,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                              wordSpacing: 2),
                        ),
                        const Expanded(child: Divider(color: Colors.black26,
                          thickness: 0.4,)),
                        const SizedBox(width: 15,),
                      ],
                    ),
                    //  TODO CODE BY OMG CREATION 3 CONTAINERS <-------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          exploreList!.foodListDetails.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: GestureDetector(
                              //todo sat data index type Navigator
                              onTap: () {
                                setState(() {
                                  // print(index);
                                });
                              },
                              child: Container(
                                width: 110,
                                height: 125,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 3,
                                      offset: Offset(0, 0),
                                      spreadRadius: -3.3,
                                      blurStyle: BlurStyle.outer,
                                    ),
                                  ],
                                ),
                                // alignment: Alignment.topCenter,
                                child: Column(
                                  children: [
                                    Container(
                                      height: (index == 0) ? 80 : 80,
                                      width: (index == 1) ? 100 : 125,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(exploreList!
                                              .foodListDetails[index].image!),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      exploreList!
                                          .foodListDetails[index].name!,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: fontBold,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      exploreList!
                                          .foodListDetails[index].deal!,
                                      style: TextStyle(
                                          color: (index == 0)
                                              ? Colors.blue.shade800
                                              : Colors.black,
                                          fontFamily: fontLight,
                                          fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //  TODO CODE BY OMG CREATION DIVIDER <-------------------------
                    Row(
                      children: [
                        const SizedBox(width: 15,),
                        const Expanded(child: Divider(color: Colors.black26,
                          thickness: 0.4,)),
                        Text(
                          '  WHAT\'S ON YOUR MIND?  ',
                          style:
                          TextStyle(color: Colors.black45,
                              fontFamily: fontLight,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                              wordSpacing: 2),
                        ),
                        const Expanded(child: Divider(color: Colors.black26,
                          thickness: 0.4,)),
                        const SizedBox(width: 15,),
                      ],
                    ),
                    // todo image category
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 45,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurStyle: BlurStyle.solid,
                                offset: Offset(0, 0),
                                blurRadius: 20),
                          ],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          //todo all and near fast
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildPaddingButton(
                                width: width,
                                textFind: 'ALL',
                                widthFind: width / 4,
                                boolValueFind: true,
                                valueBoolSatStateData: false,
                                nowBoolFind: false,
                                satStateDataSend: () {
                                  setState(() {
                                    fastFindBool = false;
                                    tabCreateBool = false;
                                  });
                                }),
                            buildPaddingButton(
                                width: width,
                                textFind: ' NEAR & FAST',
                                widthFind: width / 1.57,
                                boolValueFind: false,
                                valueBoolSatStateData: true,
                                nowBoolFind: true,
                                satStateDataSend: () {
                                  setState(() {
                                    fastFindBool = true;
                                    tabCreateBool = true;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    (tabCreateBool == false)
                        ? Container(
                      child: Column(
                        children: [
                          ...List.generate(//todo box color changing and trying
                              productListModelUse!.foodListDetails.length,
                                  (indexs) {
                                indexTime = randomDurationAreaIndex
                                    .nextInt(timeStore.length);
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: width/1.08,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 2),
                                            blurRadius: 10,
                                            spreadRadius: 0,
                                            blurStyle: BlurStyle.normal),
                                      ],
                                    ),
                                    child: GestureDetector(
                                      onTap:() {
                                        setState(() {
                                          selectIndexDisplay=indexs;
                                        });
                                        Navigator.of(context).pushNamed('/view');
                                      },
                                      child: Column(
                                        children: [
                                          CarouselSlider.builder(
                                              itemCount: totalBillMap[indexs.toString()].length,options: CarouselOptions(autoPlay: true,viewportFraction: 1,enlargeCenterPage: false,enableInfiniteScroll: true,enlargeStrategy: CenterPageEnlargeStrategy.zoom,enlargeFactor: 300,),//todo
                                              itemBuilder: (context, index, realIndex) {
                                                indexTime =
                                                    randomDurationAreaIndex
                                                        .nextInt(
                                                        timeStore.length);
                                                {
                                                  return Container(
                                                    height: 235,
                                                    width:
                                                    width / 1.08,
                                                    decoration:
                                                    BoxDecoration(
                                                      color:
                                                      Colors.white,
                                                      borderRadius:
                                                      const BorderRadius
                                                          .only(
                                                        topLeft: Radius
                                                            .circular(
                                                            20),
                                                        topRight: Radius
                                                            .circular(
                                                            20),
                                                      ),
                                                      image:
                                                      DecorationImage(
                                                        image: AssetImage(totalBillMap[indexs.toString()][index]['image']),
                                                        fit: BoxFit
                                                            .cover,
                                                      ),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        PositionedDirectional(
                                                          bottom: 0,
                                                          child:
                                                          Container(
                                                            height: 20,
                                                            width: 140,
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                        10)),
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .black,
                                                                      offset: Offset(
                                                                          0,
                                                                          -40),
                                                                      blurRadius: 60,
                                                                      spreadRadius: 0,
                                                                      blurStyle: BlurStyle
                                                                          .normal),
                                                                ]),
                                                            child:
                                                            SizedBox(
                                                              child:
                                                              timerMetter(
                                                                  fontFind: fontBold),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                              }
                                          ),
                                          Container(
                                            //todo product text
                                            height: 70,
                                            width: width / 1.01,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              // border: Border.fromBorderSide(BorderSide(color: Colors.black,width: 0.1)),
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                  Radius.circular(20),
                                                  bottomLeft:
                                                  Radius.circular(20)),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.white70,
                                                    offset: Offset(0, -1),
                                                    blurRadius: 20,
                                                    spreadRadius: 0,
                                                    blurStyle: BlurStyle.solid),
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(9.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        productListModelUse!
                                                            .foodListDetails[
                                                        indexs]
                                                            .restaurantName!,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                            fontBold,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                      ratingMetter(indexs)
                                                    ],
                                                  ),
                                                  // SizedBox(height: ,),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '${productListModelUseJoin!.foodListDetails[indexTime].type!} • ${productListModelUse!.foodListDetails[indexs].state!} • ₹ 200 for one',
                                                        style: TextStyle(
                                                            color:
                                                            Colors.black54,
                                                            fontFamily:
                                                            fontLight,
                                                            fontSize: 13),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    )
                        : Container(
                      child: Column(
                        children: [
                          ...List.generate(
                              productListModelUse!.foodListDetails.length,
                                  (indexs) {
                                indexTime = randomDurationAreaIndex
                                    .nextInt(timeStore.length);
                                indexTime2 = randomTimeStoreIndex
                                    .nextInt(durationArea.length);
                                //
                                if (indexs == 0) {
                                  indexs = 3;
                                } else if (indexs == 3) {
                                  indexs = 0;
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 2),
                                            blurRadius: 10,
                                            spreadRadius: 0,
                                            blurStyle: BlurStyle.normal),
                                      ],
                                    ),
                                    child: GestureDetector(
                                      onTap:() {
                                        setState(() {
                                          selectIndexDisplay=indexs;
                                        });
                                        Navigator.of(context).pushNamed('/view');
                                      },
                                      child: Column(
                                        children: [
                                          CarouselSlider.builder(
                                            itemCount: totalBillMap[indexs.toString()].length,options: CarouselOptions(autoPlay: true,viewportFraction: 1,enlargeCenterPage: false,enableInfiniteScroll: true,enlargeStrategy: CenterPageEnlargeStrategy.zoom,enlargeFactor: 300,),//todo
                                            itemBuilder: (context, index, realIndex) {
                                              indexTime = randomDurationAreaIndex
                                                  .nextInt(timeStore.length);
                                              return Container(
                                                height: 235,
                                                width: width,
                                                decoration:
                                                BoxDecoration(
                                                  color:
                                                  Colors.white,
                                                  borderRadius:
                                                  const BorderRadius
                                                      .only(
                                                    topLeft: Radius
                                                        .circular(
                                                        20),
                                                    topRight: Radius
                                                        .circular(
                                                        20),
                                                  ),
                                                  image:
                                                  DecorationImage(
                                                    image: AssetImage(totalBillMap[indexs.toString()][index]['image']),
                                                    fit: BoxFit
                                                        .cover,
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    PositionedDirectional(
                                                      bottom: 0,
                                                      child:
                                                      Container(
                                                        height: 20,
                                                        width: 140,
                                                        decoration: const BoxDecoration(
                                                            borderRadius: BorderRadius.only(
                                                                topRight: Radius.circular(
                                                                    10)),
                                                            color: Colors
                                                                .white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors.black12,
                                                                  offset: Offset(0, -40),
                                                                  blurRadius: 60,
                                                                  spreadRadius: 0,
                                                                  blurStyle: BlurStyle.normal),
                                                            ]),
                                                        child:
                                                        SizedBox(
                                                          child:
                                                          timerMetter(fontFind: fontBold),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                          Container(
                                            //todo product text
                                            height: 70,
                                            width: width / 1.01,
                                            decoration: const BoxDecoration(
                                              color: Colors.white70,
                                              // border: Border.fromBorderSide(BorderSide(color: Colors.black,width: 0.1)),
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                  Radius.circular(20),
                                                  bottomLeft:
                                                  Radius.circular(20)),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.white,
                                                    offset: Offset(0, -1),
                                                    blurRadius: 20,
                                                    spreadRadius: 0,
                                                    blurStyle: BlurStyle.solid),
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(9.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        productListModelUse!
                                                            .foodListDetails[
                                                        indexs]
                                                            .restaurantName!,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                            fontBold,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                      ratingMetter(indexs)
                                                    ],
                                                  ),
                                                  // SizedBox(height: ,),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '${productListModelUseJoin!.foodListDetails[indexTime].type!} • ${productListModelUse!.foodListDetails[indexs].state!} • ₹ 200 for one',
                                                        style: TextStyle(
                                                            color:
                                                            Colors.black54,
                                                            fontFamily:
                                                            fontLight,
                                                            fontSize: 13),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),//todo near & fast code write
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height,
              width: width,
              child: SingleChildScrollView(
                child: SpacedColumn(
                  space: 10.0,
                  children: [
                    //  TODO CODE BY OMG CREATION  APP BAR <-------------------------
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.only(left: 15,right: 15, top: 50),
                      // color: Colors.blue,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: colorZomatoAll,
                                size: 40,
                              ),
                              const SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Parvat Patiya',
                                        style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.black,
                                            fontFamily: fontBold,
                                            fontWeight: FontWeight.bold,
                                            height: 1),
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    'Surat',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 15,
                                              offset: Offset(0, 0),
                                              spreadRadius: -10,
                                              blurStyle: BlurStyle.solid)
                                        ]),
                                    child: const Icon(
                                      Icons.translate,
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) => const Extra(),
                                          ));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(50),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 15,
                                                offset: Offset(0, 0),
                                                spreadRadius: -9,
                                                blurStyle: BlurStyle.solid)
                                          ]),
                                      child: const CircleAvatar(
                                        radius: 20,
                                        // backgroundImage: NetworkImage(user!.photoURL!),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                    //  TODO CODE BY OMG CREATION SEARCH BAR  <-------------------------
                    Container(
                      // color: Colors.blue,
                      height: 67,
                      margin: const EdgeInsets.only(left: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 2,),
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 18,
                                      offset: Offset(0, 0),
                                      spreadRadius: -15,
                                      blurStyle: BlurStyle.solid),
                                ],
                                color: Colors.white,
                                border: Border.all(color: Colors.grey.shade200),
                                borderRadius: BorderRadius.circular(12)),
                            height: 45,
                            width: 340,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.search,
                                  color: colorZomatoAll,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Search',
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: fontLight,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Spacer(),
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: const VerticalDivider(
                                    color: Colors.black45,
                                    width: 1,
                                    thickness: 1,
                                  ),
                                ),
                                Icon(
                                  Icons.mic_none,
                                  color: colorZomatoAll,
                                ),
                                const SizedBox(
                                  width: 11,
                                ),
                                const Column(
                                  children: [],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 3),
                            // color: Colors.redAccent,
                            child: Column(
                              children: [
                                Text(
                                  'VEG',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: fontBold,
                                      fontSize: 16),
                                ),
                                Text(
                                  'Mode',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: fontBold,
                                      fontSize: 10,
                                      height: 0.1),
                                ),
                                Transform.scale(
                                  scale: 0.7,
                                  child: Switch.adaptive(
                                    value: valueBool,
                                    onChanged: (value) {
                                      setState(() {
                                        valueBool = !valueBool;
                                      });
                                    },
                                    activeColor: colorZomatoAll,
                                    materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    trackOutlineWidth:
                                    WidgetStateProperty.all(13),
                                    trackOutlineColor:
                                    WidgetStateProperty.all(Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //  TODO CODE BY OMG CREATION DIVIDER <-------------------------
                    Row(
                      children: [
                        const SizedBox(width: 15,),
                        const Expanded(child: Divider(color: Colors.black26,
                          thickness: 0.4,)),
                        Text(
                          '  RESTAURANTS  ',
                          style:
                          TextStyle(color: Colors.black45,
                              fontFamily: fontLight,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                              wordSpacing: 2),
                        ),
                        const Expanded(child: Divider(color: Colors.black26,
                          thickness: 0.4,)),
                        const SizedBox(width: 15,),
                      ],
                    ),
                    //  TODO CODE BY OMG CREATION 3 CONTAINERS <-------------------------
                    Container(
                      height: 500,
                      width: width,
                      child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1),itemCount: imageOnlyRestaurant.length,
                        itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(imageOnlyRestaurant[index]['cafeImage']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: width,
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 20,
                                    blurStyle: BlurStyle.inner,
                                    offset: Offset(0,0),
                                    spreadRadius: 0.5,
                                  ),
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 20,
                                    blurStyle: BlurStyle.outer,
                                    offset: Offset(0,0),
                                    spreadRadius: 0.5,
                                  ),
                                ],
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
                              ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(imageOnlyRestaurant[index]['name'],textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: fontLight),),
                                )),
                          ),
                        );
                      },),
                    )
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     ...List.generate(
                    //       exploreList!.foodListDetails.length,
                    //           (index) => Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    //         child: GestureDetector(
                    //           //todo sat data index type Navigator
                    //           onTap: () {
                    //             setState(() {
                    //               // print(index);
                    //             });
                    //           },
                    //           child: Container(
                    //             width: 110,
                    //             height: 125,
                    //             decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius: BorderRadius.circular(15),
                    //               boxShadow: const [
                    //                 BoxShadow(
                    //                   color: Colors.black26,
                    //                   blurRadius: 3,
                    //                   offset: Offset(0, 0),
                    //                   spreadRadius: -3.3,
                    //                   blurStyle: BlurStyle.outer,
                    //                 ),
                    //               ],
                    //             ),
                    //             // alignment: Alignment.topCenter,
                    //             child: Column(
                    //               children: [
                    //                 Container(
                    //                   height: (index == 0) ? 80 : 80,
                    //                   width: (index == 1) ? 100 : 125,
                    //                   decoration: BoxDecoration(
                    //                     image: DecorationImage(
                    //                       image: AssetImage(exploreList!
                    //                           .foodListDetails[index].image!),
                    //                       fit: BoxFit.fitWidth,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Text(
                    //                   exploreList!
                    //                       .foodListDetails[index].name!,
                    //                   style: TextStyle(
                    //                       color: Colors.black,
                    //                       fontFamily: fontBold,
                    //                       fontSize: 16),
                    //                 ),
                    //                 Text(
                    //                   exploreList!
                    //                       .foodListDetails[index].deal!,
                    //                   style: TextStyle(
                    //                       color: (index == 0)
                    //                           ? Colors.blue.shade800
                    //                           : Colors.black,
                    //                       fontFamily: fontLight,
                    //                       fontSize: 13),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    //  TODO CODE BY OMG CREATION DIVIDER <-------------------------
                    ,Row(
                      children: [
                        const SizedBox(width: 15,),
                        const Expanded(child: Divider(color: Colors.black26,
                          thickness: 0.4,)),
                        Text(
                          '  WHAT\'S ON YOUR MIND?  ',
                          style:
                          TextStyle(color: Colors.black45,
                              fontFamily: fontLight,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                              wordSpacing: 2),
                        ),
                        const Expanded(child: Divider(color: Colors.black26,
                          thickness: 0.4,)),
                        const SizedBox(width: 15,),
                      ],
                    ),
                    // todo image category
                    Container(
                      child: Column(
                        children: [
                          ...List.generate(
                              productListModelUse!.foodListDetails.length,
                                  (indexs) {
                                if(indexs==0)
                                  {
                                    indexs=6;
                                  }
                                else if(indexs==6)
                                  {
                                    indexs=0;
                                  }
                                indexTime = randomDurationAreaIndex
                                    .nextInt(timeStore.length);
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 2),
                                            blurRadius: 10,
                                            spreadRadius: 0,
                                            blurStyle: BlurStyle.normal),
                                      ],
                                    ),
                                    child: GestureDetector(
                                      onTap:() {
                                        setState(() {
                                          selectIndexDisplay=indexs;
                                        });
                                        Navigator.of(context).pushNamed('/view');

                                      },
                                      child: Column(
                                        children: [
                                          CarouselSlider.builder(
                                          itemCount: totalBillMap[indexs.toString()].length,options: CarouselOptions(autoPlay: true,viewportFraction: 1,enlargeCenterPage: false,enableInfiniteScroll: true,enlargeStrategy: CenterPageEnlargeStrategy.zoom,enlargeFactor: 300,autoPlayAnimationDuration: const Duration(seconds: 5)),//todo
                                            itemBuilder: (context, index, realIndex) {
                                              indexTime =
                                                  randomDurationAreaIndex
                                                      .nextInt(
                                                      timeStore.length);
                                              {
                                                return Container(
                                                  height: 235,
                                                  width:
                                                  width / 1.035,
                                                  decoration:
                                                  BoxDecoration(
                                                    color:
                                                    Colors.white,
                                                    borderRadius:
                                                    const BorderRadius
                                                        .only(
                                                      topLeft: Radius
                                                          .circular(
                                                          20),
                                                      topRight: Radius
                                                          .circular(
                                                          20),
                                                    ),
                                                    image:
                                                    DecorationImage(
                                                      image: (index==0)?AssetImage(productDetailsList[indexs]['cafeImage']):AssetImage(totalBillMap[indexs.toString()][index]['image']),
                                                      fit: BoxFit
                                                          .cover,
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      PositionedDirectional(
                                                        bottom: 0,
                                                        child:
                                                        Container(
                                                          height: 20,
                                                          width: 140,
                                                          decoration: const BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .only(
                                                                  topRight: Radius
                                                                      .circular(
                                                                      10)),
                                                              color: Colors
                                                                  .white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                    color: Colors
                                                                        .black,
                                                                    offset: Offset(
                                                                        0, -40),
                                                                    blurRadius: 60,
                                                                    spreadRadius: 0,
                                                                    blurStyle: BlurStyle
                                                                        .normal),
                                                              ]),
                                                          child:
                                                          SizedBox(
                                                            child:
                                                            timerMetter(
                                                                fontFind: fontBold),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }
                                            }
                                            ),
                                          Container(
                                            //todo product text
                                            height: 70,
                                            width: width / 1.01,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              // border: Border.fromBorderSide(BorderSide(color: Colors.black,width: 0.1)),
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                  Radius.circular(20),
                                                  bottomLeft:
                                                  Radius.circular(20)),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.white70,
                                                    offset: Offset(0, -1),
                                                    blurRadius: 20,
                                                    spreadRadius: 0,
                                                    blurStyle: BlurStyle.solid),
                                              ],
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(9.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        productListModelUse!
                                                            .foodListDetails[
                                                        indexs]
                                                            .restaurantName!,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                            fontBold,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                      ratingMetter(indexs)
                                                    ],
                                                  ),
                                                  // SizedBox(height: ,),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '${productListModelUseJoin!.foodListDetails[indexTime].type!} • ${productListModelUse!.foodListDetails[indexs].state!} • ₹ 200 for one',
                                                        style: TextStyle(
                                                            color:
                                                            Colors.black54,
                                                            fontFamily:
                                                            fontLight,
                                                            fontSize: 13),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),//todo near & fast code write
                  ],
                ),
              ),
            ),//todo delivery tab
          ],
        ),
      ),
    );
  }

  // Padding buildPaddingButton({required double width,required String textFind,required double widthFind,required bool boolValueFind,required bool valueBoolSatStateData}) {
  //   return ;
  // }
}

