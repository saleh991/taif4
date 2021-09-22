
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/address_detailes_screen.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';

class AddressScreen extends StatelessWidget {


  var value = 'اختر نشاط';
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
          "مواقع تهمك بالطائف",
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
            (context) => LocationsCubit()..getLocationsCategory()..getUserData(),
        child: BlocConsumer<LocationsCubit,LocationsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var locationsCubit = LocationsCubit
                .get(context)
                .locationModel;
            var locationCategory = LocationsCubit.get(context).locationsCategory;
            var userCubit = LocationsCubit.get(context).userDataModel;
            var cubitG = LocationsCubit.get(context);

            if ((state is LocationsSuccessState && locationsCubit.data != null)
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
                    Container(
                      width: ScreenUtil().screenWidth - 40,
                      height: 55.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: const Color(0xffffffff),
                        border:
                            Border.all(width: 1.0, color: const Color(0xffd5ddeb)),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Image.asset('images/placeholder.png'),
                          title: StatefulBuilder(
                            builder: (context, setState){
                              return DropdownButton<String>(
                                isExpanded: true,
                                iconSize: 35,
                                iconEnabledColor: Color(0xFF007C9D),
                                hint: Text(
                                  '$value',
                                  style: TextStyle(color: Color(0xFF06A1CB)),
                                ),
                                items: locationCategory.data!.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value.name,
                                    child: new Text('${value.name}'),
                                    onTap: (){
                                      id = value.id!;
                                    },
                                  );

                                }).toList(),
                                onChanged: (value1) {
                                  setState(() {
                                    value = value1!;
                                  });
                                  cubitG.changeLocationValue(id);
                                  print('id $id');
                                },
                              );
                            },

                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                   if (userCubit.data!.currentSub != null)
                      if (userCubit.data!.currentSub!.remainningAds != 0)
                    Column(
                      children: [
                        SizedBox(
                            width: 354.w,
                            height: 51.h,
                            child: languagesButton(
                              title:  "طلب إضافة موقع سياحي جديد",
                              function: () {
                                Navigator.pushNamed(context, addressConditionRoute);
                              },
                              color: Color(0xFF007C9D),
                            )),
                        SizedBox(
                          height: 12.h,
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        SizedBox(
                            width: 354.w,
                            height: 51.h,
                            child: languagesButton(
                              title:  "طلب إضافة موضوع سياحي جديد",
                              function: () {
                                Navigator.pushNamed(context, addSubjectCondtionsRoute);
                              },
                              color: Color(0xFF007C9D),
                            )),
                        SizedBox(
                          height: 12.h,
                        ),
                      ],
                    ),

                    SizedBox(
                        width: 354.w,
                        height: 51.h,
                        child: languagesButton(
                          title:  "الارشاد السياحي",
                          function: () {
                            Navigator.pushNamed(context, tourismGuidingRoute);
                          },
                          color: Color(0xFFFFBF00),
                        )),
                    SizedBox(
                      height: 25.h,
                    ),
                    ListView.builder(
                        itemCount: locationsCubit.data!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {

                          return Container(
                            width: 394.w,
                            height: 140.h,
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
                            child: secondlistViewItem(
                                locationModel: locationsCubit,
                                index: index,
                                function: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>AddressDetailsScreen(data: locationsCubit.data![index],)));
                            }),
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
