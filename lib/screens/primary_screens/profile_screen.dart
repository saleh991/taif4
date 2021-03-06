import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/share.dart';
import 'package:taif/components/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/auth_screen/edit_profile/cubit/cubit.dart';
import 'package:taif/screens/auth_screen/edit_profile/cubit/state.dart';
import 'package:taif/screens/auth_screen/edit_profile/edit_profile_screen.dart';

import 'membership_screen/membership_screen.dart';
import 'membership_screen/membership_screen_sub.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var cubit;


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249, 251, 255, 1),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.5.w),
          child: Column(
            children: [
              BlocProvider(
                create: (context) => ProfileCubit()..getUserData(),
                child: BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                     cubit = ProfileCubit.get(context).userDataModel;
                    // var editCubit = ProfileCubit.get(context).name;
                    if (state is ProfileSuccessState) {
                      print('my edit name is ${cubit.data!.name}');
                      return Container(
                        child: Column(
                          children: [
                            CircleAvatar(
                              maxRadius: 50.h,
                              backgroundImage: NetworkImage(
                                'https://taif-app.com/storage/app/${cubit.data!.image ?? 'events/-1630236184.jfif'}',
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            if (state is EditProfileSuccessState)

                              Text(
                                '${cubit.data!.name}',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 20.sp,
                                  color: const Color(0xff003e4f),
                                  letterSpacing: -0.58,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            if (state is ProfileSuccessState)
                              Column(
                                children: [

                                  SizedBox(height: 6,),

                                  Text(
                                    '${cubit.data!.name}',
                                    style: TextStyle(
                                      fontFamily: 'JF Flat',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.sp,
                                      color: const Color(0xff003e4f),
                                      letterSpacing: -0.58,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                  ),

                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (cubit.data!.currentSub!=null)
                                        Text(
                                          '??????????',
                                          style: TextStyle(
                                            fontFamily: 'JF Flat',
                                            fontSize: 20.sp,
                                            color: const Color(0xff003e4f),
                                            letterSpacing: -0.58,
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      else
                                        Text(
                                          '?????? ??????????',
                                          style: TextStyle(
                                            fontFamily: 'JF Flat',
                                            fontSize: 20.sp,
                                            color: const Color(0xff003e4f),
                                            letterSpacing: -0.58,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),



                                      SizedBox(width: 5,),

                                      if (cubit.data!.currentSub != null)
                                        Text(
                                          '( ${cubit.data!.currentSub!.package!.name} )',
                                          style: TextStyle(
                                            fontFamily: 'JF Flat',
                                            fontSize: 19.sp,
                                            color: Color.fromRGBO(0, 62, 79, 1),
                                          ),
                                        ),

                                    ],
                                  )

                                ],
                              ),
                            SizedBox(
                              height: 3.h,
                            ),

                            if (cubit.data!.currentSub != null)
                              if(cubit.data!.end!=null)
                              Text(
                                '${cubit.data!.end}',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 16.sp,
                                  color: Color.fromRGBO(149, 160, 178, 1),
                                ),
                              ),
                            if (cubit.data!.currentSub != null)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '?????? ?????????????????? ??????????????: ',
                                    style: TextStyle(
                                      fontFamily: 'JF Flat',
                                      fontSize: 19.sp,
                                      color: Color.fromRGBO(149, 160, 178, 1),
                                    ),
                                  ),
                                  Text(
                                    '${cubit.data!.currentSub!.package!.adsCount}',
                                    style: TextStyle(
                                      fontFamily: 'JF Flat',
                                      fontSize: 16.sp,
                                      color: Color.fromRGBO(149, 160, 178, 1),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              profileItemSvg(
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(),
                      ),
                    ).then((value) => setState(() {}));
                  },
                  color: Color(0xFF009fcf),
                  widthImge:23.0 ,
                  height:24.0 ,
                  title: '?????????? ???????? ????????????',
                  icon: 'images/profile.svg'
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItemSvg(
                color: Color(0xFF009fcf),
                function: () {
                  Navigator.pushNamed(context, searchRoute);
                },
                title: '??????',
                height: 18.0,
                widthImge: 18.0,
                icon: 'images/search.svg',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),

              profileItemSvg(
                function: () {
                  Navigator.pushNamed(context, myAdsRoute);
                },
                color: Color(0xFF009fcf),
                height: 21.0,
                widthImge: 24.0,
                title: '????????????????',
                icon: 'images/myAdds.svg',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItemSvg(
                height: 23.0,
                widthImge: 25.0,
                color: Color(0xFF009fcf),
                function: () {
                  Navigator.pushNamed(context, favoriteRoute);
                },
                title: '??????????????',
                icon: 'images/favorite_heart.svg',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItemSvg(
                function: () {
                  Navigator.pushNamed(context, englishSectionRoute);
                },
                height: 23.0,
                widthImge: 18.0,
                color: Color(0xFF009fcf),
                title: '?????????? ??????????????????',
                icon: 'images/terms.svg',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItem(
                function: () {
                  Navigator.pushNamed(context, chatsRoute);
                },
                title: '??????????????????',
                icon: 'images/chat.png',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),


              profileItemSvg(
                function: () {
                  Navigator.pushNamed(context, "/order");
                },
                color: Color(0xFF009fcf),
                height: 21.0,
                widthImge: 24.0,
                title: '?????????? ??????????????',
                icon: 'images/myAdds.svg',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),


              // profileItemSvg(
              //   function: () {
              //     if(cubit!=null)
              //       {
              //         if (cubit.data!.currentSub != null)
              //           {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(builder: (context) => MembershipScreenSub(user: cubit,)),
              //             );
              //           }
              //         else{
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) => MembershipScreen(sub: 0,)),
              //           );
              //         }
              //
              //       }
              //
              //   },
              //   title: '?????? ????????????????????',
              //   icon: 'images/member_card.svg',
              //   height: 18.0,
              //   widthImge: 22.0,
              //   color: Color(0xFF009fcf),
              // ),
      
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItemSvg(
                function: () {},
                title: '?????????????? ??????????????????',
                icon: 'images/terms.svg',
                height: 23.0,
                widthImge: 18.0,
                color: Color(0xFF009fcf),
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItemSvg(
                function: () {
                  Share.share('check out my website https://www.facebook.com');


                },
                title: '???????? ??????????????',
                icon: 'images/share.svg',
                height: 21.0,
                widthImge: 20.0,
                color: Color(0xFF009fcf),
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItemSvg(
                function: () {
                  Navigator.pushNamed(context, contactRoute);
                },
                title: '?????????? ????????',
                icon: 'images/call.svg',
                height: 23.0,
                widthImge: 20.0,
                color: Color(0xFF009fcf),
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              SizedBox(
                height: 58.h,
              ),
              BlocConsumer<ProfileCubit,ProfileState>(
                listener: (context, state){},
                builder: (context, state){
                  var cubit = ProfileCubit.get(context);
                  return Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 20.h),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, loginRoute, (route) => false);
                        AppController.instance.logout();
                        cubit.logout();
                        print('user data model${cubit.userDataModel.data}');
                        print('user id${AppController.instance.getId()}');
                        print('user loggerdin ${AppController.instance.loggedIn()}');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '?????????? ????????',
                            style: TextStyle(
                              fontFamily: 'JF Flat',
                              fontSize: 15.sp,
                              color: const Color(0xfff90808),
                              letterSpacing: -0.3,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(
                            Icons.logout,
                            size: 28.h,
                            color: Color.fromRGBO(6, 161, 203, 1),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
