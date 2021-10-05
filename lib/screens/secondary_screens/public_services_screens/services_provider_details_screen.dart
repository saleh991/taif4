import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/services_model.dart';
import 'package:taif/screens/secondary_screens/chat_screen/private_chat_screen_subject.dart';

class ServicesProviderDetailsScreen extends StatelessWidget {
  Data? data;
  ServicesProviderDetailsScreen({Key? key,this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'مقدم الخدمة',
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
      body: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          Container(
            // padding: EdgeInsets.symmetric(vertical: 20.h),

            width: 394.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: const Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x63d5ddeb),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Center(
              child: listTileItem(
                Image.asset('images/man.png'),
                data!.name.toString(),
                Text(
                  data!.category!.name.toString(),
                  style: TextStyle(
                    fontFamily: 'JF Flat',
                    fontSize: 15.sp,
                    color: const Color(0xfffd6164),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Image.asset(
            'images/map.png',
            height: 102.h,
            width: 101.h,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'الاحياء التي يخدمها',
            style: TextStyle(
              fontFamily: 'JF Flat',
              fontSize: 22.sp,
              color: const Color(0xff003e4f),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 25,
          ),
          GridView.builder(
            itemCount:data!.neighborhoods!.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            itemBuilder: (BuildContext context, int index) {
            return servicesPlacesItem(data!.neighborhoods![index]);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
               crossAxisCount: 3,
               childAspectRatio: 2.0,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
               data!.phone.toString(),
                style: TextStyle(
                  fontFamily: 'JF Flat',
                  fontSize: 22.sp,
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
            height: 20.h,
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivateChatSubjectScreen(
                  subjectId: data!.id!,
                  model: 'App\\Models\\HomeService',
                )),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'إرسال رسالة خاصة',
                  style: TextStyle(
                    fontFamily: 'JF Flat',
                    fontSize: 18.sp,
                    color: const Color(0xff003e4f),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Image.asset(
                  'images/chat.png',
                  height: 25,
                  width: 25,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
