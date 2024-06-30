import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zomato/home/home_screen/homepage.dart';
import '../Firebase/FirebaseService.dart';
import '../Login_Screen/Login_Page.dart';

class LoginController extends GetxController {
  static String LoginKey = 'islogin';
  static bool? isLogin = false;

  @override
  void onInit() {
    super.onInit();
    // Use a separate method to handle async operation
    _initAsync();
  }

  // Separate async method
  void _initAsync() async {
    await SkipLoginPage();
  }



  Future<void> login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(LoginKey, true);
    Get.offAll(HomePage());
  }

  Future<void> SkipLoginPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool(LoginKey);

    if (isLogin == true) {
      Get.offAll(HomePage());
    }
    else
    {
      Get.offAll(MainLoinPage());
    }
  }

  static void logOut()async{
    FirebaseService.signOutFromGoogle();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(LoginKey, false);
    Get.offAll(MainLoinPage());
  }
}
