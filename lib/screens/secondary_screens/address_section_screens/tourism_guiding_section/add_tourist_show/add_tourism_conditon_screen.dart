import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/haraj_category.dart';
import 'package:taif/models/haraj_category.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/cubit.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/states.dart';

import 'add_tourism_screen.dart';


// ignore: must_be_immutable, camel_case_types
class addTourismCondtionsScreen extends StatelessWidget {

   addTourismCondtionsScreen({Key? key,
  }) : super(key: key);
  EstatesCubit cu=EstatesCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'شروط إضافة عرض سياحي',
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
      body:SingleChildScrollView(
        child: BlocProvider(
          create: (context)=>cu..getTermsAndAgreements(id: 5),
          child: BlocConsumer<EstatesCubit, EstatesState>(
              listener: (context, state) {},
              builder: (context, state) {
                var cubit = EstatesCubit.get(context).termsModel;
                if(state is GetTermsSuccessState) {
                  return   Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 28.h,
                      ),
                      SizedBox(
                        height: 681.h,
                        child: Stack(children: [
                          Center(
                            child: Container(
                              width: 383.w,
                              height: 601.h,
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xffd5ddeb),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'دفع الرسوم والشروط',
                                    style: TextStyle(
                                      fontFamily: 'JF Flat',
                                      fontSize: 22,
                                      color: const Color(0xff002a36),
                                      decoration: TextDecoration.underline,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    cubit.data!.content!,
                                    style: TextStyle(
                                      fontFamily: 'JF Flat',
                                      fontSize: 16,
                                      color: const Color(0xff003e4f),
                                    ),
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                            ),
                          ),
                          PositionedDirectional(
                              top: 0,
                              start: 0,
                              end: 0,
                              child: Center(child: Image.asset('images/map.png')))
                        ]),
                      ),
                      SizedBox(
                          width: 354.w,
                          height: 51.h,
                          child: languagesButton(
                            title: 'أتعهد وأوافق على الشروط',
                            function: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddTouristShowScreen(
                                )),
                              );
                            },
                            color: Color(0xFF007C9D),
                          )),
                      SizedBox(
                        height: 35.h,
                      )
                    ],
                  );
                }
                else{
                  return Container(
                    height: 700.h,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }

          ),
        ),
      ),

    );
  }
}
