import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taif/components/components.dart';

import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/user_data_model.dart';
import 'package:taif/screens/primary_screens/membership_screen/cubit/cubit.dart';
import 'package:taif/screens/primary_screens/membership_screen/cubit/state.dart';
import 'package:taif/screens/primary_screens/membership_screen/member_details_screen.dart';
class MembershipScreenSub extends StatefulWidget {
  UserDataModel user;
  MembershipScreenSub({required this.user});





  @override
  _MembershipScreenSubState createState() => _MembershipScreenSubState();
}


class _MembershipScreenSubState extends State<MembershipScreenSub> {
  @override
  void initState() {


    super.initState();
  }




  @override

  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'الباقات',
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
      body: BlocProvider(

        create: (context) => PackagesCubit()..getUserData(),
        child: BlocConsumer<PackagesCubit, PackagesState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            var price=widget.user.data!.currentSub!.package!.cost;
            var count=widget.user.data!.currentSub!.package!.adsCount;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Container(
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
                                  widget.user.data!.currentSub!.package!.name!,
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
                                if( widget.user.data!.end!=null)
                                  Text(
                                    widget.user.data!.end!,
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
                              membershipDetails(v: '$count اعلان'),
                              SizedBox(
                                height: 7.h,
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  }





