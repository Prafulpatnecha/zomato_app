import 'package:flutter/material.dart';
import 'package:zomato/home/display_screen/display_page.dart';
import '../Login_Screen/Login_Page.dart';
import '../Splash_Screen/splash_screen.dart';
import '../home/cart_screen/cartpage.dart';
import '../home/home_screen/homepage.dart';
import '../home/paymentscreen/paymentpage.dart';

class AppRoutes{
  static Map<String, Widget Function(BuildContext)> routes={
    '/splash' : (context) => const SplashScreen(),
    '/':(context)=>const MainLoinPage(),
    '/home':(context)=>const HomePage(),
    '/view':(context)=>const DisplayPage(),
    '/cart':(context)=>const CartPage(),
    '/order':(context)=>const Order_Placed(),
  };
}