import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  double height = 50;
  double width = 50;

  @override
  void initState() {
    super.initState();
    AppController.instance;
    Future.delayed(Duration(seconds: 3), () {}).then((value) {

      //AppController.instance.outBoarding() ? welcomeRoute: outBoardingRoute

      String route = AppController.instance.loggedIn() ? bottomNavRoute :
      // AppController.instance.outBoarding() ? welcomeRoute: outBoardingRoute;
      chooseLanguageRoute;
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'images/bg.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        alignment: AlignmentDirectional.center,
        child: Center(
          child: AnimatedContainer(
            height: 285.h,
            width: 252.w,
            curve: Curves.bounceOut,
            duration: Duration(milliseconds: 2500),
            child: Image(
              image: AssetImage('images/logo.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
