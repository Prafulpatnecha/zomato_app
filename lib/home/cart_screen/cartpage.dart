import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/globle_product_list.dart';
import '../../utils/globle_values.dart';
import '../../utils/randome_list.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/home');
          },
          icon: Icon(Icons.navigate_before),
        ),
        title: const Text('Cart Bill Pay'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              emtyeProductList.length,
              (index) => Container(
                // height: 20,
                // width: 20,
                // color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 21,
                                    width: 21,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Colors.green, width: 2.5),
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
                                    decoration: BoxDecoration(
                                        color: Colors.orange.shade700,
                                        borderRadius: BorderRadius.circular(5)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Bestseller',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: fontLight,
                                          fontSize: 8),
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
                                      emtyeProductList[index]['productName'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: fontLight,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          height: 1),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${emtyeProductList[index]['rating'].toString()} ratings',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: fontLight,
                                          fontSize: 11,
                                          height: 1),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '₹${emtyeProductList[index]['productPrice']!}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: fontLight,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          height: 1),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'OFFER Cuppens Available',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: fontLight,
                                          fontSize: 11,
                                          height: 1),
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
                                          image: AssetImage(
                                              emtyeProductList[index]['image']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    PositionedDirectional(
                                      bottom: 0,
                                      start: 0,
                                      end: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: (emtyeProductList[index]
                                                    ['quantity'] ==
                                                0)
                                            ? GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    emtyeProductList[index]
                                                            ['quantity'] =
                                                        emtyeProductList[index]
                                                                ['quantity'] +
                                                            1;
                                                    emtyeProductList[index]
                                                        ['addProduct'] = true;
                                                    emtyeProductList[index]
                                                            ['addCart'] =
                                                        emtyeProductList[
                                                                index]['productPrice'];
                                                    emtyeProductList.add(
                                                        emtyeProductList[
                                                            index]);
                                                    total=0;
                                                    for(int i=0;i<emtyeProductList.length;i++)
                                                    {
                                                      int point=emtyeProductList[i]['productPrice']*emtyeProductList[i]['quantity'];
                                                      total+=point;
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
                                                    color: Colors.pink.shade50,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.pink),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Column(
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            const Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Icon(
                                                                  Icons.add,
                                                                  size: 15,
                                                                  color: Colors
                                                                      .pink,
                                                                ),
                                                              ],
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Column(
                                                                children: [
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Container(
                                                                    child: Text(
                                                                      'ADD',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .pink,
                                                                          fontSize:
                                                                              20,
                                                                          fontFamily:
                                                                              fontBold),
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
                                                  color: Colors.pink,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  // border: Border.all(
                                                  //     color: Colors.pink
                                                  // ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(3.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                emtyeProductList[
                                                                        index][
                                                                    'quantity'] = emtyeProductList[
                                                                            index]
                                                                        [
                                                                        'quantity'] +
                                                                    1;
                                                                emtyeProductList[
                                                                        index][
                                                                    'addProduct'] = true;
                                                                emtyeProductList[
                                                                        index][
                                                                    'addCart'] = emtyeProductList[
                                                                            index]
                                                                        [
                                                                        'addCart'] +
                                                                    productDetailsListJoin[
                                                                            index]
                                                                        [
                                                                        'productPrice'];
                                                                total=0;
                                                                for(int i=0;i<emtyeProductList.length;i++)
                                                                {
                                                                  int point=emtyeProductList[i]['productPrice']*emtyeProductList[i]['quantity'];
                                                                  total+=point;
                                                                }
                                                                // productListModelUseJoin!.foodListDetails[index].quantity=productListModelUseJoin!.foodListDetails[index].quantity!.toInt()+1;
                                                                // productListModelUseJoin!.foodListDetails[index].addProduct=true;
                                                                // productListModelUseJoin!.foodListDetails[index].addCart=(productListModelUseJoin!.foodListDetails[index].addCart!+productListModelUseJoin!.foodListDetails[index].productPrice!.toInt());
                                                              });
                                                            },
                                                            child: Container(
                                                                child:
                                                                    const Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              emtyeProductList[
                                                                          index]
                                                                      [
                                                                      'quantity']
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                if (emtyeProductList[
                                                                            index]
                                                                        [
                                                                        'quantity'] !=
                                                                    1) {
                                                                  emtyeProductList[
                                                                          index]
                                                                      [
                                                                      'addCart'] = emtyeProductList[
                                                                              index]
                                                                          [
                                                                          'addCart'] -
                                                                      emtyeProductList[
                                                                              index]
                                                                          [
                                                                          'productPrice'];
                                                                  emtyeProductList[
                                                                          index]
                                                                      [
                                                                      'quantity'] = emtyeProductList[
                                                                              index]
                                                                          [
                                                                          'quantity'] -
                                                                      1;
                                                                  // print(productListModelUseJoin!.foodListDetails[index].addCart);
                                                                }
                                                                total=0;
                                                                for(int i=0;i<emtyeProductList.length;i++)
                                                                {
                                                                  int point=emtyeProductList[i]['productPrice']*emtyeProductList[i]['quantity'];
                                                                  total+=point;
                                                                }
                                                                // if(emtyeProductList[index]['quantity']==0)
                                                                // {
                                                                //   emtyeProductList[index]['addProduct']=false;
                                                                //   for(int i=0;i<emtyeProductList.length;i++)
                                                                //   {
                                                                //     if(emtyeProductList[i]['addProduct']==false)
                                                                //     {
                                                                //       emtyeProductList.removeAt(i);
                                                                //       print(emtyeProductList[i]['addProduct']);
                                                                //     }
                                                                //   }
                                                                // }
                                                              });
                                                            },
                                                            child: Container(
                                                              child: const Icon(
                                                                Icons.remove,
                                                                color: Colors
                                                                    .white,
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
                                style: TextStyle(
                                    fontFamily: fontBold,
                                    fontSize: 11,
                                    color: Colors.black26),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        // width: 100,
                        height: 10,
                        child: DottedLine(
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.center,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 2.0,
                          dashColor: Colors.black38,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 150,
        color: colorZomatoAll,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/order');
          },
          child: Container(
            height: 150,
            width: double.infinity,
            color: colorZomatoAll,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Amount : ',style: TextStyle(color: Colors.white,fontFamily: fontBold,fontSize: 18),),
                      Text(total.toString(),style: TextStyle(color: Colors.white,fontFamily: fontBold),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('GST 5 Per% :',style: TextStyle(color: Colors.white,fontFamily: fontBold,fontSize: 18),),
                      Text((total/100*5).toString(),style: TextStyle(color: Colors.white,fontFamily: fontBold),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Charge :',style: TextStyle(color: Colors.white,fontFamily: fontBold,fontSize: 18),),
                      Text((total<846)?'10':'Free Delivery',style: TextStyle(color: Colors.white,fontFamily: fontBold),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Bill :',style: TextStyle(color: Colors.white,fontFamily: fontBold,fontSize: 18),),
                      Text((total<846)?(total-(total/100*5)+10).toString():(total-(total/100*5)).toString()+'/-10',style: TextStyle(color: Colors.white,fontFamily: fontBold),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Tap To Payment Screen Now Bill Pay',style: TextStyle(color: Colors.white,fontFamily: fontBold,fontSize: 18,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
var total=0;
var gst=0;
String iconR='₹';
// Scaffold(
// appBar: AppBar(
// leading: IconButton(
// onPressed: () {
// Navigator.of(context).popAndPushNamed('/home');
// },
// icon: Icon(Icons.navigate_before),
// ),
// title: const Text('Cart Bill Pay'),
// ),
// body: (emtyeProductList.isNotEmpty)?Column(
// children: [
// ...List.generate(emtyeProductList.length,  (index) {
// return Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// color: Colors.white,
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// children: [
// Row(
// children: [
// Container(
// height: 21,
// width: 21,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(8),
// border: Border.all(color: Colors.green,width: 2.5),
// color: Colors.white,
// ),
// alignment: Alignment.center,
// child: Container(
// height: 8,
// width: 8,
// decoration: const BoxDecoration(
// color: Colors.green,
// shape: BoxShape.circle,
// ),
// ),
// ),
// SizedBox(width: 10,),
// Text(emtyeProductList[index]['productName'],style: TextStyle(color: Colors.black,fontFamily: fontLight,fontWeight: FontWeight.bold,fontSize: 15,height: 1)),
// Spacer(),
// Container(// todo add product
// height: 33,
// width: 80,
// decoration: BoxDecoration(
// color: Colors.pink,
// borderRadius: BorderRadius.circular(10),
// // border: Border.all(
// //     color: Colors.pink
// // ),
// ),
// child: Padding(
// padding: const EdgeInsets.all(3.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// InkWell(
// onTap: () {
// setState(() {
// emtyeProductList[index]['quantity']=emtyeProductList[index]['quantity']+1;
// emtyeProductList[index]['addProduct']=true;
// emtyeProductList[index]['addCart']=emtyeProductList[index]['addCart']+emtyeProductList[index]['productPrice'];
// // productListModelUseJoin!.foodListDetails[index].quantity=productListModelUseJoin!.foodListDetails[index].quantity!.toInt()+1;
// // productListModelUseJoin!.foodListDetails[index].addProduct=true;
// // productListModelUseJoin!.foodListDetails[index].addCart=(productListModelUseJoin!.foodListDetails[index].addCart!+productListModelUseJoin!.foodListDetails[index].productPrice!.toInt());
// });
// },
// child: Container(
// child: const Icon(Icons.add,color: Colors.white,)
// ),
// ),
// Container(
// child: Text(emtyeProductList[index]['quantity'].toString(),style: const TextStyle(color: Colors.white,fontSize: 18,),),
// ),
// InkWell(
// onTap: () {
// setState(() {
//
// if(emtyeProductList[index]['quantity']!=1)
// {
// emtyeProductList[index]['addCart']=emtyeProductList[index]['addCart']-emtyeProductList[index]['productPrice'];
// emtyeProductList[index]['quantity']=emtyeProductList[index]['quantity']-1;
// // print(productListModelUseJoin!.foodListDetails[index].addCart);
// }
// // if(productDetailsListJoin[index]['quantity']==0)
// // {
// //   productDetailsListJoin[index]['addProduct']=false;
// //   for(int i=0;i<=emtyeProductList.length;i++)
// //   {
// //     if(emtyeProductList[i]['addProduct']==false)
// //     {
// //       emtyeProductList.removeAt(i);
// //       print(emtyeProductList[i]['addProduct']);
// //     }
// //   }
// // }
// });
// },
// child: Container(
// child: const Icon(Icons.remove,color: Colors.white,),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// Row(
// children: [
// Padding(
// padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
// child: Text('₹${emtyeProductList[index]['productPrice']}',style: TextStyle(color: Colors.black,fontFamily: fontLight,fontSize: 13,height: 1),),
// ),
// ],
// )
// ],
// ),
// ),
// ),
// );
// },)
// ],
// ):Container(),
//
// bottomNavigationBar: Container(
// height: 70,
// color: colorZomatoAll,
// child: GestureDetector(
// onTap: () {
// Navigator.of(context).pushNamed('/cart');
// },
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text('${emtyeProductList.length} item added ',style: TextStyle(color: Colors.white,fontFamily: fontBold,fontSize: 18),),
// const Icon(Icons.arrow_circle_right_sharp,color: Colors.white,)
// ],
// ),
// Text('Add items worth ₹846 more to get free delivery',style: TextStyle(color: Colors.white,fontFamily: fontLight,fontSize: 12))
// ],
// ),
// ),
// )
// );
