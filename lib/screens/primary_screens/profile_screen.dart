import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'package:taif/components/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/helper/constants.dart';
import 'package:taif/screens/auth_screen/edit_profile/cubit/cubit.dart';
import 'package:taif/screens/auth_screen/edit_profile/cubit/state.dart';
import 'package:taif/screens/auth_screen/edit_profile/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late var cubit;

  @override
  void initState() {
    super.initState();
    ProfileCubit.get(context).getUserData();
    Future.delayed(Duration(seconds: 3), () {
      cubit = ProfileCubit.get(context).userDataModel;
    });
    // print('${ProfileCubit.get(context).userDataModel}');
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
                    var cubit = ProfileCubit.get(context).userDataModel;
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
                                  fontSize: 29.sp,
                                  color: const Color(0xff003e4f),
                                  letterSpacing: -0.58,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            if (state is ProfileSuccessState)
                              Column(
                                children: [

                                  Text(
                                    '${cubit.data!.name}',
                                    style: TextStyle(
                                      fontFamily: 'JF Flat',
                                      fontSize: 29.sp,
                                      color: const Color(0xff003e4f),
                                      letterSpacing: -0.58,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 14.h,
                                  ),
                                  if (cubit.data!.currentSub!=null)
                                    Text(
                                      'مشترك',
                                      style: TextStyle(
                                        fontFamily: 'JF Flat',
                                        fontSize: 23.sp,
                                        color: const Color(0xff003e4f),
                                        letterSpacing: -0.58,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  else
                                    Text(
                                      'غير مشترك',
                                      style: TextStyle(
                                        fontFamily: 'JF Flat',
                                        fontSize: 23.sp,
                                        color: const Color(0xff003e4f),
                                        letterSpacing: -0.58,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                ],
                              ),
                            SizedBox(
                              height: 3.h,
                            ),
                            if (cubit.data!.currentSub != null)
                              Text(
                                '${cubit.data!.currentSub!.package!.name}',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 19.sp,
                                  color: Color.fromRGBO(0, 62, 79, 1),
                                ),
                              ),
                            if (cubit.data!.currentSub != null)
                              Text(
                                '${cubit.data!.end}',
                                style: TextStyle(
                                  fontFamily: 'JF Flat',
                                  fontSize: 19.sp,
                                  color: Color.fromRGBO(149, 160, 178, 1),
                                ),
                              ),
                            if (cubit.data!.currentSub != null)
                              Row(
                                children: [
                                  Text(
                                    'عدد الاعلانات المتبقي: ',
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
                                      fontSize: 19.sp,
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
              profileItem(
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(),
                      ),
                    ).then((value) => setState(() {}));
                  },
                  title: 'تعديل ملفي الشخصي',
                  icon: 'images/edit_profile_icon.png'),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItem(
                function: () {
                  Navigator.pushNamed(context, searchRoute);
                },
                title: 'بحث',
                icon: 'images/search.png',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItem(
                function: () {
                  Navigator.pushNamed(context, myAdsRoute);
                },
                title: 'إعلاناتي',
                icon: 'images/ads_icon.png',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItem(
                function: () {
                  Navigator.pushNamed(context, favoriteRoute);
                },
                title: 'المفضلة',
                icon: 'images/heart.png',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItem(
                function: () {
                  Navigator.pushNamed(context, englishSectionRoute);
                },
                title: 'القسم الانكليزي',
                icon: 'images/terms.png',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItem(
                function: () {
                  Navigator.pushNamed(context, chatsRoute);
                },
                title: 'المحادثات',
                icon: 'images/chats.png',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItem(
                function: () {
                  Navigator.pushNamed(context, membershipRoute);
                },
                title: 'خطط الاشتراكات',
                icon: 'images/member_card.png',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItem(
                function: () {
                  Navigator.pushNamed(context, addAdRoute3);
                },
                title: 'أعلن معنا',
                icon: 'images/add_ads.png',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItem(
                function: () {},
                title: 'اتفاقية الاستخدام',
                icon: 'images/terms.png',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItem(
                function: () {
                  Share.share('check out my website https://www.facebook.com');


                },
                title: 'شارك التطبيق',
                icon: 'images/share.png',
              ),
              Divider(
                height: 0,
                thickness: 1.5,
              ),
              profileItem(
                function: () {
                  Navigator.pushNamed(context, contactRoute);
                },
                title: 'تواصل معنا',
                icon: 'images/terms.png',
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
                            'تسجيل خروج',
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
