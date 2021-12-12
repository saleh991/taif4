import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart' as easy_localization;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/states.dart';
import 'package:taif/screens/primary_screens/estates_section/estate_details2_screen.dart';
import '../../../global.dart';
import 'ads_conditions_screen.dart';
import 'cubit/cubit.dart';
import 'estate_map.dart';

class EstateScreen extends StatefulWidget {
  @override
  State<EstateScreen> createState() => _EstateScreenState();
}

class _EstateScreenState extends State<EstateScreen> {
  String value = 'اختر القسم';
  int id = 0;
  bool showMap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'العقارات',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [
          InkWell(onTap: () {
            Navigator.pushNamed(context, notificationsRoute);
          }, child: Padding(
            padding: EdgeInsets.symmetric(
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


      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
          EstatesCubit()
            ..getUserData(),
          child: BlocConsumer<EstatesCubit, EstatesState>(
            listener: (context, state) {
              if (state is GoToContractState) {
                Navigator.popAndPushNamed(context, contractsRoute);
              }
              if (state is GoToDocumentationState) {
                Navigator.popAndPushNamed(context, documentationRoute);
              }
            },
            builder: (context, state) {
              var cubit = EstatesCubit
                  .get(context)
                  .estateModel;
              var cubitCategory = EstatesCubit
                  .get(context)
                  .mapModel
                  .data;
              // var userCubit = EstatesCubit
              //     .get(context)
              //     .userDataModel;
              var cubitG = EstatesCubit.get(context);
              if (state is EstatesSuccessState && cubit.data != null) {
                print('${cubit.data!.length}');
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'images/estate_cover.png',
                            height: 230.h,
                            width: 414.w,
                            fit: BoxFit.contain,
                          ),
                          PositionedDirectional(
                            bottom: 15.h,
                            end: 20.w,
                            child: languagesButton(
                              title: 'اضف اعلانك  +',
                              function: () {
                                // if (userCubit.data!.currentSub != null) {
                                //   if (userCubit.data!.currentSub!.remainningAds !=
                                //       0) {
                                //     Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //               AdsConditionScreen(
                                //                 payType: 'sub',
                                //               )),
                                //     );
                                //   } else {
                                //     AwesomeDialog(
                                //       context: context,
                                //       dialogType: DialogType.INFO,
                                //       animType: AnimType.BOTTOMSLIDE,
                                //       title: 'الاشتراك',
                                //       desc:
                                //           'غير مشترك حتى تتمكن من اضافة مواضيع في العقار يجب الاشتراك بأحد الباقات او البيع مقابل نسبة',
                                //       btnCancelOnPress: () {
                                //         Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (context) =>
                                //                   AdsConditionScreen(
                                //                     payType: 'per',
                                //                   )),
                                //         );
                                //       },
                                //       btnOkText: 'الاشتراك الان',
                                //       btnOkOnPress: () {
                                //         Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (context) =>
                                //                   MembershipScreen(
                                //                     sub: 0,
                                //                   )),
                                //         );
                                //       },
                                //       btnCancelText: 'البيع مقابل نسبة',
                                //     )..show();
                                //   }
                                // } else {
                                //   AwesomeDialog(
                                //     context: context,
                                //     dialogType: DialogType.INFO,
                                //     animType: AnimType.BOTTOMSLIDE,
                                //     title: 'الاشتراك',
                                //     desc:
                                //         'غير مشترك حتى تتمكن من اضافة مواضيع في العقار يجب الاشتراك بأحد الباقات او البيع مقابل نسبة',
                                //     btnCancelOnPress: () {
                                //       Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 AdsConditionScreen(
                                //                   payType: 'per',
                                //                 )),
                                //       );
                                //     },
                                //     btnOkText: 'الاشتراك الان',
                                //     btnOkOnPress: () {
                                //       Navigator.push(
                                //         context,
                                //         MaterialPageRoute(
                                //             builder: (context) =>
                                //                 MembershipScreen(
                                //                   sub: 0,
                                //                 )),
                                //       );
                                //     },
                                //     btnCancelText: 'البيع مقابل نسبة',
                                //   )..show();
                                // }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AdsConditionScreen(
                                            payType: 'sub',
                                          )),
                                );
                              },
                              color: Color.fromRGBO(87, 195, 77, 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 14.h,
                      ),



                      Container(
                        width: 394.w,
                        height: 71.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                            Container(
                              height: 42.h,
                              width: 154.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 4.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xFF06A1CB), width: 1.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: DropdownButtonHideUnderline(
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: DropdownButton<String>(
                                      iconEnabledColor: Color(0xFF06A1CB),
                                      iconSize: 30.sp,
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      hint: Text(
                                        '$value',
                                        style: TextStyle(
                                            color: Color(0xFF06A1CB),
                                            fontFamily: fontName,
                                            fontSize: 18.sp),
                                      ),
                                      // Not necessary for Option 1
                                      items: [
                                        if (cubitCategory!
                                            .main![0].categories!.length >
                                            0)
                                          cubitCategory.main![0].categories![0],
                                        if (cubitCategory
                                            .main![0].categories!.length >
                                            1)
                                          cubitCategory.main![0].categories![1],
                                        if (cubitCategory
                                            .main![0].categories!.length >
                                            2 &&
                                            Global.hideDocumentations == 0)
                                          cubitCategory.main![0].categories![2],
                                        if (cubitCategory
                                            .main![0].categories!.length >
                                            3 &&
                                            Global.hideContracts == 0)
                                          cubitCategory.main![0].categories![3],
                                      ].map((value) {
                                        return DropdownMenuItem<String>(
                                          value: value.name,
                                          child: new Text('${value.name}'),
                                          onTap: () {
                                            id = value.id!;
                                          },
                                        );
                                      }).toList(),
                                      onChanged: (value1) {
                                        setState(() {
                                          value = value1!;
                                        });
                                        cubitG.changeValue(id);
                                        print('value1 $value1');
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),



                            InkWell(
                              onTap: () {
                                // showMap = !showMap;
                                // setState(() {});
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      EstateMap(
                                        estateModels: EstateModel(
                                            data: cubit.data,
                                            status: cubit.status,
                                            code: cubit.code),
                                      )),
                                );
                              },
                              child: Container(
                                height: 42.h,
                                width: 154.w,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 2.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      width: 1.0, color: Color(0xff06a1cb)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [

                                    Expanded(
                                        child: Text(
                                          !showMap
                                              ? 'عرض عبر الخريطة'
                                              : 'عرض القائمة',
                                          style: TextStyle(
                                            fontFamily: fontName,
                                            fontSize: 14,
                                            color: const Color(0xff007c9d),
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                        )
                                    ),
                                    if (!showMap)
                                      Image.asset(
                                        'images/map.png',
                                        height: 22,
                                        width: 25,
                                      )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),




                      // * -----------------------------
                      if (!showMap)
                        itemsListView2(
                            function: () {},
                            estateModel: EstateModel(
                                data: cubit.data,
                                status: cubit.status,
                                code: cubit.code))
                      // itemsListView(
                      //     function: () {},
                      //     estateModel: EstateModel(
                      //         data: cubit.data,
                      //         status: cubit.status,
                      //         code: cubit.code))
                      else
                        SizedBox(
                          height: 465.h,
                          width: ScreenUtil().screenWidth - 40,
                          child: EstateMap(
                            estateModels: EstateModel(
                                data: cubit.data,
                                status: cubit.status,
                                code: cubit.code),
                          ),
                        ),
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  ListView itemsListView2({
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

                  // * ------------------------------------Image
                  Container(
                    height: 80.w,
                    width: 80.w,
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: "https://taif-app.com/storage/app/${estateModel
                          .data![index].mainImage}",

                      errorWidget: (context, url, error) =>
                          Image.asset('images/ee.png', fit: BoxFit.fill,),
                      imageBuilder: (context,
                          imageProvider) { // you can access to imageProvider
                        return CircleAvatar( // or any widget that use imageProvider like (PhotoView)
                          backgroundImage: imageProvider,
                        );
                      },
                    ),


                  ),

                  // * ------------------------------------All

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


                        // * ------------------------------------Title
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


                        // * ------------------------------------Fiirst
                    Expanded(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                      Expanded(
                      child:Row(
                              children: [
                                SvgPicture.asset(
                                  "images/save.svg", height: 14, width: 12,),
                                SizedBox(
                                  width: 7.h,
                                ),

                                Text(
                                  estateModel.data![index].type_ar??'',
                                  style: TextStyle(
                                    fontFamily: 'JF Flat',
                                    fontSize: 15,
                                    color: const Color(0xFF007C9D),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            ),

                            Expanded(
                              child:Row(
                              children: [
                                SvgPicture.asset(
                                  "images/person.svg", height: 14, width: 12,),
                                SizedBox(
                                  width: 7.h,
                                ),

                                Text(
                                  estateModel.data![index].user!.name??'',
                                  style: TextStyle(
                                    fontFamily: 'JF Flat',
                                    fontSize: 15,
                                    color: const Color(0xFF007C9D),
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
                          height: 10.h,
                        ),


                        // * ------------------------------------2
                    Expanded(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                      Expanded(
                      child:Row(
                              children: [
                                SvgPicture.asset(
                                  "images/save.svg", height: 14, width: 12,),
                                SizedBox(
                                  width: 7.h,
                                ),

                                Text(
                                  estateModel.data![index].district??'',
                                  style: TextStyle(
                                    fontFamily: 'JF Flat',
                                    fontSize: 15,
                                    color: const Color(0xFF007C9D),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            ),

                            Expanded(
                              child:Row(
                              children: [
                               Icon(Icons.access_time_outlined,color: Color(0xff007c9d),size: 22,),
                                // SvgPicture.asset(
                                //   "images/person.svg", height: 14, width: 12,),
                                SizedBox(
                                  width: 7.h,
                                ),

                                Text(
                                        easy_localization.DateFormat('yyyy-MM-dd', 'en').format(
                                                DateTime.parse(estateModel.data![index].
                                                createdAt.toString())),
                                            style: TextStyle(
                                              fontFamily: 'JF Flat',
                                              fontSize: 13.sp,
                                              color: const Color(0xff007c9d),
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
                          height: 13.h,
                        ),
                      ],
                    ),
                  ),


                  SizedBox(
                    width: 20.w,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
