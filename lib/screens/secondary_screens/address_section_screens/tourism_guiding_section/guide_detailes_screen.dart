import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/guide_model.dart';

class GuideDetailsScreen extends StatelessWidget {

  final Data data;
  GuideDetailsScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'عرض المرشدين السياحين',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [InkWell(onTap:(){
          Navigator.pushNamed(context, notificationsRoute);
        },child: Image.asset('images/notification_icon.png'))],      ),
      body: SizedBox(
        width: ScreenUtil().screenWidth,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
              ),



              SizedBox(
                height: 23.h,
              ),

              if(data.image!=null)
                CircleAvatar(
                  backgroundImage:
                  NetworkImage(
                    'https://taif-app.com/storage/app/${data.image}',
                  ),

                  maxRadius: 35,
                )else
                CircleAvatar(
                  backgroundImage:
                  AssetImage('images/circle_img.png'),

                  maxRadius: 35,
                ),
              SizedBox(
                height: 35.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    data.name.toString(),
                    style: TextStyle(
                      fontFamily: 'JF Flat',
                      fontSize: 22.sp,
                      color: const Color(0xff003e4f),
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Container(

                        child:   Padding(
                          padding:  EdgeInsets.symmetric(
                              vertical: 2.h,
                              horizontal: 12.w
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                data.phone.toString(),
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 22.sp,
                                  color: const Color(0xff007c9d),
                                  letterSpacing: -0.76,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 16.w,
                              ),
                              Image.asset('images/phone2.png')
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 220.w,
                    child: Row(
                      children: [
                        Image.asset(
                          'images/save.png',
                          height: 18.h,
                          width: 12.w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'الارشاد السياحي',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 13.sp,
                            color: const Color(0xff7a90b7),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                ],
              ),
              SizedBox(
                height: 35.h,
              ),

              Padding(
                padding:  EdgeInsets.symmetric(horizontal:
                20.w
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(12.w)
                      ),
                    border: Border.all(
                      color: Colors.grey.shade400
                    )
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height:15.h,
                        width: ScreenUtil().screenWidth,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                data.notes.toString(),
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 22.sp,
                                  color: const Color(0xff007c9d),
                                  letterSpacing: -0.76,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),


                      SizedBox(
                        height:25.h,
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(
                height:35.h,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
