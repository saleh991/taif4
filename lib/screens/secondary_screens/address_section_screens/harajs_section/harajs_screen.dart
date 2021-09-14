import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taif/models/haraj_category.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/harajs_section/haraj_detailes_screen.dart';

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
        actions: [InkWell(onTap:(){
          Navigator.pushNamed(context, notificationsRoute);
        },child: Image.asset('images/notification_icon.png'))],      ),
      body: BlocProvider(
        create:
            (context) => LocationsCubit()..getHarajCategory()..getUserData()
             ,
        child: BlocConsumer<LocationsCubit,LocationsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var harajsCubit = LocationsCubit
                .get(context)
                .harajModel;
            var categoryCubit = LocationsCubit.get(context).harajCategory;
            var cubitG = LocationsCubit.get(context);
            var userCubit = LocationsCubit.get(context).userDataModel;

            if  (state is HarajsSuccessState)
             {
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
                                items: categoryCubit.data!.map((value) {
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
                                  cubitG.changeValue(id);
                                  print('value1 $value1');
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

                      SizedBox(
                        width: 354.w,
                        height: 51.h,
                        child: languagesButton(
                          title:'أضافة أعلان جديد',
                          function: () {
                            Navigator.pushNamed(context, addressConditionRoute);
                          },
                          color: Color(0xFF007C9D),
                        )),
                    SizedBox(
                      height: 25.h,
                    ),
                    ListView.builder(
                        itemCount: harajsCubit.data!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BlocProvider(
                            create: (context)=>LocationsCubit()..getHarajCategoryById(id: cubitG.harajModel.data![index].id!),
                            child: BlocConsumer<LocationsCubit,LocationsState>(
                              listener: (context, state){},
                              builder: (context, state){
                                var cubit = LocationsCubit.get(context).harajOnlyCategory;
                                if(state is GetHarajCategoryIdSuccessState){
                                  return Container(
                                    width: 394.w,
                                    height: 120.h,
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
                                    child: harajslistViewItem(
                                        categoryName: cubit.data!.name!,
                                        harajModel: harajsCubit,
                                        index: index,
                                        //screenType: screenType,
                                        function: () {
                                          Navigator.push(context,MaterialPageRoute(builder: (context)=>HarajDetailsScreen(data: harajsCubit.data![index],)));
                                        }),
                                  );

                                }else{
                                  return Center(
                                    child: SizedBox(),
                                  );
                                }
                              },
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
