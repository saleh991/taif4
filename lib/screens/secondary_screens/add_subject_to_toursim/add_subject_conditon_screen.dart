import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_subject_toursim_screen.dart';

class AddSubjectCondtionsScreen extends StatelessWidget {
  const AddSubjectCondtionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'شروط إضافة موضوع',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [InkWell(onTap:(){
          Navigator.pushNamed(context, notificationsRoute);
        },child: Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: 12.w
          ),
          child: Icon(
            Icons.notifications,
            color: Color(0xFF007C9D),
            size: 35.sp,
          ),
        ),)],      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 7,
              child:Padding(
                padding:  EdgeInsets.all(16.0.w),
                child: Column(
                  children: [
                    Text(
                      'يمكنكم عبر هذه الخدمة اضافة موضوع',
                      style: TextStyle(
                        fontFamily: fontName,
                        fontSize: 20.sp,
                        color: const Color(0xff007c9d),
                      ),
                    ),
                    Text(
                      'عن نشاطكم التجاري او موقع سياحي',
                      style: TextStyle(
                        fontFamily: fontName,
                        fontSize: 20.sp,
                        color: const Color(0xff007c9d),
                      ),
                    ),
                  ],
                ),
              ) ,
            ),
            SizedBox(
              height: 58.h,
            ),




            // Center(child: SvgPicture.asset('images/map.svg')),
            // Center(child: Image.asset('images/map.png')),
            // SizedBox(
            //   height: 122.h,
            // ),
          Stack(
                  children: [

          Padding(padding: EdgeInsets.only(top: 80,bottom: 50),
            child: Center(
                child: Container(
                width: 383.w,
                  height: 450.h,
                  padding: EdgeInsets.only(left: 15,right: 15,top: 80),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xffd5ddeb),
                        offset: Offset(0, 3),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'دفع الرسوم والشروط',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 22,
                            color: const Color(0xff002a36),
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'الشروط الواجب مراعاتها لإستخدام التطبيق الخاص بنا\nالشروط الواجب مراعاتها لإستخدام التطبيق الخاص بنا\nالشروط الواجب مراعاتها لإستخدام التطبيق الخاص بنا\nالشروط الواجب مراعاتها لإستخدام التطبيق الخاص بنا\nالشروط الواجب مراعاتها لإستخدام التطبيق الخاص بنا\nالشروط الواجب مراعاتها لإستخدام التطبيق الخاص بنا',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 16,
                            color: const Color(0xff003e4f),
                          ),
                          textAlign: TextAlign.right,
                        )
                      ],
                    ),
                )
                ),
                ),

                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(padding: EdgeInsets.only(top: 0),
                        child: Container(
                          // height: 120,
                          width: 150,
                          child:  Center(child: SvgPicture.asset('images/map.svg')),
                        ),
                      ),
                    ),

                  ],

            ),

            SizedBox(
              height: 0.h,
              // height: 122.h,
            ),
            SizedBox(
                width: 354.w,
                height: 51.h,
                child: languagesButton(
                  title: 'أتعهد وأوافق على الشروط',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddSubjectTourismScreen()),
                    );
                  },
                  color: Color(0xFF007C9D),
                )),
            SizedBox(
              height: 35.h,
            ),
          ],
        ),
      ),
    );
  }
}
