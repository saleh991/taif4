import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/components/components.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';
import 'package:easy_localization/easy_localization.dart';


class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  _ChooseLanguageScreenState createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image(
              image: AssetImage(
                'images/top_corner.png',
              ),
              fit: BoxFit.cover,
              height: 327.h,
              width: 295.w,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image(
              image: AssetImage(
                'images/bottom_corner.png',
              ),
              fit: BoxFit.cover,
              height: 286.h,
              width: 256.w,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image(
                  image: AssetImage('images/logo.png'),
                  fit: BoxFit.contain,
                  height: 244.h,
                  width: 216.w,
                ),
                SizedBox(
                  height: 27.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 42.h,
                      width: 128.w,
                      child: languagesButton(
                        title: 'عربي',
                        function: () {
                          context.setLocale(Locale('ar'));
                          String route = AppController.instance.outBoarding() ? welcomeRoute: outBoardingRoute;
                          Navigator.pushReplacementNamed(
                            context,
                            route,
                          );
                        },
                        color: Color.fromRGBO(93, 155, 88, 1),
                      ),
                    ),
                    SizedBox(
                      width: 13.6.w,
                    ),
                    SizedBox(
                      height: 42.h,
                      width: 128.w,
                      child: languagesButton(
                        title: 'English',
                        function: () {
                          context.setLocale(Locale('en'));
                          Navigator.pushReplacementNamed(
                              context, outBoardingRoute);
                        },
                        color: Color.fromRGBO(47, 69, 82, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
