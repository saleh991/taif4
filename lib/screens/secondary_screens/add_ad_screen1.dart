import 'package:flutter/material.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAdScreen1 extends StatelessWidget {
  const AddAdScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'أضف إعلان',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [InkWell(onTap:(){
          Navigator.pushNamed(context, notificationsRoute);
        },child: Image.asset('images/notification_icon.png'))],      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 25.h,
          ),
          addFromGalleryItems(
              title: 'أرفق صورة', icon: Icons.camera_alt, function: () {}),
          SizedBox(
            height: 10.h,
          ),
          addFromGalleryItems(
              title: 'أرفق صور إضافية',
              icon: Icons.photo_library_sharp,
              function: () {}),
          SizedBox(
            height: 10.h,
          ),
          addFromGalleryItems(
              title: 'أرفق فيديو',
              icon: Icons.video_call_outlined,
              function: () {}),
          SizedBox(
            height: 45.h,
          ),
          Center(
            child: defaultCheckBox(title: 'لا يوجد صور ليتم أرفاقها'),
          ),
          SizedBox(
            height: 45.h,
          ),
          SizedBox(
              width: 354.w,
              height: 51.h,
              child: languagesButton(
                title: 'استمرار',
                function: () {
                  Navigator.pushNamed(context,addAdRoute2);
                },
                color: Color.fromRGBO(31, 135, 22, 1),
              )),
        ],
      ),
    );
  }
}
