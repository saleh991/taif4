import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/harajs_section/haraj_detailes_screen.dart';
import 'haraj_conditon_screen.dart';

class HarajsScreen extends StatelessWidget {
  var value = 'اختر القسم';
  var id = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          'حراج الطائف',
          style: TextStyle(
            fontFamily: fontName,
            fontSize: 20.sp,
            color: const Color(0xff007c9d),
          ),
        ),
        actions: [
          InkWell(onTap:(){
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
          ),)
        ],
      ),
      body: BlocProvider(
        create: (context) => LocationsCubit()
          ..getHarajCategory()
          ..getUserData(),
        child: BlocConsumer<LocationsCubit, LocationsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var harajsCubit = LocationsCubit.get(context).harajModel;
            var categoryCubit = LocationsCubit.get(context).harajCategory;
            var cubitG = LocationsCubit.get(context);


            if (state is HarajsSuccessState) {
              return SingleChildScrollView(
                child: SizedBox(
                  width: ScreenUtil().screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),

                       // * Drowp Down List
                      Container(
                        padding: EdgeInsets.all(2.h),
                        width: ScreenUtil().screenWidth - 40,
                        height: 55.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xffffffff),
                          border: Border.all(
                              width: 1.0, color: const Color(0xffd5ddeb)),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Row(
                              children: [
                                // Image.asset(
                                //   'images/placeholder.png',
                                //   height: 32.h,
                                //   width: 32.w,
                                // ),
                                //
                                SvgPicture.asset("images/placeholder.svg",
                                  height: 32.h,
                                  width: 32.w,
                                ),
                                SizedBox(width: 16.w,),
                                Expanded(
                                  child: StatefulBuilder(
                                    builder: (context, setState) {
                                      return DropdownButton<String>(
                                        underline: Container(),
                                        isExpanded: true,
                                        iconSize: 35.sp,
                                        iconEnabledColor: Color(0xFF007C9D),
                                        hint: Text(
                                          '$value',
                                          style: TextStyle(color: Color(0xFF06A1CB)),
                                        ),
                                        items: categoryCubit.data!.map((value) {
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
                                      );
                                    },
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),



                      // * 'أضافة حراج
                      SizedBox(
                          width: 354.w,
                          height: 51.h,
                          child: languagesButton(
                            title: 'أضافة موضوع جديد',
                            function: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => HarajCondtionsScreen(
                              //             harajCategory: categoryCubit,
                              //           )),
                              // );

                              // print(categoryCubit.data!.length);
                            },
                            color: Color(0xFF007C9D),
                          )),
                      SizedBox(
                        height: 25.h,
                      ),
                      for (int index = 0;
                          index < harajsCubit.data!.length;
                          index++)
                        Container(
                          width: 394.w,
                          height: 135.h,
                          margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                                width: 1.0, color: const Color(0xffcee3fb)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x1fd5ddeb),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          // child: harajslistViewItem(
                          //     categoryName:
                          //         harajsCubit.data![index].category!.name!,
                          //     harajModel: harajsCubit,
                          //     index: index,
                          //
                          //     function: () {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //               builder: (context) =>
                          //                   HarajDetailsScreen(
                          //                     data: harajsCubit.data![index],
                          //                   )));
                          //     }),
                        ),
                      SizedBox(
                        height: 25.h,
                      ),
                    ],
                  ),
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
    );
  }
}
