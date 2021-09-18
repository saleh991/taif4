import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/estate_model.dart';
import 'package:taif/screens/primary_screens/estates_section/cubit/states.dart';

import 'cubit/cubit.dart';

class EstateScreen extends StatefulWidget {
  @override
  State<EstateScreen> createState() => _EstateScreenState();
}

class _EstateScreenState extends State<EstateScreen> {
  String value = 'اختر القسم';
  int id = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        leading: Icon(Icons.menu),
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
        actions: [InkWell(onTap:(){
          Navigator.pushNamed(context, notificationsRoute);
        },child: Image.asset('images/notification_icon.png'))],      ),
      body: BlocProvider(
        create: (context) => EstatesCubit()..getUserData(),
        child: BlocConsumer<EstatesCubit, EstatesState>(
          listener: (context, state) {
            if(state is GoToContractState){
              Navigator.popAndPushNamed(context, contractsRoute);
            }
            if(state is GoToDocumentationState){
              Navigator.popAndPushNamed(context, documentationRoute);
            }
          },
          builder: (context, state) {
            var cubit = EstatesCubit.get(context).estateModel;
            var cubitCategory = EstatesCubit.get(context).mapModel.data;
            var userCubit = EstatesCubit.get(context).userDataModel;
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
                                  if (userCubit.data!.currentSub != null)
                                    {
                                      if (userCubit.data!.currentSub!.remainningAds != 0)
                                      {
                                        Navigator.pushNamed(
                                            context, adsConditionRoute);
                                      }
                                      else{
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.INFO,
                                          animType: AnimType.BOTTOMSLIDE,
                                          title: 'الاشتراك',
                                          desc: 'غير مشترك حتى تتمكن من اضافة مواضيع في العقار يمكنك الاشتراك بأحد الباقات',
                                          btnCancelOnPress: () {},
                                          btnOkOnPress: () {},
                                        )..show();
                                      }
                                    }

                                    else{
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.INFO,
                                        animType: AnimType.BOTTOMSLIDE,
                                        title: 'الاشتراك',
                                        desc: 'غير مشترك حتى تتمكن من اضافة مواضيع في العقار يمكنك الاشتراك بأحد الباقات',
                                        btnCancelOnPress: () {},
                                        btnOkText: 'الاشتراك الان',
                                        btnOkOnPress: () {
                                          Navigator.pushNamed(context, membershipRoute);
                                        },
                                        btnCancelText: 'الاشتراك لاحقا',
                                      )..show();
                                    }
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
                            padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFF06A1CB), width: 1.0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Center(
                              child: DropdownButtonHideUnderline(
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: DropdownButton<String>(
                                    iconEnabledColor: Color(0xFF06A1CB),
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    hint: Text(
                                      '$value',
                                      style: TextStyle(color: Color(0xFF06A1CB),fontFamily: fontName),
                                    ), // Not necessary for Option 1
                                    items: cubitCategory!.main![0].categories!
                                        .map((value) {
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
                          Container(
                            height: 42.h,
                            width: 154.w,
                            padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xff06a1cb)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'عرض عبر الخريطة',
                                  style: TextStyle(
                                    fontFamily: fontName,
                                    fontSize: 15,
                                    color: const Color(0xff007c9d),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Image.asset(
                                  'images/map.png',
                                  height: 22.h,
                                  width: 25.w,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    itemsListView(
                      function: () {},
                      estateModel: EstateModel(
                          data: cubit.data,
                          status: cubit.status,
                          code: cubit.code),
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
    );
  }
}
