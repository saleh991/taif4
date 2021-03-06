import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage('images/logo.png',),
                        fit: BoxFit.fill,
                        height: 285.h,
                        width: 252.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Text(
                        "سجل الآن للإستفادة بخدماتنا",
                        // 'wt'.tr(),
                        style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 20.sp,
                          color: const Color(0xff14292c),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/top_welcome.png',
                    ),
                    fit: BoxFit.fill,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
            ),



          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 31.h,
          ),


          SizedBox(
            width: 197.w,
            height: 42.h,
            child: languagesButton(
              title: "دخول",
              // title: 'wbtn'.tr(),
              function: () {
                Navigator.pushReplacementNamed(context, loginRoute);
              },
              color: Color.fromRGBO(93, 155, 88, 1),
            )
          ),

              SizedBox(
              width: MediaQuery.of(context).size.width,
            ),


            SizedBox(
              height: 15.h,

          ),


    //       SizedBox(
    //         height: 24.h,
    //       ),
    //       TextButton(
    //         onPressed: () {},
    //         child: Text(
    //           "طريقة الإشتراك",
    //           // 'subscribe'.tr(),
    //           style: TextStyle(
    //             fontFamily: 'JF Flat',
    //             fontSize: 20.sp,
    //             color: Color.fromRGBO(0, 124, 157, 1)
    // ))),


            SizedBox(
              width: 197.w,
              height: 42.h,
              child: languagesButton(
                title: 'تسجيل',
                function: () {
                  Navigator.pushReplacementNamed(context, registerRoute);
                },
                color: Color.fromRGBO(93, 155, 88, 1),
              ),
            ),


            SizedBox(
              height: 24.h,
            ),


            TextButton(
              onPressed: () {},
              child: Text(
                "طريقة الإشتراك",
                style: TextStyle(
                  fontFamily: 'JF Flat',
                  fontSize: 20.sp,
                  color: Color.fromRGBO(0, 124, 157, 1),
                ),
              ),
            ),
            Spacer(),

            Image.asset(
              'images/bottom_welcome.png',
              height: 218.h,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),


          ],
        ),
      ),
    );
  }
}
