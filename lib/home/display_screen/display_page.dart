import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:zomato/utils/color.dart';
import 'package:zomato/utils/globle_values.dart';

import '../../utils/globle_product_list.dart';
import '../../utils/randome_list.dart';
import '../cart_screen/cartpage.dart';
import '../components/Containers.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.navigate_before,
            size: 30,
          ),
        ),
        actions: const [
          Icon(Icons.search_sharp),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.favorite_border),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.share_outlined),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.more_vert),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: width,
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      productListModelUse!
                          .foodListDetails[selectIndexDisplay].restaurantName!,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: fontBold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '🍃Pure Veg • ${productListModelUseJoin!.foodListDetails[indexTime].type!}',
                      style: TextStyle(
                          color: Colors.black54,
                          fontFamily: fontLight,
                          fontSize: 11),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ratingMetter(selectIndexDisplay),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${productListModelUse!.foodListDetails[selectIndexDisplay].ratingPeople!} ratings',
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: fontBold,
                              fontSize: 11,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.dotted,
                              decorationColor: Colors.black54,
                              decorationThickness: 2),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 20,
                      width: 190,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          timerMetter(fontFind: fontLight),
                          const SizedBox(
                            width: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: VerticalDivider(
                              color: Colors.black,
                              width: 1,
                              thickness: 0.5,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            durationArea[indexTime2],
                            style: TextStyle(
                              fontFamily: fontLight,
                              color: Colors.black54,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      color: Colors.black38,
                      thickness: 0.5,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //todo filter
                    ...List.generate(
                      typeListFill.length,
                      (indexs) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          width: width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      typeListFill[indexs].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: fontBold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (indexType[indexs] != indexs) {
                                              indexType[indexs] = indexs;
                                            } else {
                                              indexType[indexs] =
                                                  typeListFill.length + 10;
                                            }
                                          });
                                        },
                                        icon: Icon((indexs != indexType[indexs])
                                            ? Icons.arrow_drop_down_outlined
                                            : Icons.arrow_drop_up))
                                  ],
                                ),
                                (indexs != indexType[indexs])
                                    ? Column(
                                        children: [
                                          ...List.generate(
                                            productListModelUseJoin!
                                                .foodListDetails.length,
                                            (index) {
                                              indexDescriptions =
                                                  randomDurationAreaIndex
                                                      .nextInt(descriptionsList
                                                          .length);
                                              return (productListModelUseJoin!
                                                          .foodListDetails[
                                                              index]
                                                          .type
                                                          .toString() ==
                                                      typeListFill[indexs]
                                                          .toString())
                                                  ? (productListModelUseJoin!
                                                              .foodListDetails[
                                                                  index]
                                                              .productNo ==
                                                          productListModelUse!
                                                              .foodListDetails[
                                                                  selectIndexDisplay]
                                                              .productNo)
                                                      ? SizedBox(
                                                          child: Container(
                                                            // height: 20,
                                                            // width: 20,
                                                            // color: Colors.blue,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {//todo showModalBottomSheetWorking
                                                                  setState(() {
                                                                    showProductList.clear();
                                                                    showProductList.add(productDetailsListJoin[index]);
                                                                    showModalBottomSheetWorking(context: context,width: width, height: height);
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  color: Colors
                                                                      .white,
                                                                  child: Column(
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                children: [
                                                                                  Container(
                                                                                    height: 21,
                                                                                    width: 21,
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                      border: Border.all(color: Colors.green, width: 2.5),
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                    alignment: Alignment.center,
                                                                                    child: Container(
                                                                                      height: 8,
                                                                                      width: 8,
                                                                                      decoration: const BoxDecoration(
                                                                                        color: Colors.green,
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(
                                                                                    width: 10,
                                                                                  ),
                                                                                  Container(
                                                                                    height: 20,
                                                                                    width: 50,
                                                                                    decoration: BoxDecoration(color: Colors.orange.shade700, borderRadius: BorderRadius.circular(5)),
                                                                                    alignment: Alignment.center,
                                                                                    child: Text(
                                                                                      'Bestseller',
                                                                                      style: TextStyle(color: Colors.white, fontFamily: fontLight, fontSize: 8),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              const SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Container(
                                                                                width: 200,
                                                                                // color: Colors.red,
                                                                                padding: const EdgeInsets.all(5),
                                                                                child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      productListModelUseJoin!.foodListDetails[index].productName!,
                                                                                      style: TextStyle(color: Colors.black, fontFamily: fontLight, fontWeight: FontWeight.bold, fontSize: 15, height: 1),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    Text(
                                                                                      '${productListModelUseJoin!.foodListDetails[index].ratPeople!} ratings',
                                                                                      style: TextStyle(color: Colors.black, fontFamily: fontLight, fontSize: 11, height: 1),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    Text(
                                                                                      '₹${productListModelUseJoin!.foodListDetails[index].productPrice!}',
                                                                                      style: TextStyle(color: Colors.black, fontFamily: fontLight, fontWeight: FontWeight.w500, fontSize: 13, height: 1),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    Text(
                                                                                      'OFFER Cuppens Available',
                                                                                      style: TextStyle(color: Colors.black, fontFamily: fontLight, fontSize: 11, height: 1),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    Text(
                                                                                      descriptionsList[indexDescriptions],
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      maxLines: 4,
                                                                                      style: TextStyle(
                                                                                        color: Colors.black,
                                                                                        fontFamily: fontLight,
                                                                                        fontSize: 11,
                                                                                        height: 1,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Column(
                                                                            children: [
                                                                              SizedBox(
                                                                                // color: Colors.yellowAccent,
                                                                                height: 170,
                                                                                child: Stack(
                                                                                  children: [
                                                                                    Container(
                                                                                      height: 150,
                                                                                      width: 150,
                                                                                      decoration: BoxDecoration(
                                                                                        // color: Colors.red,
                                                                                        borderRadius: BorderRadius.circular(20),
                                                                                        image: DecorationImage(
                                                                                          image: AssetImage(productListModelUseJoin!.foodListDetails[index].image!),
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    PositionedDirectional(
                                                                                      bottom: 0,
                                                                                      start: 0,
                                                                                      end: 0,
                                                                                      child: Padding(
                                                                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                                                                        child: (productDetailsListJoin[index]['quantity'] == 0)
                                                                                            ? GestureDetector(
                                                                                                onTap: () {
                                                                                                  setState(() {
                                                                                                    productDetailsListJoin[index]['quantity'] = productDetailsListJoin[index]['quantity'] + 1;
                                                                                                    productDetailsListJoin[index]['addProduct'] = true;
                                                                                                    productDetailsListJoin[index]['addCart'] = productListModelUseJoin!.foodListDetails[index].productPrice;
                                                                                                    emtyeProductList.add(productDetailsListJoin[index]);
                                                                                                    total = 0;
                                                                                                    for (int i = 0; i < emtyeProductList.length; i++) {
                                                                                                      int point = emtyeProductList[i]['productPrice'] * emtyeProductList[i]['quantity'];
                                                                                                      total += point;
                                                                                                    }
                                                                                                    // print(emtyeProductList[0]['addProduct']);
                                                                                                    // productDetailsListJoin[index]['addProduct']=false;
                                                                                                    // print(emtyeProductList[0]['addProduct']);
                                                                                                  });
                                                                                                },
                                                                                                child: Container(
                                                                                                  height: 45,
                                                                                                  width: 90,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: colorZomatoBluer,
                                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                                    border: Border.all(color: colorZomatoAll),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: const EdgeInsets.all(3.0),
                                                                                                    child: Column(
                                                                                                      children: [
                                                                                                        Stack(
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                              children: [
                                                                                                                Icon(
                                                                                                                  Icons.add,
                                                                                                                  size: 15,
                                                                                                                  color: colorZomatoAll,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Align(
                                                                                                              alignment: Alignment.center,
                                                                                                              child: Column(
                                                                                                                children: [
                                                                                                                  const SizedBox(
                                                                                                                    height: 5,
                                                                                                                  ),
                                                                                                                  Container(
                                                                                                                    child: Text(
                                                                                                                      'ADD',
                                                                                                                      style: TextStyle(color: colorZomatoAll, fontSize: 20, fontFamily: fontBold),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              )
                                                                                            :
                                                                                            //     onTap: () {
                                                                                            // setState(() {
                                                                                            // productListModelUseJoin!.foodListDetails[index].quantity=1+productListModelUseJoin!.foodListDetails[index].quantity!.toInt();
                                                                                            // productListModelUseJoin!.foodListDetails[index].addProduct=true;
                                                                                            // productListModelUseJoin!.foodListDetails[index].addCart=productListModelUseJoin!.foodListDetails[index].productPrice;
                                                                                            // emtyeProductList.add(productDetailsListJoin[index]);
                                                                                            // });
                                                                                            // },
                                                                                            Container(
                                                                                                // todo add product
                                                                                                height: 45,
                                                                                                width: 90,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: colorZomatoAll,
                                                                                                  borderRadius: BorderRadius.circular(10),
                                                                                                  // border: Border.all(
                                                                                                  //     color: Colors.pink
                                                                                                  // ),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.all(3.0),
                                                                                                  child: Column(
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                        children: [
                                                                                                          InkWell(
                                                                                                            onTap: () {
                                                                                                              setState(() {
                                                                                                                productDetailsListJoin[index]['quantity'] = productDetailsListJoin[index]['quantity'] + 1;
                                                                                                                productDetailsListJoin[index]['addProduct'] = true;
                                                                                                                productDetailsListJoin[index]['addCart'] = productDetailsListJoin[index]['addCart'] + productDetailsListJoin[index]['productPrice'];
                                                                                                                total = 0;
                                                                                                                for (int i = 0; i < emtyeProductList.length; i++) {
                                                                                                                  int point = emtyeProductList[i]['productPrice'] * emtyeProductList[i]['quantity'];
                                                                                                                  total += point;
                                                                                                                }
                                                                                                                // productListModelUseJoin!.foodListDetails[index].quantity=productListModelUseJoin!.foodListDetails[index].quantity!.toInt()+1;
                                                                                                                // productListModelUseJoin!.foodListDetails[index].addProduct=true;
                                                                                                                // productListModelUseJoin!.foodListDetails[index].addCart=(productListModelUseJoin!.foodListDetails[index].addCart!+productListModelUseJoin!.foodListDetails[index].productPrice!.toInt());
                                                                                                              });
                                                                                                            },
                                                                                                            child: Container(
                                                                                                                child: const Icon(
                                                                                                              Icons.add,
                                                                                                              color: Colors.white,
                                                                                                            )),
                                                                                                          ),
                                                                                                          Container(
                                                                                                            child: Text(
                                                                                                              productDetailsListJoin[index]['quantity'].toString(),
                                                                                                              style: const TextStyle(
                                                                                                                color: Colors.white,
                                                                                                                fontSize: 18,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          InkWell(
                                                                                                            onTap: () {
                                                                                                              setState(() {
                                                                                                                if (productDetailsListJoin[index]['quantity'] != 0) {
                                                                                                                  productDetailsListJoin[index]['addCart'] = productDetailsListJoin[index]['addCart'] - productDetailsListJoin[index]['productPrice'];
                                                                                                                  productDetailsListJoin[index]['quantity'] = productDetailsListJoin[index]['quantity'] - 1;
                                                                                                                  // print(productListModelUseJoin!.foodListDetails[index].addCart);
                                                                                                                }
                                                                                                                if (productDetailsListJoin[index]['quantity'] == 0) {
                                                                                                                  productDetailsListJoin[index]['addProduct'] = false;
                                                                                                                  for (int i = 0; i < emtyeProductList.length; i++) {
                                                                                                                    if (emtyeProductList[i]['addProduct'] == false) {
                                                                                                                      emtyeProductList.removeAt(i);
                                                                                                                      print(emtyeProductList[i]['addProduct']);
                                                                                                                    }
                                                                                                                  }
                                                                                                                }
                                                                                                                total = 0;
                                                                                                                for (int i = 0; i < emtyeProductList.length; i++) {
                                                                                                                  int point = emtyeProductList[i]['productPrice'] * emtyeProductList[i]['quantity'];
                                                                                                                  total += point;
                                                                                                                }
                                                                                                              });
                                                                                                            },
                                                                                                            child: Container(
                                                                                                              child: const Icon(
                                                                                                                Icons.remove,
                                                                                                                color: Colors.white,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                'customisable',
                                                                                style: TextStyle(fontFamily: fontBold, fontSize: 11, color: Colors.black26),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            20,
                                                                      ),
                                                                      const SizedBox(
                                                                        // width: 100,
                                                                        // height: 100,
                                                                        child:
                                                                            DottedLine(
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          alignment:
                                                                              WrapAlignment.center,
                                                                          lineLength:
                                                                              double.infinity,
                                                                          lineThickness:
                                                                              1.0,
                                                                          dashLength:
                                                                              2.0,
                                                                          dashColor:
                                                                              Colors.black38,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : Container()
                                                  : Container();
                                            },
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomSheet: Container(
      //   height: 500,
      //   // color: Colors.red,
      //   child: Column(
      //     children: [
      //       Container(
      //         color: Colors.white,
      //       )
      //     ],
      //   ),
      // ),
      bottomNavigationBar: (emtyeProductList.isNotEmpty)
          ? Container(
              height: 70,
              color: colorZomatoAll,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/cart');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${emtyeProductList.length} item added ',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: fontBold,
                              fontSize: 18),
                        ),
                        const Icon(
                          Icons.arrow_circle_right_sharp,
                          color: Colors.white,
                        )
                      ],
                    ),
                    Text('Add items worth ₹846 more to get free delivery',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: fontLight,
                            fontSize: 12))
                  ],
                ),
              ),
            )
          : Container(
              height: 0,
            ),
      // resizeToAvoidBottomInset: true,
    );
  }

  Future<dynamic> showModalBottomSheetWorking({required BuildContext context,required double width,required double height}) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                // height: 100,
                decoration: BoxDecoration(
                color: colorZomatoBluer,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 230,
                        decoration: BoxDecoration(
                        color: colorZomatoAll,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(showProductList[0]['image']),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: SizedBox(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 21,
                                  width: 21,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.green, width: 2.5),
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 20,
                                  width: 50,
                                  decoration: BoxDecoration(color: Colors.orange.shade700, borderRadius: BorderRadius.circular(5)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Bestseller',
                                    style: TextStyle(color: Colors.white, fontFamily: fontLight, fontSize: 8),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  showProductList[0]['productName'],
                                  style: TextStyle(color: Colors.black, fontFamily: fontLight, fontWeight: FontWeight.bold, fontSize: 15, height: 1),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${showProductList[0]['rating']} ratings',
                                  style: TextStyle(color: Colors.black, fontFamily: fontLight, fontSize: 11, height: 1),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '₹${showProductList[0]['productPrice']}',
                                  style: TextStyle(color: Colors.black, fontFamily: fontLight, fontWeight: FontWeight.w500, fontSize: 13, height: 1),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'OFFER Cuppens Available',
                                  style: TextStyle(color: Colors.black, fontFamily: fontBold, fontSize: 11, height: 1),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  descriptionsList[indexDescriptions],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: fontLight,
                                    fontSize: 11,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
