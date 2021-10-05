import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:taif/screens/secondary_screens/public_services_screens/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/public_services_screens/cubit/states.dart';
import 'package:taif/screens/secondary_screens/public_services_screens/services_provider_details_screen.dart';

class ServicesProviderScreen extends StatelessWidget {
  var value = 'إختر النشاط';
  int id = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFEFF2F7),
            elevation: 0,
            iconTheme: IconThemeData(color: Color(0xFF003E4F)),
            centerTitle: false,
            title: Text(
              'مقدموا الخدمات',
              style: TextStyle(
                fontFamily: fontName,
                fontSize: 20.sp,
                color: const Color(0xff007c9d),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, notificationsRoute);
                },
                child: Image.asset('images/notification_icon.png'),
              ),
            ],
          ),
          body: BlocProvider(
            create: (context) => ServicesCubit()..getServicesCategory(),
            child: BlocConsumer<ServicesCubit, ServicesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var cubitG = ServicesCubit.get(context);
                  var cubit = ServicesCubit.get(context).servicesModel;
                  if (state is ServicesByCategorySuccessState ||
                      state is ServicesSuccessState) {
                    print('success ServicesSuccessState');
                    return SingleChildScrollView(
                      child: SizedBox(
                        width: ScreenUtil().screenWidth,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
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
                                  padding: EdgeInsets.symmetric(
                                      vertical: 2.h, horizontal: 6.w),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'images/placeholder.png',
                                        height: 30.h,
                                        width: 30.w,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Expanded(
                                        child: StatefulBuilder(
                                          builder: (context, setState) {
                                            return DropdownButton<String>(
                                              isExpanded: true,
                                              iconSize: 35,
                                              iconEnabledColor:
                                                  Color(0xFF007C9D),
                                              hint: Text(
                                                '$value',
                                                style: TextStyle(
                                                  fontFamily: 'JF Flat',
                                                  fontSize: 16,
                                                  color:
                                                      const Color(0xff3a3a3a),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
// Not necessary for Option 1
                                              items: cubitG
                                                  .homeServiceCategoriesModel
                                                  .data!
                                                  .map((value) {
                                                return DropdownMenuItem<String>(
                                                  value: value.name,
                                                  child:
                                                      new Text('${value.name}'),
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
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: cubit.data!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                      alignment: Alignment.center,
                                      height: 68.h,
                                      width: 407.w,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 15.w, vertical: 5.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: const Color(0xa1ffffff),
                                        border: Border.all(
                                            width: 1.0,
                                            color: const Color(0xa1c5c0c0)),
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 10,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(
                                            width: 25.w,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${cubit.data![index].name}',
                                                style: TextStyle(
                                                  fontFamily: fontName,
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xff754dad),
                                                ),
                                              ),
                                              Text(
                                                '${cubit.data![index].category!.name}',
                                                style: TextStyle(
                                                  fontFamily: fontName,
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xfff70909),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(child: SizedBox()),
                                          defaultButton(
                                              function: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ServicesProviderDetailsScreen(
                                                                data: cubit
                                                                        .data![
                                                                    index])));
                                                // Navigator.pushNamed(
                                                //     context, servicesProviderDetailsRoute);
                                              },
                                              title: 'عرض'),
                                          SizedBox(
                                            width: 25.w,
                                          )
                                        ],
                                      ));
                                })
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )),
    );
  }
}
