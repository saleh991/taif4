import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/location_model.dart';

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
                        'عرض سياحي جديد',
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
                           '222222',
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
                        'عبد الله الخالدي',
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
              'https://opencart3.const-tech.biz/tf/storage/app/${data.mainImage}',
              height: 178.h,
              width: 246.w,
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 35.h,
            ),
            Image.network(
              'https://opencart3.const-tech.biz/tf/storage/app/${data.images![0].path}',
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
          ],
        ),
      ),
    );
  }
}
