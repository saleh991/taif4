import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/english_section_model.dart';

class EnglishDetailsScreen extends StatelessWidget {

  final Data data;
  EnglishDetailsScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'Taif events',
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
       child: SizedBox(
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
                    Text(
                      data.title.toString(),
                      style: TextStyle(
                        fontFamily: fontName,
                        fontSize: 18.sp,
                        color: const Color(0xff1e8aa8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd').format(DateTime.parse(data.createdAt.toString())),
                      style: TextStyle(
                        fontFamily:fontName,
                        fontSize: 10.sp,
                        color: const Color(0xfff92a0a),
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              CachedNetworkImage(
                fit: BoxFit.fill,
                height: 178.h,
                width: 246.w,
                imageUrl: "https://taif-app.com/storage/app/${ data.image}",

                errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),),


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
              SizedBox(
                height: 35.h,
              ),


              SizedBox(
                height:20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                            data.phone.toString(),
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
                          horizontal: 16.w,
                          vertical: 12.h
                      ),
                      child: Text(
                        'View Map',
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

    );
  }
}
