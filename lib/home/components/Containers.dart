
import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/globle_values.dart';
import '../../utils/randome_list.dart';
Padding paddingShowLineText({required String textFind}) {
  return Padding(
    padding: const EdgeInsets.all(9.0),
    child: Column(
      children: [
        Container(
          height: 30,
          // color: Colors.blue,
          child: Stack(
            children: [
              const Align(
                child: Divider(
                  color: Colors.black26,
                  thickness: 0.3,
                ),
              ),
              Align(
                child: Container(
                  color: Colors.white,
                  child: Text(
                    textFind,
                    style: TextStyle(
                        color: Colors.black45,
                        fontFamily: fontLight,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                        wordSpacing: 2),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}


Padding buildPaddingButton(
    {required double width,
      required String textFind,
      required double widthFind,
      required bool boolValueFind,
      required bool valueBoolSatStateData,
      required bool nowBoolFind,required GestureTapCallback satStateDataSend}) {
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: (fastFindBool == boolValueFind)
        ? GestureDetector(
      onTap: satStateDataSend,
      child: Container(
        width: widthFind,
        decoration: BoxDecoration(
          // color: Colors.white10,
            borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        child: (nowBoolFind == true)
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            newContanier(),
            Text(
              textFind,
              style: TextStyle(
                  color: Colors.black45,
                  fontFamily: fontBold,
                  fontSize: 18),
            ),
          ],
        )
            :Text(
          textFind,
          style: TextStyle(
              color: Colors.black45,
              fontFamily: fontBold,
              fontSize: 18),
        ),
      ),
    )
        : GestureDetector(
      onTap:satStateDataSend,
      child: Container(
        width: widthFind,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        child: (nowBoolFind == true)
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            newContanier(),
            Text(
              textFind,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: fontBold,
                  fontSize: 18),
            ),
          ],
        )
            : Text(
          textFind,
          style: TextStyle(
              color: Colors.white,
              fontFamily: fontBold,
              fontSize: 18),
        ),
      ),
    ),
  );
}

Container newContanier() {//todo new flash
  return Container(
    decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(5)
    ),
    height: 18,
    width: 45,
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('NEW',style: TextStyle(color: Colors.green,fontFamily: fontLight,fontSize: 11,fontWeight: FontWeight.w700),),
        const Icon(Icons.flash_on,size: 11,color: Colors.green,)
      ],
    ),
  );
}

Container ratingMetter(int indexs) {
  return Container(
    height: 25,
    width: 43,
    decoration: BoxDecoration(
        color: Colors
            .green.shade800,
        borderRadius:
        BorderRadius
            .circular(
            5)),
    child: Row(
      mainAxisAlignment:
      MainAxisAlignment
          .center,
      children: [
        Text(
          productListModelUse!
              .foodListDetails[
          indexs]
              .rating!
              .toString(),
          style: TextStyle(
              color: Colors
                  .white,
              fontFamily:
              fontBold),
        ),
        const Icon(
          Icons.star,
          color:
          Colors.white,
          size: 15,
        )
      ],
    ),
  );
}

Row timerMetter({required String fontFind,}) {
  return Row(
    mainAxisAlignment:
    MainAxisAlignment.center,
    children: [
      const Icon(
        Icons.timer_sharp,
        size:
        15,
        color:
        Colors.black45,
      ),
      Text(
        ' ${timeStore[indexTime]}',
        style:
        TextStyle(fontFamily: fontFind, fontSize: 11),
      ),
    ],
  );
}