import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/cubit/cubit.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/models/chat_model.dart';
import 'package:taif/models/english_section_model.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/models/event_model.dart';
import 'package:taif/models/favorite_model.dart';
import 'package:taif/models/guiding_model.dart';
import 'package:taif/models/haraj_model.dart';
import 'package:taif/models/location_model.dart';
import 'package:taif/models/notification_model.dart';
import 'package:taif/models/offers_model.dart';
import 'package:taif/models/taif_model.dart';
import 'package:taif/screens/primary_screens/estates_section/estate_details2_screen.dart';
import 'package:taif/screens/secondary_screens/favorite_details.dart';

Widget languagesButton({
  required String title,
  required VoidCallback function,
  required Color color,

}) =>
    ElevatedButton(
      onPressed: function,
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'JF Flat',
          fontSize: 16.sp,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
    );

Widget languagesButtonWithIcon({
  required String title,
  required VoidCallback function,
  required Color color,
  required Icon icon,

}) =>
    ElevatedButton(
      onPressed: function,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'JF Flat',
              fontSize: 16.sp,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          icon
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
    );

Widget outBoardingItem({
  required String img,
  required String title,
  required String subTitle1,
  required String subTitle2,
}) =>
    SizedBox(
      height: 400.h,
      width: 334.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            img,
            fit: BoxFit.cover,
            height: 194.h,
            width: 337.w,
          ),
          SizedBox(
            height: 39.h,
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'JF Flat',
              fontSize: 20.sp,
              color: const Color(0xff14292c),
              // height: 1.h,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 18.h,
          ),
          Text(
            subTitle1,
            style: TextStyle(
              fontFamily: 'JF Flat',
              fontSize: 20.sp,
              color: const Color(0xff00a79d),
              // height: 0.8.h,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            subTitle2,
            style: TextStyle(
              fontFamily: 'JF Flat',
              fontSize: 19,
              color: const Color(0xff33314f),
              // height: 0.8421052631578947.h,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );

Widget defaultTextField({
  required String hint,
  TextInputType keyboardType = TextInputType.text,
  required TextEditingController controller,
  bool hasSuffix = false,
  var suffixIcon,
  bool readOnly = false,
  bool obscureText = false,
  var function,
  // required String
}) =>
    TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontFamily: 'JF Flat',
            fontSize: 15,
            color: const Color(0x522f4552),
            letterSpacing: -0.3,
          ),
          suffix: hasSuffix
              ? IconButton(
                  onPressed: function,
                  icon: suffixIcon,
                  padding: EdgeInsets.zero,
                )
              : SizedBox()),
    );

Widget defaultButton({
  required VoidCallback function,
  required String title,
}) =>
    ElevatedButton(
      onPressed: function,
      child: Text(
        title,
        style: TextStyle(
          fontFamily: 'JF Flat',
          fontSize: 18.sp,
          color: const Color(0xffffffff),
        ),
        textAlign: TextAlign.center,
      ),
      style: ElevatedButton.styleFrom(
        primary: defaultColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );

Widget searchTextField({
  required TextEditingController controller,
}) {
  return TextField(
      controller: controller,
      decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: 'أدخل كلمة البحث',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                width: 0.5, style: BorderStyle.solid, color: Color(0xFFE4ECFE)),
          ),
          suffixIcon: Image.asset('images/search.png')));
}

Widget contactItem({
  required String title,
  required String img,
}) =>
    Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: defaultColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'JF Flat',
                  fontSize: 13,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Image.asset(
              img,
              fit: BoxFit.cover,
              // height: 27.h,
              // width: 27.w,
            ),
          ],
        ),
      ),
    );

Widget contactTextFieldWithHintColor({
  required String hint,
  TextInputType keyboardType = TextInputType.text,
  required TextEditingController controller,
  int line = 1,
}) =>
    TextField(
      maxLines: line,
      controller: controller,
      style: TextStyle(
          fontFamily: 'JF Flat', fontSize: 20.sp, color: Colors.black),
      keyboardType: keyboardType,
      decoration: InputDecoration(

        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(213, 221, 235, 1), width: 1),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'JF Flat',
          fontSize: 20.sp,
          color: const Color(0xff25afff),
        ),
      ),
    );

Widget contactTextField({
  required String hint,
  TextInputType keyboardType = TextInputType.text,
  required TextEditingController controller,
  int line = 1,
}) =>
    TextField(
      maxLines: line,
      controller: controller,
      style: TextStyle(
          fontFamily: 'JF Flat', fontSize: 20.sp, color: Colors.black),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: hint,
        border: OutlineInputBorder(
          borderSide:
          BorderSide(color: Color.fromRGBO(213, 221, 235, 1), width: 1),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'JF Flat',


          fontSize: 20.sp,
          color: const Color(0x853a3a3a),
        ),
      ),
    );

Widget notificationsItem(
        {required int index, required NotificationModel notificationModel}) =>
    Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: CircleAvatar(
          backgroundColor: notificationModel.data![index].seen == 1
              ? Color.fromRGBO(253, 97, 100, 1)
              : Color.fromRGBO(114, 194, 9, 1),
          radius: 13,
          child: Center(
            child: Icon(
              Icons.arrow_back_ios,
              size: 16.h,
              color: Colors.white,
            ),
          ),
        ),
        trailing: Icon(
          Icons.delete,
          size: 30.h,
          color: Colors.red,
        ),
        title: Text(
          notificationModel.data![index].content.toString(),
          style: TextStyle(
            fontFamily: 'JF Flat',
            fontSize: 19.sp,
            color: const Color(0xff007c9d),
          ),
          textAlign: TextAlign.right,
        ),
        subtitle: Text(
          DateFormat('yyyy-MM-dd','en').format(DateTime.parse(
              notificationModel.data![index].createdAt.toString())),

          style: TextStyle(
            fontFamily: 'JF Flat',
            fontSize: 15.sp,
            color: const Color(0xff007c9d),
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );

Widget profileItem({
  required String title,
  required String icon,
  required VoidCallback function,
}) =>
    InkWell(
      onTap: function,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 22.h,
              width: 22.w,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'JF Flat',
                fontSize: 19.sp,
                color: Color.fromRGBO(0, 62, 79, 1),
              ),
            ),
          ],
        ),
      ),
    );


Widget profileItemSvg({
  required String title,
  required String icon,
  required Color color,
  required VoidCallback function,
}) =>
    InkWell(
      onTap: function,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Row(
          children: [
            SizedBox(
              height:30.h ,
              width:22.w ,
              child: SvgPicture.asset(
                icon,
                color: color,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'JF Flat',
                fontSize: 19.sp,
                color: Color.fromRGBO(0, 62, 79, 1),
              ),
            ),
          ],
        ),
      ),
    );

ListView itemsListView({
  required VoidCallback function,
  required EstateModel estateModel,
}) {
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: estateModel.data!.length,
      itemBuilder: (context, index) {
        return Container(
          height: 125.h,
          // width: 394.w,
          margin: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color(0x1fd5ddeb),
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
          padding: EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EstateDetailsScreen(estateModel.data![index]),
                ),
              );
            },
            child: Row(
              children: [
                Container(
                  height: 80.w,
                  width: 80.w,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: "https://taif-app.com/storage/app/${estateModel.data![index].mainImage}",

                    errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),
                    imageBuilder: (context, imageProvider) { // you can access to imageProvider
                      return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                        backgroundImage: imageProvider,
                      );
                    },
                  ),


                ),

                SizedBox(
                  width: 30.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 13.h,
                      ),
                      Text(
                        '${estateModel.data![index].title}',
                        style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 18.sp,
                          color: const Color(0xff003e4f),
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/save.png',
                              height: 18.h,
                              width: 12.w,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'العقارات',
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 10.sp,
                                color: const Color(0xff7a90b7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            // SizedBox(
                            //   width: 5,
                            // ),
                            // Image.asset(
                            //   'images/location.png',
                            //   height: 18.h,
                            //   width: 20.w,
                            // ),
                            // SizedBox(
                            //   width: 10,
                            // ),
                            // Text(
                            //   'الحوية',
                            //   style: TextStyle(
                            //     fontFamily: 'JF Flat',
                            //     fontSize: 10.sp,
                            //     color: const Color(0xff7a90b7),
                            //   ),
                            //   textAlign: TextAlign.center,
                            // ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'images/speech.png',
                              height: 18.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${estateModel.data![index].comments != null ? estateModel.data![index].comments!.length : ''}',
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 12.sp,
                                color: const Color(0xff7a90b7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'images/eye.png',
                              height: 18.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${estateModel.data![index].views}',
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 12.sp,
                                color: const Color(0xff7a90b7),
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      if(estateModel.data![index].category!.id == 1)
                        Row(
                        children: [
                          Image.asset(
                            'images/price.png',
                            width: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'عروض العقار',
                            style: TextStyle(
                              fontFamily: 'JF Flat',
                              fontSize: 11,
                              color: const Color(0xff007c9d),
                            ),
                            textAlign: TextAlign.left,
                          ),

                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              DateFormat('yyyy-MM-dd','en').format(DateTime.parse(estateModel.data![index].
                              createdAt.toString())),
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 14.sp,
                                color: const Color(0xff007c9d),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              estateModel.data![index].user!.name!,
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 14.sp,
                                color: const Color(0xff007c9d),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                        ],
                      ),
                      if(estateModel.data![index].category!.id == 2)
                        Row(
                          children: [
                            Image.asset(
                              'images/price.png',
                              width: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'طلبات العقار',
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 11,
                                color: const Color(0xff007c9d),
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                DateFormat('yyyy-MM-dd','en').format(DateTime.parse(estateModel.data![index].
                                createdAt.toString())),
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 13.sp,
                                  color: const Color(0xff007c9d),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                estateModel.data![index].user!.name!,
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 14.sp,
                                  color: const Color(0xff007c9d),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                          ],
                        ),
                      SizedBox(
                        height: 13.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}

ListView favoriteItem({
  required VoidCallback function,
  required FavoriteModel favoriteModel,
}) {
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: favoriteModel.data!.appModelsEstate!.length,
      itemBuilder: (context, index) {
        if(favoriteModel.data!.appModelsEstate![index].favorite !=null)
        return Dismissible(
          direction: DismissDirection.startToEnd,
          background: Container(
            color: Colors.red,

            margin: EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.centerRight,
            child: Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: 20.w
              ),
              child: Icon(
                Icons.delete,
                size: 30.sp,
                color: Colors.white,
              ),
            ),
          ),

          key: UniqueKey(),
          onDismissed: (_){
              MainCubit()..removeFromFav(estateId:

              favoriteModel.data!.appModelsEstate![index].favorite!.id!,
                  model: 'estates');
          },
          child: Container(
            height: 126.h,

            margin: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0x1fd5ddeb),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            padding: EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FavoriteDetailsScreen(favoriteModel.data!.appModelsEstate![index]),
                  ),
                );
              },
              child: Row(
                children: [
                  Container(
                    height: 80.w,
                    width: 80.w,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: "https://taif-app.com/storage/app/${favoriteModel.data!.appModelsEstate![index].favorite!.image}",

                      errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),
                      imageBuilder: (context, imageProvider) { // you can access to imageProvider
                        return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                          backgroundImage: imageProvider,
                        );
                      },
                    ),


                  ),

                  SizedBox(
                    width: 30.w,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 13.h,
                        ),
                        Text(
                          '${favoriteModel.data!.appModelsEstate![index].favorite!.title}',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 18.sp,
                            color: const Color(0xff003e4f),
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/save.png',
                                height: 18.h,
                                width: 12.w,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'العقارات',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 14.sp,
                                  color: const Color(0xff7a90b7),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                'images/location.png',
                                height: 18.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'الحوية',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 10.sp,
                                  color: const Color(0xff7a90b7),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Image.asset(
                                'images/eye.png',
                                height: 18.h,
                                width: 20.w,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${favoriteModel.data!.appModelsEstate![index].favorite!.views}',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 12.sp,
                                  color: const Color(0xff7a90b7),
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'images/price.png',
                              width: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'عروض العقار',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 11,
                                  color: const Color(0xff007c9d),
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
        else
          return SizedBox();
      });
}

Widget homeItem({
  required String img,
  required String title,
  required VoidCallback function,
}) =>
    InkWell(
      onTap: function,
      child: Container(
        height: 184.h,
        width: 184.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36.0),
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffd5ddeb),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                img,
                height: 66.h,
                width: 68.h,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'JF Flat',
                  fontSize: 15.sp,
                  color: const Color(0xff003e4f),
                  letterSpacing: -0.3,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );

Widget chatItem({
  required VoidCallback function,
  required ChatModel chatModel,
  required int index,
}) {
  return InkWell(
    onTap: function,
    child: Container(
      height: 56.h,
      width: 394.w,
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0x63d5ddeb),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'images/chat.png',
                height: 35.h,
                width: 35.w,
              ),
              SizedBox(
                width: 32.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${chatModel.chats![index].anotherUser!.name}',
                    style: TextStyle(
                      fontFamily: 'JF Flat',
                      fontSize: 18.sp,
                      color: const Color(0xff003e4f),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Expanded(
                    child: Text(
                      (chatModel.chats![index].lastMessage !=null?
                      chatModel.chats![index].lastMessage!.content:
                      chatModel.chats![index].subject!.title)!,
                      style: TextStyle(
                        fontFamily: 'JF Flat',
                        fontSize: 14.sp,
                        color: const Color(0xff7a90b7),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ],
          ),
          Image.asset('images/check.png')
        ],
      ),
    ),
  );
}

Widget tapHomeItem({
  required String title,
  required Color color,
  required VoidCallback function,
}) =>
    InkWell(
      onTap: function,
      child: Container(
        height: 49.h,
        width: 138.w,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'JF Flat',
              fontSize: 12,
              color: const Color(0xffffffff),
              letterSpacing: -0.3,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );

Widget membershipItem({
  required String price,
  required String ads,
  required String name,
  required VoidCallback function,
}) =>
    Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.0),
        border: Border.all(width: 1.0, color: const Color(0xff007c9d)),
      ),
      height: 170.h,
      width: 394.w,
      child: Row(
        children: [
          SizedBox(
            width: 7.w,
          ),
          Container(
            height: 127.h,
            width: 4.w,
            color: Color.fromRGBO(0, 124, 157, 1),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 20.h,
            color: Color.fromRGBO(0, 124, 157, 1),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 15.h,
                    bottom: 20.h,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'إشتراك سنوي',
                        style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 19.sp,
                          color: const Color(0xfffd6164),
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        '$name',
                        style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 38.sp,
                          color: const Color(0xff003e4f),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        'حقق إنتشار أكثر لإعلانك',
                        style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 14.sp,
                          color: const Color(0xff003e4f),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    membershipDetails(v: '$price ريال'),
                    SizedBox(
                      height: 7.h,
                    ),
                    membershipDetails(v: '$ads اعلان'),
                    SizedBox(
                      height: 7.h,
                    ),
                    InkWell(
                      onTap: function,
                      child: Container(
                        height: 36.h,
                        width: 126.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          gradient: LinearGradient(
                            begin: Alignment(0.0, -1.0),
                            end: Alignment(0.0, 1.0),
                            colors: [
                              const Color(0xffa2c103),
                              const Color(0xff1f8716)
                            ],
                            stops: [0.0, 1.0],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'إشترك الآن',
                            style: TextStyle(
                              fontFamily: 'JF Flat',
                              fontSize: 18.sp,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget membershipDetails({
  required String v,
}) =>
    Container(
      height: 36.h,
      width: 126.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        gradient: LinearGradient(
          begin: Alignment(0.0, -1.0),
          end: Alignment(0.0, 1.0),
          colors: [const Color(0xffffffff), const Color(0xffd5ddeb)],
          stops: [0.0, 1.0],
        ),
        border: Border.all(width: 1.0, color: const Color(0x4f7a90b7)),
      ),
      child: Center(
        child: Text(
          v,
          style: TextStyle(
            fontFamily: 'JF Flat',
            fontSize: 22.sp,
            color: const Color(0xff1f8716),
          ),
        ),
      ),
    );

Widget listTileItem(Widget leading, String title, Widget trailing) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding:  EdgeInsets.all(11.h),
          child: Row(
            children: [
              leading,
              SizedBox(
                width: 18.w,
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'JF Flat',
                  fontSize: 18.sp,
                  color: const Color(0xff003e4f),
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),

        trailing
      ],

         ),
  );
}

Widget defaultCheckBox({
  bool checkBoxValue = false,
  required String title,
}) =>
    StatefulBuilder(
      builder: (context, setState) =>
          CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: checkBoxValue,
        onChanged: (value) {
          setState(() {
            checkBoxValue = value!;
          });
        },
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'JF Flat',
            fontSize: 14.sp,
            color: const Color(0xff007c9d),
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );

Widget membershipText({
  required Color color,
  required String text,
}) =>
    Text(
      text,
      style: TextStyle(
        fontFamily: 'JF Flat',
        fontSize: 15.sp,
        color: color,
      ),
      textAlign: TextAlign.center,
    );

Container chatMessageItem(Chats chats, int index) {
  return Container(
    height: 62.h,
    width: 359.w,
    margin: EdgeInsets.symmetric(vertical: 5.h),
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11.0),
      color: AppController.instance.getId() == chats.messages![index].userId
          ? Color(0x354BCCDB)
          : Color(0x55D5DDEB),
    ),
    child: ListTile(
      title: Text(
        '${chats.messages![index].content}',
        style: TextStyle(
          fontFamily: fontName,
          fontSize: 18.sp,
          color: const Color(0xff7a90b7),
        ),
        textAlign: TextAlign.right,
      ),
      trailing: Text(
        '${chats.messages![index].createdAt!.substring(
          14,
          19,
        )}',
        style: TextStyle(
          fontFamily: fontName,
          fontSize: 12,
          color: const Color(0xff7a90b7),
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget addFromGalleryItems({
  required String title,
  required IconData icon,
  required VoidCallback function,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 291.w,
        height: 43.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: const Color(0xffffffff),
          border: Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'JF Flat',
              fontSize: 15,
              color: const Color(0xff3a3a3a),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      IconButton(
          onPressed: function,
          icon: Icon(
            icon,
            color: Color(0xFF7A90B7),
          ))
    ],
  );
}

InkWell secondlistViewItem(
    {required VoidCallback function,
    required LocationModel locationModel,
    required int index}) {
  return InkWell(
    onTap: function,
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            height: 80.w,
            width: 80.w,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: "https://taif-app.com/storage/app/${locationModel.data![index].mainImage}",

              errorWidget: (context, url, error) =>
                  Image.asset('images/ee.png',
                fit: BoxFit.fill,),
              imageBuilder: (context, imageProvider) { // you can access to imageProvider
                return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                  backgroundImage: imageProvider,
                );
              },
            ),


          ),
          SizedBox(
            width: 30.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6.h,
              ),
              Text(
                locationModel.data![index].title.toString(),
                style: TextStyle(
                  fontFamily: 'JF Flat',
                  fontSize: 16.sp,
                  color: const Color(0xff003e4f),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 220.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
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
                               '${locationModel.data![index].category == null?'': locationModel.data![index].category!.name}',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 14.sp,
                                  color: const Color(0xff7a90b7),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Text(
                            DateFormat('yyyy-MM-dd','en').format(DateTime.parse(locationModel.data![index].createdAt.toString())),

                            style: TextStyle(
                              fontFamily: 'Tahoma',
                              fontSize: 14.sp,
                              color: const Color(0xff007c9d),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15.w,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [

                          if(locationModel.data![index].user!=null)
                          Text(
                            locationModel.data![index].user!.name!,
                            style: TextStyle(
                              fontFamily: 'Noto Kufi Arabic',
                              fontSize: 14.sp,
                              color: const Color(0xff003e4f),
                            ),
                            textAlign: TextAlign.start,
                          ),

                        ],
                      ),
                    ),
                    SizedBox(width: 15.w,),
                    Expanded(
                      child: Column(
                        children: [
                          if(locationModel.data![index].km!>0)
                          Image.asset(
                            'images/map.png',
                            width: 25.w,
                            height: 25.h,
                          ),
                          if(locationModel.data![index].km!>0)
                          SizedBox(
                            height: 14.h,
                          ),
                          if(locationModel.data![index].km!>0)
                          Text(

                            locationModel.data![index].km.toString()+
                            ' k.m',
                            style: TextStyle(
                              fontFamily: 'Noto Kufi Arabic',
                              fontSize: 14.sp,
                              color: const Color(0xff003e4f),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: 220.w + 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    SizedBox(
                      width: 10,
                    ),

                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
  );

}

InkWell englishListViewItem(
    {required VoidCallback function,
      required EnglishSectionModel englishModel,
      required int index}) {
  return InkWell(
    onTap: function,
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            height: 80.w,
            width: 80.w,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: "https://taif-app.com/storage/app/${englishModel.data![index].image!}",

              errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),
              imageBuilder: (context, imageProvider) { // you can access to imageProvider
                return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                  backgroundImage: imageProvider,
                );
              },
            ),


          ),
          SizedBox(
            width: 30.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6.h,
              ),
              Text(
                englishModel.data![index].title.toString(),
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
              SizedBox(
                width: 220.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
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
                              '',
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 14.sp,
                                color: const Color(0xff7a90b7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        Text(
                          DateFormat('yyyy-MM-dd','en').format(DateTime.parse(englishModel.data![index].createdAt.toString())),

                          style: TextStyle(
                            fontFamily: 'Tahoma',
                            fontSize: 14.sp,
                            color: const Color(0xff007c9d),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'images/eye.png',
                              height: 18.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              englishModel.data![index].views.toString(),
                              style: TextStyle(
                                fontFamily: 'JF Flat',
                                fontSize: 14.sp,
                                color: const Color(0xff7a90b7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),


                      ],
                    ),
                    Column(
                      children: [
                        if(englishModel.data![index].km!>0)
                        Image.asset(
                          'images/map.png',
                          width: 25.w,
                          height: 25.h,
                        ),
                        if(englishModel.data![index].km!>0)
                        SizedBox(
                          height: 14.h,
                        ),
                        if(englishModel.data![index].km!>0)
                        Text(
                          '${englishModel.data![index].km!} k.m',
                          style: TextStyle(
                            fontFamily: 'Noto Kufi Arabic',
                            fontSize: 14.sp,
                            color: const Color(0xff003e4f),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: 220.w + 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    SizedBox(
                      width: 10,
                    ),

                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
  );

}

InkWell tourismGuidingViewItem(
    {required VoidCallback function,
      required GuidingModel guidingModel,
      required int index}) {
  return InkWell(
    onTap: function,
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            height: 80.w,
            width: 80.w,


            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: "https://taif-app.com/storage/app/${guidingModel.data![index].image}",

              errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),
              imageBuilder: (context, imageProvider) { // you can access to imageProvider
                return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                  backgroundImage: imageProvider,
                );
              },
            ),


          ),
          SizedBox(
            width: 30.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                guidingModel.data![index].title.toString(),
                style: TextStyle(
                  fontFamily: 'JF Flat',
                  fontSize: 18.sp,
                  color: const Color(0xff003e4f),
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: 220.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                          '${guidingModel.data![index].guide == null?'': guidingModel.data![index].guide!.name}',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 14.sp,
                            color: const Color(0xff7a90b7),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd','en').format(DateTime.parse(guidingModel.data![index].createdAt.toString())),

                      style: TextStyle(
                        fontFamily: 'Tahoma',
                        fontSize: 14.sp,
                        color: const Color(0xff007c9d),
                      ),
                      textAlign: TextAlign.right,
                    ),


                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),

            ],
          )
        ],
      ),
    ),
  );
}

InkWell harajslistViewItem(
    {required VoidCallback function,
    required HarajModel harajModel,
    required int index,
      required String categoryName,


    }) {
  return InkWell(
    onTap: function,
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            height: 80.w,
            width: 80.w,


            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: "https://taif-app.com/storage/app/${harajModel.data![index].main_image}",

              errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),
              imageBuilder: (context, imageProvider) { // you can access to imageProvider
                return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                  backgroundImage: imageProvider,
                );
              },
            ),


          ),

          SizedBox(
            width: 30.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6.h,
              ),
              Text(
                harajModel.data![index].title.toString(),
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
              SizedBox(
                width: 250.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
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
                                '$categoryName',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 14.sp,
                                  color: const Color(0xff7a90b7),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          SizedBox(

                            child: Text(
                              DateFormat('yyyy-MM-dd','en').format(DateTime.parse(harajModel.data![index].createdAt.toString())),
                              style: TextStyle(
                                fontFamily: 'Tahoma',
                                fontSize: 14.sp,
                                color: const Color(0xff007c9d),
                              ),
                              textAlign: TextAlign.right,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width:22.w,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          SizedBox(

                            child: Text(
                              harajModel.data![index].user!.name!,
                              style: TextStyle(
                                fontFamily: 'Tahoma',
                                fontSize: 14.sp,
                                color: const Color(0xff007c9d),
                              ),
                              textAlign: TextAlign.right,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 22.w,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if(harajModel.data![index].km!>0)
                          Image.asset(
                            'images/map.png',
                            width: 25.w,
                            height: 25.h,
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          if(harajModel.data![index].km!>0)
                          Text(
                            '${harajModel.data![index].km} k.m',
                            style: TextStyle(
                              fontFamily: 'Noto Kufi Arabic',
                              fontSize: 14.sp,
                              color: const Color(0xff003e4f),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),

            ],
          )
        ],
      ),
    ),
  );
}

InkWell eventListViewItem(
    {required VoidCallback function,
    required EventModel eventModel,

    required int index}) {
  return InkWell(
    onTap: function,
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80.w,
            width: 80.w,


            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: "https://taif-app.com/storage/app/${eventModel.data![index].image}",

              errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),
              imageBuilder: (context, imageProvider) { // you can access to imageProvider
                return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                  backgroundImage: imageProvider,
                );
              },
            ),


          ),

          SizedBox(
            width: 30.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                eventModel.data![index].title.toString(),
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
              SizedBox(
                width: 220.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                          'فعاليات الطائف',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 14.sp,
                            color: const Color(0xff7a90b7),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: 220.w + 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('yyyy-MM-dd','en').format(DateTime.parse( eventModel.data![index].createdAt.toString())),

                      style: TextStyle(
                        fontFamily: 'Tahoma',
                        fontSize: 14.sp,
                        color: const Color(0xff007c9d),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    if(eventModel.data![index].km! >0)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${eventModel.data![index].km!} k.m',
                        style: TextStyle(
                          fontFamily: 'Noto Kufi Arabic',
                          fontSize: 14.sp,
                          color: const Color(0xff003e4f),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

InkWell offerListViewItem(
    {required VoidCallback function,
    required OffersModel offerModel,

    required int index}) {
  return InkWell(
    onTap: function,
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80.w,
           width: 80.w,


           child: CachedNetworkImage(
             fit: BoxFit.fill,
             imageUrl: "https://taif-app.com/storage/app/${offerModel.data![index].image}",

             errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),
             imageBuilder: (context, imageProvider) { // you can access to imageProvider
               return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                 backgroundImage: imageProvider,
               );
             },
           ),


          ),
          SizedBox(
            width: 30.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                offerModel.data![index].title.toString(),
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
              SizedBox(
                width: 220.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                          'عروض تجارية',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 14.sp,
                            color: const Color(0xff7a90b7),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: 220.w + 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('yyyy-MM-dd','en').format(DateTime.parse( offerModel.data![index].createdAt.toString())),
                      style: TextStyle(
                        fontFamily: 'Tahoma',
                        fontSize: 14.sp,
                        color: const Color(0xff007c9d),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    if(offerModel.data![index].km! >0)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${offerModel.data![index].km} km',
                        style: TextStyle(
                          fontFamily: 'Noto Kufi Arabic',
                          fontSize: 14.sp,
                          color: const Color(0xff003e4f),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

InkWell taifListViewItem(
    {required VoidCallback function,
      required TaifModel taifModel,
      required String section,
      required int index}) {
  return InkWell(
    onTap: function,
    child: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80.w,
            width: 80.w,


            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: "https://taif-app.com/storage/app/${taifModel.data![index].image}",

              errorWidget: (context, url, error) => Image.asset('images/ee.png',fit: BoxFit.fill,),
              imageBuilder: (context, imageProvider) { // you can access to imageProvider
                return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                  backgroundImage: imageProvider,
                );
              },
            ),


          ),

          SizedBox(
            width: 30.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Text(
                taifModel.data![index].title.toString(),
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
              SizedBox(
                width: 220.w,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'images/eye.png',
                          height: 18.h,
                          width: 12.w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          '$section',
                          style: TextStyle(
                            fontFamily: 'JF Flat',
                            fontSize: 14.sp,
                            color: const Color(0xff7a90b7),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: 220.w + 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                     DateFormat('yyyy-MM-dd','en').format(DateTime.parse( taifModel.data![index].createdAt.toString())),
                      style: TextStyle(
                        fontFamily: 'Tahoma',
                        fontSize: 14.sp,
                        color: const Color(0xff007c9d),
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    if(taifModel.data![index].km! >0)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${taifModel.data![index].km} k.m',
                        style: TextStyle(
                          fontFamily: 'Noto Kufi Arabic',
                          fontSize: 14.sp,
                          color: const Color(0xff003e4f),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

Container servicesPlacesItem(String neighborhood) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: const Color(0xff007c9d),
    ),
    child: Center(
      child: Text(
        neighborhood,
        style: TextStyle(
          fontFamily: 'JF Flat',
          fontSize: 20.sp,
          color: const Color(0xffffffff),
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
