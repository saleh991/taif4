import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'guide_detailes_screen.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';

class AllGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          "عرض المرشدين السياحين",
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [InkWell(onTap:(){
          Navigator.pushNamed(context, notificationsRoute);
        },child: Image.asset('images/notification_icon.png'))],      ),
      body: BlocProvider(
        create:
            (context) => LocationsCubit()..getAllGuide(),
        child: BlocConsumer<LocationsCubit,LocationsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var guideCubit = LocationsCubit
                .get(context)
                .guideModel;


            if ((state is GuidingSuccessState && guideCubit.data != null)
            ) {
              return SingleChildScrollView(
              child: SizedBox(
                width: ScreenUtil().screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),

                    ListView.builder(
                        itemCount: guideCubit.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 394.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                  width: 1.0, color:  Color(0xffcee3fb)),
                              boxShadow: [
                                BoxShadow(
                                  color:  Color(0x1fd5ddeb),
                                  offset: Offset(0, 3),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                horizontal: 8.w
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        guideCubit.data![index].name.toString(),
                                        style: TextStyle(
                                          fontFamily: 'JF Flat',
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff003e4f),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6.h,
                                      ),
                                      Row(
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
                                          SizedBox(
                                            width: 52.w,
                                          ),
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
                                                '200',
                                                style: TextStyle(
                                                  fontFamily: 'JF Flat',
                                                  fontSize: 13.sp,
                                                  color: const Color(0xff7a90b7),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                  languagesButton(
                                    title:  "عرض",
                                    function: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => GuideDetailsScreen(
                                          data: guideCubit.data![index],
                                        )),
                                      );
                                    },
                                    color: Color(0xFF007CfD),
                                  ),

                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
                        );
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
