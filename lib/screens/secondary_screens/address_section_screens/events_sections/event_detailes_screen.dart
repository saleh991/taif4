import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/event_model.dart';

class EventDetailsScreen extends StatelessWidget {
  final Data data;

  EventDetailsScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'فعاليات الطائف',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [
          InkWell(onTap:(){
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
          ),)
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                  border:
                      Border.all(width: 1.0, color: const Color(0xa1c5c0c0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${data.title}',
                        style: TextStyle(
                          fontFamily: fontName,
                          fontSize: 18.sp,
                          color: const Color(0xff1e8aa8),
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        DateFormat('yyyy-MM-dd').format(DateTime.parse( data.createdAt.toString())),

                        style: TextStyle(
                          fontFamily: fontName,
                          fontSize: 14.sp,
                          color: const Color(0xfff92a0a),
                        ),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              // CachedNetworkImage(
              //   fit: BoxFit.fill,
              //   height: 178.h,
              //   width: 246.w,
              //   imageUrl: "https://taif-app.com/storage/app/${data.image}",
              //
              //   errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),),

              SizedBox(
                height: 35.h,
              ),
              for(var im in data.images!)
                Column(
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.fill,

                      height: 219.h,
                      width: 380.w,
                      imageUrl: 'https://taif-app.com/storage/app/${im.path}',

                      errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),),
                    SizedBox(
                      height: 35.h,
                    ),
                  ],
                ),

              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 20.w
                ),
                child: Text(
                  '${data.content}',
                  style: TextStyle(
                    fontFamily: fontName,
                    fontSize: 15.sp,
                    color: const Color(0xff3897b2),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
