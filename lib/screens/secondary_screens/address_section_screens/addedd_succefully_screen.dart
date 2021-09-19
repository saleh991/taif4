import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';

class AddedSuccefullyScreen extends StatelessWidget {
  const AddedSuccefullyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(children: [
            SizedBox(height: 100.h,),
            Container(
                height: 180.h,
                child: Center(child: Image.asset('images/checked.png'))),
            SizedBox(height: 50.h,),
            Center(
              child: Container(
                width: 383.w,
                height: 392.h,
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(31.0),
                  color: const Color(0xffffffff),
                  border:
                      Border.all(width: 1.0, color: const Color(0xff007c9d)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffd5ddeb),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '.. تمت الأضافة بنجاح',
                      style: TextStyle(
                        fontFamily: 'JF Flat',
                        fontSize: 30,
                        color: const Color(0xff007c9d),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Text(
                      'يتم الآن مراجعة الطلب وسيتم نشرة بعد المراجعة شكراً لكم',
                      style: TextStyle(
                        fontFamily: 'JF Flat',
                        fontSize: 18,
                        color: const Color(0xff2f4552),
                        letterSpacing: -0.36,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '0506499275',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 38,
                            color: const Color(0xff007c9d),
                            letterSpacing: -0.76,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Image.asset('images/phone2.png')
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    SizedBox(
                        width: 252.w,
                        height: 51.h,
                        child: defaultButton(
                            function: () {
                              Navigator.pushReplacementNamed(
                                  context, bottomNavRoute);
                            },
                            title: 'العودة للرئيسية'))
                  ],
                ),
              ),
            ),

          ]),
        ),
      ),
    );
  }
}

/*
Container(
  
  )
*/