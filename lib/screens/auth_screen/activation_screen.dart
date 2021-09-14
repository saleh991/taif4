import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:taif/components/components.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/auth_screen/edit_first_time.dart';
import 'package:taif/models/user_data_model.dart';
import 'package:taif/screens/auth_screen/register_screen/cubit/cubit.dart';
import 'package:taif/screens/auth_screen/register_screen/cubit/state.dart';

class ActivationScreen extends StatefulWidget {
final String phone;

  ActivationScreen(this.phone);

  @override
  _ActivationScreenState createState() => _ActivationScreenState();
}

class _ActivationScreenState extends State<ActivationScreen> {
  UserDataModel userDataModel = UserDataModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/3screen.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 124, 157, 1).withOpacity(.14),
                    spreadRadius: .001,
                    blurRadius: 10,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: context.locale == Locale('en') ? 570.h : 524.h,
              width: 396.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Image.asset(
                      'images/check_img.png',
                      height: 143.h,
                      width: 143.w,
                    ),
                    SizedBox(
                      height: 52.h,
                    ),
                    Text(
                      'act_title'.tr(),
                      style: TextStyle(
                        fontFamily: fontName,
                        fontSize: 30.sp,
                        color: Color(0xff399432),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'act_sub1'.tr(),
                      style: TextStyle(
                        fontFamily: fontName,
                        fontSize: 18.sp,
                        color: Color(0xff007c9d),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    Text(
                      'act_sub2'.tr(),
                      style: TextStyle(
                        fontFamily: fontName,
                        fontSize: 20,
                        color: const Color(0xff8a97af),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 33,
                    ),
                    BlocProvider(
                      create: (context)=>RegisterCubit()..getUserData(),
                      child: BlocConsumer<RegisterCubit,RegisterState>(
                        listener: (context,state){},
                        builder: (context,state){
                          var cubit = RegisterCubit.get(context);
                          return SizedBox(
                            height: 55.h,
                            width: 364.w,
                            child: defaultButton(
                                function: () {
                                  AppController.instance.hasLogin(true);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditFirstProfileScreen(cubit.userDataModel),
                                    ),
                                  );
                                },
                                title: 'act_btn'.tr()),
                          );
                        },

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
