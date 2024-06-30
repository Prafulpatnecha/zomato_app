import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zomato/Splash_Screen/splash_screen.dart';
import 'Controller/routes.dart';
import 'Firebase/firebase_options.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(const Zomato_Clone());
}

class Zomato_Clone extends StatefulWidget {
  const Zomato_Clone({super.key});

  @override
  State<Zomato_Clone> createState() => _Zomato_CloneState();
}

class _Zomato_CloneState extends State<Zomato_Clone> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: AppRoutes.routes,
    );
  }
}

