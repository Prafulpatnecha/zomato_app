import 'package:flutter/material.dart';
import 'package:zomato/home/display_screen/display_page.dart';
import '../Splash_Screen/splash_screen.dart';
import '../home/cart_screen/cartpage.dart';
import '../home/home_screen/homepage.dart';
import '../home/paymentscreen/paymentpage.dart';

class AppRoutes{
  static Map<String, Widget Function(BuildContext)> routes={
    '/' : (context) => const SplashScreen(),
    '/home':(context)=>const HomePage(),
    '/view':(context)=>const DisplayPage(),
    '/cart':(context)=>const CartPage(),
    '/order':(context)=>const Order_Placed(),
  };
}