import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/guiding_model.dart';

class TourismGuidingDetailsScreen extends StatelessWidget {

  final Data data;
  TourismGuidingDetailsScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'عرض الموضوع',
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
              Container(
                height: 54.h,
                width: 350.w,
                padding: EdgeInsets.symmetric(horizontal: 35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xa1ffffff),
                  border: Border.all(width: 1.0, color: const Color(0xa1c5c0c0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.crop_square,
                          color:  Color(0xff1e8aa8),
                          size: 13.w,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          data.title.toString(),
                          style: TextStyle(
                            fontFamily: fontName,
                            fontSize: 16.sp,
                            color: const Color(0xff1e8aa8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(16.w),
                              right: Radius.circular(16.w),
                            ),
                            color: Color(0xff4CBB17)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 4.h
                            ),
                            child: Text(
                                data.guide!.phone.toString(),
                              style: TextStyle(
                                fontFamily:fontName,
                                fontSize: 13.sp,
                                color:  Color(0xfffffffa),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                        DateFormat('yyyy-MM-dd','en').format(DateTime.parse(data.createdAt.toString())),
                          style: TextStyle(
                            fontFamily:fontName,
                            fontSize: 13.sp,
                            color: const Color(0xfff92a0a),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                height: 54.h,
                width: 350.w,
                padding: EdgeInsets.symmetric(horizontal: 35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xa1ffffff),
                  border: Border.all(width: 1.0, color: const Color(0xa1c5c0c0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person_add,
                          color:  Color(0xff1e8aa8),
                          size: 15.w,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          data.guide!.name.toString(),
                          style: TextStyle(
                            fontFamily: fontName,
                            fontSize: 16.sp,
                            color: const Color(0xff1e8aa8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                   SizedBox(),
                  ],
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              Image.network(
                'https://via.placeholder.com/350x200',
                height: 178.h,
                width: 246.w,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 35.h,
              ),
              Image.network(
                'https://via.placeholder.com/350x150',
                height: 219.h,
                width: 380.w,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
              data.content.toString(),
                style: TextStyle(
                  fontFamily: fontName,
                  fontSize: 15.sp,
                  color: const Color(0xff3897b2),
                ),
                textAlign: TextAlign.center,
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
                        height:35.h,
                      ),
                      Row(
                        children: [
                          Expanded(child: SizedBox()),
                          Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(12.w)
                                ),
                                border: Border.all(
                                    color: Color(0xff007c9d)
                                )
                            ),
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
                                    data.guide!.phone.toString(),
                                    style: TextStyle(
                                      fontFamily: 'JF Flat',
                                      fontSize: 28.sp,
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
                        height:20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(16.w),
                                  right: Radius.circular(16.w),
                                ),
                                color: Color(0xff4CBB17)
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 8.h
                              ),
                              child: Text(
                                'عرض على الخريطة',
                                style: TextStyle(
                                  fontFamily:fontName,
                                  fontSize: 16.sp,
                                  color:  Color(0xfffffffa),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),


                        ],
                      ),
                      SizedBox(
                        height:35.h,
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
