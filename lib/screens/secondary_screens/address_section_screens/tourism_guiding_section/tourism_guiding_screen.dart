import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/components/components.dart';
import 'package:taif/helper/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'tourism_guiding_detailes_screen.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/cubit.dart';
import 'package:taif/screens/secondary_screens/address_section_screens/cubit/states.dart';
import 'all_guide_screen.dart';
import 'add_guide_conditon_screen.dart';

class TourismGuidingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEFF2F7),
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF003E4F)),
        centerTitle: false,
        title: Text(
          "الارشاد السياحي",
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
            (context) => LocationsCubit()..getGuiding(),
        child: BlocConsumer<LocationsCubit,LocationsState>(
          listener: (context, state) {
            print("state");
            print(state);
            print("state");
          },
          builder: (context, state) {
            var guidingCubit = LocationsCubit
                .get(context)
                .guidingModel;


            if ((state is GuidingSuccessState && guidingCubit.data != null)
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

                    Padding(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: languagesButtonWithIcon(
                                title:  "سجل مرشد سياحي",
                                icon: Icon(
                                  Icons.add,
                                ),
                                function: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AddGuideCondtionsScreen()),
                                  );


                                },
                                color: Color(0xFF007C9D),
                              )),
                          SizedBox(
                            width: 12.w,
                          ),

                          Expanded(

                              child: languagesButton(
                                title:  "عرض كل المرشدين",
                                function: () {
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>
                                      AllGuideScreen()));
                                },
                                color: Color(0xFF4CBB17),
                              )),

                        ],
                      ),
                    ),


                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                      height: 660.h,
                      child: ListView.builder(
                          itemCount: guidingCubit.data!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 394.w,
                              height: 120.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                    width: 1.0, color:  Color(0xffcee3fb)),
                                boxShadow: [
                                  BoxShadow(
                                    color:  Color(0x1fd5ddeb),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: tourismGuidingViewItem(
                                guidingModel: guidingCubit,
                                  index: index,
                                  function: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>TourismGuidingDetailsScreen(data: guidingCubit.data![index],)));
                              }),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 66.h,
                    ),
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
